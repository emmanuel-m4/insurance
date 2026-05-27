resource "azurerm_resource_group" "resource-group" {
  name     = "${var.app_name}"
  location = var.resourcegroup_location
  managed_by = null
  tags = {}
}

resource "azurerm_mssql_server" "sqlserver" {
  administrator_login_password_wo_version = 0
  administrator_login_password_wo = var.sql_admin_password
  name = "${lower(var.app_name)}"
  resource_group_name = azurerm_resource_group.resource-group.name
  location = var.location
  version = "12.0"
  minimum_tls_version = "1.2"
  azuread_administrator {
    azuread_authentication_only = false
    login_username = ""
    object_id = ""
    tenant_id = ""
  }
  tags = {}
}

resource "azurerm_mssql_database" "sqldb" {
  name = "${var.app_name}"
  server_id = azurerm_mssql_server.sqlserver.id
  sku_name = "GP_S_Gen5_2"
  storage_account_type = "Local"
  long_term_retention_policy {
    immutable_backups_enabled = false
    monthly_retention = "PT0S"
    week_of_year = 1
    weekly_retention = "PT0S"
    yearly_retention = "PT0S"
  }
  short_term_retention_policy {
    backup_interval_in_hours = 12
    retention_days = 7
  }
  threat_detection_policy {
    disabled_alerts = []
    email_account_admins = "Disabled"
    email_addresses = []
    retention_days = 0
    state = "Disabled"
  }
  tags = {}
}