# backend.tf

terraform {
  backend "azurerm" {
    resource_group_name   = "RTResourcegrp"
    storage_account_name = "RTStorage"
    container_name       = "RTContainer"
    key                  = "tf_statestore"
    depends_on = [azurerm_resource_group.your_resource_group]
  }
}
