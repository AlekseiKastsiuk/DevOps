variable "rg_name" {
  description = "The Name of the Resource Group"
  type        = string
  default = "Training"
}
variable "rg_location" {
  description = "The Azure Region where the Resource Group should exist"
  type        = string
  default = "East US"
}

variable "acr_name" {
  description = "The Name of the Container Registry"
  type        = string
  default = "acraleks0550"
}

variable "cluster_name" {
  description = "The Name of the kubernetes cluster"
  type        = string
  default = "aksname"
}
