resource "azurerm_storage_account" "sa" {
  name                     = "tfstorageacc1160"
  resource_group_name      = "TFResourceGroup"
  location                 = "westeurope"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "Terraform Storage"
    CreatedBy   = "Rik Stevens"
  }
}