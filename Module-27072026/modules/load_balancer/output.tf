data "azurerm_public_ip" "pip" {

for_each = var.lb

  name                = each.value.publicip_name
  resource_group_name = each.value.resource_group_name
}

# data "azurerm_lb" "example" {

#   for_each = var.lb
#   name                = each.value.name
#   resource_group_name = each.value.resource_group_name

  
# }

data "azurerm_network_interface" "example" {
    for_each = var.nic
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}

# data "azurerm_lb_backend_address_pool" "example" {
#   for_each = var.lb
  
#   name            = each.value.backpool
#   loadbalancer_id = data.azurerm_lb.example[each.key].id
# }

