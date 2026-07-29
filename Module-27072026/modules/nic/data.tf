data "azurerm_subnet" "subnet" {
 for_each = var.nic
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name 
}

# # output "subnet_id" {
# #   for_each = var.nic
# #   value = data.azurerm_subnet.subnet[each.key].id
# # }
data "azurerm_public_ip" "pip" {
for_each = var.nic
  name                = each.value.publicip_name
  resource_group_name = each.value.resource_group_name
}



# # output "public_ip_address" {
# #   for_each = var.nic
# #   value = data.azurerm_public_ip.pip[each.key].ip_address
# # }



