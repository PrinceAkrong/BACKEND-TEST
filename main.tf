# main.tf
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "st_acc" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "st_acc_con" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.st_acc.name
  container_access_type = "private"
}

terraform {
  backend "azurerm" {
    resource_group_name   = var.resource_group_name
    storage_account_name =  var.storage_account_name
    container_name       = var.storage_container_name
    key                  = "terraform.tfstate"
  }
}
