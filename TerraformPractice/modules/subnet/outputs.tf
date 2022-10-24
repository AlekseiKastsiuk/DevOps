output "subnet_id" {
  #value = azurerm_subnet.subnet.*.id
  value = { for k, v in azurerm_subnet.subnet : k => v.id }
}