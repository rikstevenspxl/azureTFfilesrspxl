resource "azurerm_virtual_network" "myterraformnetwork" {
  name                = "myVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "westeurope"
  resource_group_name = "TFResourceGroup"

  tags = {
    environment = "Terraform VNET"
  }
}

resource "azurerm_subnet" "tfsubnet" {
  name                 = "mySubnet"
  resource_group_name  = "TFResourceGroup"
  virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
  address_prefix       = "10.0.1.0/24"
}