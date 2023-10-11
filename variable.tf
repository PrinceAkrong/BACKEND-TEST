# variable.tf
# variable.tf

variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
}

variable "location" {
  description = "Azure region where the resources will be deployed"
  type        = string
}

variable "storage_container_name" {
  description = "Name of the Azure Storage Container"
  type        = string
}
