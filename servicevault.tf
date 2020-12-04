resource "azurerm_recovery_services_vault" "vault" {
  name                = "Terraform-recovery-vault"
  location            = "westeurope"
  resource_group_name = "TFResourceGroup"
  sku                 = "Standard"
}