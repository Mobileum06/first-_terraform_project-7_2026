resource "azurerm_lb" "example" {

  for_each = var.lb
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
 
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "example" {

  for_each = var.lb

  loadbalancer_id = azurerm_lb.example[each.key].id
  name            = each.value.backpool
}


resource "azurerm_network_interface_backend_address_pool_association" "example" {
  for_each = var.nic
  
  network_interface_id    = data.azurerm_network_interface.example[each.key].id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.example["lb1"].id
}

resource "azurerm_lb_rule" "example" {
   for_each = var.lb
  loadbalancer_id                = azurerm_lb.example[each.key].id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"

   backend_address_pool_ids = [
    azurerm_lb_backend_address_pool.example[each.key].id
  ]

  probe_id = azurerm_lb_probe.http[each.key].id
}

resource "azurerm_lb_probe" "http" {
  for_each = var.lb

  loadbalancer_id = azurerm_lb.example[each.key].id
}