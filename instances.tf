data "azurerm_subnet" "tfsubnet" {
  name                 = "mySubnet"
  virtual_network_name = "myVnet"
  resource_group_name  = "TFResourceGroup"
}
resource "azurerm_public_ip" "example" {
  name                = "pubip1"
  location            = "westeurope"
  resource_group_name = "TFResourceGroup"
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}
resource "azurerm_network_interface" "example" {
  name                = "forge-nic"
  location            = "westeurope"
  resource_group_name = "TFResourceGroup"

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.tfsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}
resource "azurerm_storage_account" "sa2" {
  name                     = "forgebootdiags789"
  resource_group_name      = "TFResourceGroup"
  location                 = "westeurope"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_virtual_machine" "lab" {
  name                             = "labinstance"
  location                         = "westeurope"
  resource_group_name              = "TFResourceGroup"
  network_interface_ids            = [azurerm_network_interface.example.id]
  vm_size                          = "Standard_B1s"
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = false
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "osdisk1"
    disk_size_gb      = "128"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "labinstance"
    admin_username = "vmadmin"
    admin_password = "Pxl123!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  boot_diagnostics {
    enabled     = "true"
    storage_uri = azurerm_storage_account.sa.primary_blob_endpoint
  }
}