resource "azurerm_storage_container" "lab" {
  name                  = "blobcontainer4lab"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}
resource "azurerm_storage_blob" "lab" {
  name                   = "TerraformBlob"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.lab.name
  type                   = "Block"
}
resource "azurerm_storage_share" "lab" {
  name                 = "terraformshare"
  storage_account_name = azurerm_storage_account.sa.name
  quota                = 50
}