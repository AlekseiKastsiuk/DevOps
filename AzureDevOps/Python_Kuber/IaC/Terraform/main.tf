resource "azurerm_resource_group" "this" {
  name     = var.rg_name
  location = var.rg_location
}


resource "azurerm_container_registry" "this" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.this.name
  location            = var.rg_location
  sku                 = "Standard"
  admin_enabled       = false
}


resource "azurerm_kubernetes_cluster" "this" {
  name                = var.cluster_name
  location            = var.rg_location
  resource_group_name = azurerm_resource_group.this.name
  dns_prefix          = var.cluster_name

  default_node_pool {
    name                = "default"
    node_count          = 2
    vm_size             = "Standard_DS2_v2"
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = false
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet" # CNI
  }
}

resource "azurerm_role_assignment" "role_acrpull" {
  scope                            = azurerm_container_registry.this.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.this.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
}