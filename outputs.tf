output "vm_ip" {
  value = element(virtualbox_vm.node.network_adapter[*].ipv4_address, 0)
}