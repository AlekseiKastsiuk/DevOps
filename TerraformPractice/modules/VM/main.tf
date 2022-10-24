resource "azurerm_virtual_machine" "vm_res" {
  name                  = "${var.AzureVM_Name}-${var.env}"
  location              = var.az_rg_location
  resource_group_name   = var.az_rg_name
  network_interface_ids = [var.nic_id]
  vm_size               = "Standard_B1s"
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.osdisk}-${var.env}"
    disk_size_gb      = "128"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.Compute_name
    admin_username = "vmadmin"
    admin_password = "Password12345!"
    #use keyvault
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

}
