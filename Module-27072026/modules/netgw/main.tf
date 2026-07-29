resource "azurerm_nat_gateway" "example" {

  for_each = var.ngw
  name                    = each.value.name 
  location                = each.value.location
  resource_group_name     = each.value.resource_group_name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
#   zones                   = ["1"]
}

resource "azurerm_nat_gateway_public_ip_association" "example" {

for_each = var.ngw
  nat_gateway_id       = azurerm_nat_gateway.example[each.key].id
  public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
}


resource "azurerm_subnet_nat_gateway_association" "example" {

  for_each = var.subnets
  subnet_id      = data.azurerm_subnet.subnet[each.key].id
  nat_gateway_id = azurerm_nat_gateway.example["ng1"].id
}


