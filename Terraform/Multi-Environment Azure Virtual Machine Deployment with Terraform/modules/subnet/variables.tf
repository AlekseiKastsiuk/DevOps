variable "vnet_name" {
  description = "The Name of the Resource Group"
  type        = string
}
variable "az_rg_name" {
  description = "The Name of the Resource Group"
  type        = string
}

variable "varsubnet" {
  type = map(any)

}
variable "env" {
  
}