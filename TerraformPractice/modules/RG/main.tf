resource "azurerm_resource_group" "az-rg" {
  name     = "${var.az_rg_name}-${var.env}"
  location = var.az_rg_location

  #tags = local.all_tags
}
