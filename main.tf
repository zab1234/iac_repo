terraform {
	required_providers {
		proxmox = {
			source = "telmate/proxmox"
			version = "3.0.1-rc6"
		}
	}
}


provider "proxmox" {
	prox_api_url = var.api_url
	prox_user = var.user
	prox_api_token_secret = var.token_secret
	prox_tls_insecure = true
}

resource "proxmox_vm_qemu" "controller" {
	name = "pixie-1"
	target_node = "pve"
	clone = "redhat-template"
	storage = "local_lvm"
	cores = 2
	memory = 4048
}
