resource "azurerm_app_service_plan" "svcplan" {
  name                = "newweb-appserviceplan"
  location            = "westeurope"
  resource_group_name = "TFResourceGroup"
  sku {
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_app_service" "appsvc" {
  name                = "custom-tf-webapp-for-thestudent"
  location            = "westeurope"
  resource_group_name = "TFResourceGroup"
  app_service_plan_id = azurerm_app_service_plan.svcplan.id
  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}