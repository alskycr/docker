provider "azurerm" {
  features {}
  subscription_id = "YOUR_SUBSCRIPTION_ID"
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "docker_tutorial_rg" {
  name     = "docker-tutorial-rg"
  location = "West US"
}

resource "azurerm_container_registry" "docker_tutorial_acr" {
  name                = "dockertutorialacr123"
  resource_group_name = azurerm_resource_group.docker_tutorial_rg.name
  location            = azurerm_resource_group.docker_tutorial_rg.location
  sku                 = "Basic"
  admin_enabled       = true
}
Deploy the ACR using Terraform

#terraform init
#terraform apply

#Once this script has been run, use acr-login.ps1 to login to the acr you must already be logged in via Azure CLI for this to work
