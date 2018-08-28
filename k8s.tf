resource "azurerm_kubernetes_cluster" "gophersearch" {
  name                = "gophersearch"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  dns_prefix          = "gophersearch"

  linux_profile {
    admin_username = "azureuser"

    ssh_key {
      key_data = "${tls_private_key.server.public_key_openssh}"
    }
  }

  agent_pool_profile {
    name            = "default"
    count           = 2
    vm_size         = "Standard_D1_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30

    # for agent pool profile
    vnet_subnet_id = "${module.network.vnet_subnets[1]}"
  }

  network_profile {
    network_plugin     = "azure"
    docker_bridge_cidr = "172.17.0.1/16"
    dns_service_ip     = "10.2.0.10"
    service_cidr       = "10.2.0.0/24"
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  tags {
    Environment = "dev"
  }
}
