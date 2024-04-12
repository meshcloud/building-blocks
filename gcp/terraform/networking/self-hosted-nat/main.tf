resource "google_compute_instance" "nat" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-11"
    }
  }

  network_interface {
    network            = var.network
    subnetwork         = var.subnetwork == "" ? null : var.subnetwork
    subnetwork_project = var.subnetwork_project == "" ? var.project : var.subnetwork_project
    network_ip         = var.ip_address_type == "INTERNAL" ? google_compute_address.nat.address : null

    dynamic "access_config" {
      for_each = var.ip_address_type == "INTERNAL" ? [] : [1]

      content {
        nat_ip = google_compute_address.nat.address
      }
    }

  }

  can_ip_forward = true

  metadata_startup_script = <<EOF
export IP_ADDRESS=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/ip)
export INTERFACE=$(ip -4 -o a | cut -d ' ' -f 2,7 | grep "$IP_ADDRESS" | awk '{print $1}')
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o $INTERFACE -j MASQUERADE

EOF
}

resource "google_compute_address" "nat" {
  name         = var.name
  address_type = var.ip_address_type
  subnetwork   = var.subnetwork == "" ? null : var.subnetwork
}

resource "google_compute_route" "nat" {
  name                   = "through-${var.name}"
  network                = var.network
  next_hop_instance_zone = google_compute_instance.nat.zone
  next_hop_instance      = google_compute_instance.nat.name
  dest_range             = "0.0.0.0/0"
  priority               = 100 # less than default internet route (i.e. 1000)

  tags = [var.tag]
}
