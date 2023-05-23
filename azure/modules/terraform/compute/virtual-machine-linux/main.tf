locals {
  resource_group_id_parts = split("/",var.resource_group_id)
  resource_group_name = element(local.resource_group_id_parts,length(local.resource_group_id_parts)-1)
}

data "azurerm_subnet" "main" {
  name                 = var.subnet_name
  resource_group_name  = "vmaas"
  virtual_network_name = "vmaas"
}

resource "azurerm_network_interface" "main" {
  name                = "${var.name}-nic"
  location            = "WestEurope"
  resource_group_name = local.resource_group_name

  ip_configuration {
    name      = "internal"
    primary   = true
    subnet_id = data.azurerm_subnet.main.id

    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                = var.name
  location            = "WestEurope"
  resource_group_name = local.resource_group_name

  size           = var.size
  admin_username = var.admin_username

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  network_interface_ids = [azurerm_network_interface.main.id]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.admin_ssh_public_key
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}

resource "azurerm_managed_disk" "main" {
  count = var.storage > 0 ? 1 : 0

  name                = "${var.name}-data"
  location            = "WestEurope"
  resource_group_name = local.resource_group_name

  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = var.storage
}

resource "azurerm_virtual_machine_data_disk_attachment" "main" {
  count = var.storage > 0 ? 1 : 0

  managed_disk_id    = azurerm_managed_disk.main[0].id
  virtual_machine_id = azurerm_linux_virtual_machine.main.id
  lun                = 0
  caching            = "ReadWrite"
}
