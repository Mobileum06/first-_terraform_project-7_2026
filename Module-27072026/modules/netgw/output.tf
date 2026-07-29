data "azurerm_subnet" "subnet" {

 for_each = var.subnets
  name                 = each.value.name 
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

 data "azurerm_public_ip" "pip" {
  for_each = var.ngw
  name                = each.value.publicip_name 
  resource_group_name = each.value.resource_group_name
}