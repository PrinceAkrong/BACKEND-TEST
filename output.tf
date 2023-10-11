# output.tf

output "storage_account_connection_string" {
  value = azurerm_storage_account.st_acc.primary_connection_string
}

output "storage_account_name" {
  value = azurerm_storage_account.st_acc.name
}
