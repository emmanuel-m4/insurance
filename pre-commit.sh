#!/usr/bin/env bash
# A truncated version of my pre-commit hook
LEAKS_FILE="gitleaks-report.json"
      
echo "[HOOK] Running pre-commit checks..."
      
#Run Gitleaks before allowing commit

if ! command -v gitleaks >/dev/null 2>&1; then
  echo "[HOOK] Gitleaks not found! Please install it to enable secret scanning."
  exit 1
else
  echo "[HOOK] Running Gitleaks secret scan..."
  gitleaks detect -s . --no-banner --report-format=json -r $LEAKS_FILE
  status=$?
  if [ $status -ne 0 ]; then
    echo "[ERROR] Commit blocked: Gitleaks detected secrets."
    # Ensure gitleaks-report.json is in .gitignore
    if [ ! -f .gitignore ]; then
      echo "$LEAKS_FILE" > .gitignore
      echo "[INF] Created .gitignore and added gitleaks-report.json"
    elif ! grep -qxF "$LEAKS_FILE" .gitignore; then
      # Add newline if needed
      [ -s .gitignore ] && tail -c1 .gitignore | grep -qv $'\n' && echo >> .gitignore
      echo -e "$LEAKS_FILE" >> .gitignore
      echo "[INF] Added $LEAKS_FILE to .gitignore"
    fi
    echo "[INF] After reviewing the report and affected files, commit with --no-verify to override false positives"
    exit 1
  fi
fi

echo "[PASSED] Gitleaks scan passed."
exit 0