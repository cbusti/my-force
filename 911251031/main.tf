terraform {
  cloud {
    organization = "your-org-name" # 🔁 Replace with your Terraform Cloud org
    workspaces {
      name = "azure-rg-eastus2"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-eastus2"
  location = "East US 2"
}
