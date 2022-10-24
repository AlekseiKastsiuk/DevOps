terraform {

  required_version = ">0.13"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "de1574c2-d833-4251-bbfe-27ac881b7d88"
  tenant_id       = "b41b72d0-4e9f-4c26-8a69-f949f367c91d"
}
#remote backend config
