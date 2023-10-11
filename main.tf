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

  depends_on = [azurerm_resource_group.rg]

}

resource "azurerm_storage_container" "st_acc_con" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.st_acc.name
  container_access_type = "private"

  depends_on = [azurerm_storage_account.st_acc]
}

terraform {
  backend "azurerm" {
    resource_group_name   = "RTResourcegrp"
    storage_account_name = "RTStorage"
    container_name       = "RTContainer"
    key                  = "tf_statestore"
  }
}
