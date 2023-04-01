
module "az-resource-group" {
  source         = "../modules/rg"
  az_rg_name     = var.az_rg_name
  az_rg_location = var.az_rg_location
  env            = var.env
}

module "vnet" {
  source         = "../modules/virtual_network"
  vnet_name      = var.vnet_name
  vnet_spase     = var.vnet_spase
  az_rg_location = module.az-resource-group.az-rg-location
  az_rg_name     = module.az-resource-group.az-rg-name
  env            = var.env
}

module "subnet" {
  source     = "../modules/subnet"
  az_rg_name = module.az-resource-group.az-rg-name
  vnet_name  = module.vnet.vnet-name
  varsubnet  = var.varsubnet
  env        = var.env
  /*depends_on = [
  module.vnet
]*/
}

module "nsg" {
  source         = "../modules/NSG"
  nsg_name       = var.nsg_name
  az_rg_location = module.az-resource-group.az-rg-location
  az_rg_name     = module.az-resource-group.az-rg-name
  env            = var.env
}


resource "azurerm_subnet_network_security_group_association" "association_nsg" {

  subnet_id                 = module.subnet.subnet_id["subnet1"]
  network_security_group_id = module.nsg.group_id
}

module "nsg_rules" {
  source     = "../modules/nsg_rule"
  az_rg_name = module.az-resource-group.az-rg-name
  nsg_name   = module.nsg.nsg_name
  varrule    = var.varrule
  env        = var.env
}


resource "azurerm_public_ip" "az_pip" {
  name                    = "pip-${var.env}"
  location                = module.az-resource-group.az-rg-location
  resource_group_name     = module.az-resource-group.az-rg-name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30

}

resource "azurerm_network_interface" "nic1_pub" {
  name                = "${var.pub_nic_1}-${var.env}"
  location            = module.az-resource-group.az-rg-location
  resource_group_name = module.az-resource-group.az-rg-name


  ip_configuration {
    name                          = "ip_configuration1"
    subnet_id                     = module.subnet.subnet_id["subnet1"]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.az_pip.id
  }

}
resource "azurerm_network_interface" "nic2_priv" {
  name                = "pub_nic_2-${var.env}"
  location            = module.az-resource-group.az-rg-location
  resource_group_name = module.az-resource-group.az-rg-name


  ip_configuration {
    name                          = "ip_configuration2"
    subnet_id                     = module.subnet.subnet_id["subnet2"]
    private_ip_address_allocation = "Dynamic"
  }
}


module "VM_subnet_pub" {
  source = "../modules/vm"

  az_rg_location = module.az-resource-group.az-rg-location
  az_rg_name     = module.az-resource-group.az-rg-name
  AzureVM_Name   = var.AzureVM_Name_pub
  nic_id         = azurerm_network_interface.nic1_pub.id
  Compute_name   = var.compname_pub
  osdisk         = var.osdisk1
  env            = var.env
}
module "VM_subnet_priv" {
  source = "../modules/vm"

  az_rg_location = module.az-resource-group.az-rg-location
  az_rg_name     = module.az-resource-group.az-rg-name
  AzureVM_Name   = var.AzureVM_Name_priv
  nic_id         = azurerm_network_interface.nic2_priv.id
  Compute_name   = var.Compname_priv
  osdisk         = var.osdisk2
  env            = var.env
}
