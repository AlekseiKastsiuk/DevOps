resource "azurerm_network_security_group" "nsg" {
  name                = "${var.nsg_name}-${var.env}"
  location            = var.az_rg_location
  resource_group_name = var.az_rg_name

}
