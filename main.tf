resource "virtualbox_vm" "node" {
  name   = var.vm_name
  image  = var.image

  cpus   = var.cpu_counts
  memory = var.memory

  network_adapter {
    type           = var.network_adapter_type
    host_interface = var.host_interface
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y docker.io git curl",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "sudo curl -L 'https://github.com/docker/compose/releases/download/2.20.2/docker-compose-$(uname -s)-$(uname -m)' -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose",
      "git clone https://github.com/SashaLyapanov/DevOpsCompetitionSystem.git /home/ubuntu/DevOpsCompetitionSystem",
      "cd /home/ubuntu/DevOpsCompetitionSystem",
      "sudo docker-compose up -d"
    ]
    connection {
      type     = "ssh"
      user     = "ubuntu"
      password = var.ssh_password
      host     = "127.0.0.1"
      port     = 2222
    }
  }
}