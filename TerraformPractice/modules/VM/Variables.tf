variable "AzureVM_Name" {}
variable "az_rg_name" {
  description = "The Name of the Resource Group"
  type        = string
}
variable "az_rg_location" {
  description = "The Azure Region where the Resource Group should exist"
  type        = string
}
variable "nic_id" {
  type        = string
}
variable "Compute_name" {
  type        = string
}
variable "osdisk" {
  type = string
  
}
variable "env" {
  
}