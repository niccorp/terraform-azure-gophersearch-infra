output "kube_config" {
  value = "${azurerm_kubernetes_cluster.gophersearch.kube_config_raw}"
}

output "kube_host" {
  value = "${azurerm_kubernetes_cluster.gophersearch.kube_config.0.host}"
}

output "kube_username" {
  value = "${azurerm_kubernetes_cluster.gophersearch.kube_config.0.username}"
}

output "kube_password" {
  value = "${azurerm_kubernetes_cluster.gophersearch.kube_config.0.password}"
}

output "kube_client_certificate" {
  value = "${azurerm_kubernetes_cluster.gophersearch.kube_config.0.client_certificate}"
}

output "kube_client_key" {
  value = "${azurerm_kubernetes_cluster.gophersearch.kube_config.0.client_key}"
}

output "kube_cluster_ca_certificate" {
  value = "${azurerm_kubernetes_cluster.gophersearch.kube_config.0.cluster_ca_certificate}"
}

output "jumpbox_ip" {
  value = "${azurerm_public_ip.jumpbox.fqdn}"
}

output "resource_group_name" {
  value = "${var.resource_group_name}"
}

output "resource_group_location" {
  value = "${var.location}"
}

output "server_private_key_pem" {
  value = "${tls_private_key.server.private_key_pem}"
}
