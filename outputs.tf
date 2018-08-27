output "kube_config" {
  value = "${azurerm_kubernetes_cluster.gophersearch.kube_config_raw}"
}

output "bastion_host_ip" {
  value = "${azurerm_public_ip.jumpbox.fqdn}"
}
