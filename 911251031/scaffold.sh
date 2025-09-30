#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="/c/roject/911251031"
mkdir -p "$PROJECT_DIR"/{.terraform,.github/workflows}

# main.tf
cat > "$PROJECT_DIR/main.tf" <<'EOF'
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
EOF

# variables.tf (optional)
touch "$PROJECT_DIR/variables.tf"

# .gitignore
cat > "$PROJECT_DIR/.gitignore" <<EOF
.terraform/
*.tfstate
*.tfstate.*
terraform.tfvars
EOF

# README.md (escaped properly)
cat > "$PROJECT_DIR/README.md" <<'EOF'
# ☁️ Azure Resource Group via Terraform Cloud

This project deploys a single Azure resource group in East US 2 using Terraform Cloud.

## 🔧 Setup

- Configure your workspace in Terraform Cloud
- Set the following variables as **Terraform Variables** (not environment vars):

| Name            | Value (example)                          |
|-----------------|------------------------------------------|
| `client_id`     | `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`   |
| `client_secret` | `your-app-secret`                        |
| `tenant_id`     | `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`   |
| `subscription_id` | `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx` |

## 🚀 Deploy

```bash
terraform init
terraform plan
terraform apply
