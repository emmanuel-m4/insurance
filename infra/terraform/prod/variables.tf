variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
  default     = "West US 2"
}

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "Insurance"
}

variable "sql_admin_password" {
  description = "The password for the SQL administrator account."
  type        = string
  sensitive = true
}

variable "sql_admin_username" {
  description = "The username for the SQL server"
  type = string
  sensitive = true
}

variable "resourcegroup_location"{
  description = "The Azure region where the resource group currently exits"
  type = string
  default = "EAST US"
}

variable "username" {
  description = "Azure username"
  type = string
  sensitive = true
}