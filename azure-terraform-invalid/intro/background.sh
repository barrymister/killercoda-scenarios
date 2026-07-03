#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
mkdir -p /root/lab
apt-get update -qq >/dev/null 2>&1 || true
apt-get install -y -qq unzip >/dev/null 2>&1 || true
if ! command -v terraform >/dev/null 2>&1; then
  TFVER=1.9.8
  curl -fsSLo /tmp/tf.zip "https://releases.hashicorp.com/terraform/${TFVER}/terraform_${TFVER}_linux_amd64.zip" >/dev/null 2>&1 || true
  unzip -o /tmp/tf.zip -d /usr/local/bin >/dev/null 2>&1 || true
fi
# Broken on purpose: no `features {}` block, and location references an
# undeclared variable `var.location`.
cat > /root/lab/main.tf <<'TF'
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
}

resource "azurerm_resource_group" "lab" {
  name     = "rg-lab"
  location = var.location
}
TF
( cd /root/lab && terraform init -input=false >/dev/null 2>&1 || true )
touch /root/.lab-ready
