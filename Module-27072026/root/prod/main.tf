module "rg" {
  source = "../../modules/rg"
  resource_groups = var.resource_groups
}

module "vnet" {
  source = "../../modules/vnet"
  virtual_networks = var.virtual_networks
  depends_on = [module.rg]
}

module "subnet" {
  source = "../../modules/subnet"
  subnets = var.subnets
  depends_on = [module.vnet]
}
module "pip" {
  source = "../../modules/ip"
  public_ips = var.public_ips
  depends_on = [module.rg]
}
module "nic" {
  source = "../../modules/nic"
  nic = var.nic
  depends_on = [module.subnet]
  }
module "vm" {
  source = "../../modules/vm"
  vm_count = var.vm_count
  depends_on = [module.nic, module.rg,module.subnet]
}
module "nsg" {
  source = "../../modules/nsg"
  nsg = var.nsg
  depends_on = [module.subnet,module.nic,module.vm,]

}

module "bastion" {
  source = "../../modules/bastion"
  bastions =  var.bastions
  depends_on = [module.subnet,module.rg,module.nic,module.pip]

}



module "nsg_nic" {
  source = "../../modules/nicnsgassociation"
  nsg_nic_asso = var.nsg_nic_asso
  depends_on = [ module.nic,module.nsg ]

}



module "loadbalancer" {
  source = "../../modules/load_balancer"
  lb =var.lb
  nic = var.nic
  depends_on = [ module.nic,module.nsg,module.rg,module.pip ]

}

module "ngw" {
  source = "../../modules/netgw"
  ngw =var.ngw
  subnets = var.subnets
  depends_on = [ module.nic,module.nsg,module.rg,module.pip ]

}

