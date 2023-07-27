resource "azurerm_subnet" "subnet" {
  resource_group_name  = var.az_rg_name
  virtual_network_name = var.vnet_name

  for_each         = var.varsubnet
  name             = "${each.value["subnet_name"]}-${var.env}"
  address_prefixes = each.value["subnet_addres_prefix"]

}

