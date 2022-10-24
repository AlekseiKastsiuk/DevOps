variable "nsg_name" {
  type = string
}

variable "az_rg_name" {
  description = "The Name of the Resource Group"
  type        = string
}
variable "varrule" {
  type = map(any)

}
variable "env" {
  
}