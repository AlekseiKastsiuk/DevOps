resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}-${var.env}"
  location            = var.az_rg_location
  resource_group_name = var.az_rg_name
  address_space       = var.vnet_spase
}


