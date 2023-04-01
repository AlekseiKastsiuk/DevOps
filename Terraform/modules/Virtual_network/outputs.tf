output "vnet-name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet-space" {
  value = azurerm_virtual_network.vnet.address_space
}