variable "az_rg_name" {
  description = "The Name of the Resource Group"
  type        = string
}
variable "az_rg_location" {
  description = "The Azure Region where the Resource Group should exist"
  type        = string
}

variable "vnet_name" {type = string}

variable "vnet_spase" {
  type = list(any)
}

variable "nsg_name" {
  type = string

}
variable "AzureVM_Name_pub" {
  type = string
}
variable "AzureVM_Name_priv" {
  type = string
}
variable "compname_pub" {
  type = string
}
variable "Compname_priv" {
  type = string
}
variable "varsubnet" {
  type = map(any)
  default = {
    subnet1 = {
      subnet_name          = "public_subnet"
      subnet_addres_prefix = ["10.0.1.0/24"]
    }
    subnet2 = {
      subnet_name          = "privat_subnet"
      subnet_addres_prefix = ["10.0.2.0/24"]
    }
  }
}


variable "pub_nic_1" {
  type = string
}
variable "osdisk1" {
  type    = string
  default = "osdisc1"
}
variable "osdisk2" {
  type    = string
  default = "osdisc2"
}
variable "env" {
  type = string
  
}