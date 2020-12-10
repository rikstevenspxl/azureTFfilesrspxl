provider "azurerm" {
  subscription_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  version         = 1.38
}
terraform {

  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-westeurope"
    storage_account_name = "csb10033fff9a9eaa23"
    container_name       = "statefile"
    key                  = "terraform.tfstate"
  }
}
