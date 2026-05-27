terraform {
  required_version = "~> 1.14.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.68.0"
    }
  }
  cloud {
    organization = "INSURANCE-ORG"
    workspaces {
      name = "Insurance-dev"
    }
  }
}
provider "azurerm" {
  features {
    app_configuration {
      purge_soft_delete_on_destroy = true
      recover_soft_deleted         = true
    }
  }
  use_oidc = true
}