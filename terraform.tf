provider "azurerm" {
  version = "1.12.0"
}

terraform {
  backend "atlas" {
    name = "niccorp/gophersearch-infra"
  }
}

// Generate a SSH Key which can be used to access the servers
resource "tls_private_key" "server" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_resource_group" "default" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"

  tags {
    environment = "dev"
  }
}
