variable "vm_name" {
  description = "Name of VM"
  default = "devops-app-vm"
}

variable "image" {
  description = "Image path"
#   default = "/C:\\Users\\-\\VirtualBoxVMs\\Ubuntu24.vdi"
  default = "https://sourceforge.net/projects/osboxes/files/v/vb/55-U-u/24.10/64bit.7z/download"
}

# variable "image" {
#   description = "Image Path"
# #   default     = "file:///C:/Users/-/VirtualBoxVMs/Ubuntu%2024.10%20(64bit).vdi"
#   default = "https://app.vagrantup.com/ubuntu/boxes/focal64/versions/20240809.0.0/providers/virtualbox.box"
# }

variable "cpu_counts" {
  description = "VM CPU Counts"
  default     = 1
}

variable "memory" {
  description = "VM Memory"
  default     = 512
}

variable "network_adapter_type" {
  type        = string
  description = "Type of Network Adapter (nat, bridged, hostonly)"
  default = "nat"
}

variable "host_interface" {
  type        = string
  description = "Host Interface (если используется bridged, например, 'eth0'); для NAT можно оставить пустым"
  default = ""
}

variable "ssh_password" {
  description = "SSH password for VM user"
  default     = "ubuntu"
}