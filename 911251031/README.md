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
