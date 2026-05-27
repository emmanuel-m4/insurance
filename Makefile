# Automation 
IMAGE_NAME = insurance:dev
CONTAINER_NAME = insurance-dev
BUILD_PATH = src/Server/Insurance.Server.csproj

.PHONY: help all lint build clean test run watch container scout stop

help:
	@echo "Available targets:"
	@echo "all 		- Run all targets (lint, build, test)"
	@echo "lint     	- Apply consistent formatting across files"
	@echo "build		- Build server project"
	@echo "test		- Run tests"
	@echo "run 		- Run the server project"
	@echo "container  - Run the application in container using Docker Compose"
	@echo "scout    - Run Scout to view CVEs in dependencies"
	@echo "stop" 	- Stop the running dev container

all: lint build test container

lint:
	@echo "[MAKE] Checking files for formatting inconsistencies..."
	@dotnet format src/Insurance.sln --verbosity diagnostic
	@terraform fmt ./infra/terraform > /dev/null
	@echo "Linting completed"

build:
	@echo "[MAKE] Building Server project..."
	@dotnet build --no-restore $(BUILD_PATH) -warnaserror

clean:
	@rm -rf bin obj

test:
	@echo "[MAKE] Running tests..."
	@dotnet test src --no-build --verbosity detailed --collect "XPlat Code Coverage" --results-directory=src/Test/Results --logger trx

run:
	@dotnet run --project $(BUILD_PATH)

watch:
	@dotnet watch --project $(BUILD_PATH)

container:
	@echo "[MAKE] Building Docker image..."
	@docker compose --project-directory=src up --build -d

scout:
	@echo "[MAKE] Running Scout for dependency analysis..."
	@docker scout cves $(IMAGE_NAME) --only-vuln-packages --format markdown > docker-scout.md
stop:
	@echo "[MAKE] Stopping dev container..."
	@docker container stop $(CONTAINER_NAME)