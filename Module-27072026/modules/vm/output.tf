data "azurerm_network_interface" "example" {
  for_each = var.vm_count
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

