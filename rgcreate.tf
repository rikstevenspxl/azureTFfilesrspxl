
resource "azurerm_resource_group" "rg" {
  name     = "TFResourceGroup"
  location = "westeurope"

  tags = {
    environment = "Terraform"
    CreatedBy   = "Admin"
  }
}