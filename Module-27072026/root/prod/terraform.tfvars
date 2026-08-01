
  resource_groups = {
    rg1 = {
      name     = "example-rg1"
      location = "eastus"
    }
    rg2 = {
      name     = "example-rg2"
      location = "centralus"
    }
    rg3 = {
      name     = "example-rg3"
      location = "centralus"
    }

    rg4 = {
      name     = "example-rg4"
      location = "centralus"
    }
    rg5 = {
      name     = "example-rg5"
      location = "centralus"
    }

    rg6 = {
      name     = "example-rg6"
      location = "centralus"
    }
    rg7 = {
      name     = "example-rg7"
      location = "centralus"
    }
  }
  virtual_networks = {
    vnet1 = {
      name     = "example-vnet1"
      location = "centralus"
      resource_group_name = "example-rg1"
      address_space = ["10.0.0.0/16"]
    }
    vnet2 = {
      name     = "example-vnet2"
      location = "centralus"
      resource_group_name = "example-rg2"
      address_space = ["10.1.0.0/16"]
    }
}
subnets = {
    subnet1 = {
      name                 = "example-subnet1"
      resource_group_name  = "example-rg1"
      virtual_network_name = "example-vnet1"
      address_prefixes     = ["10.0.0.0/18"]
    }
    subnet2 = {
      name                 = "example-subnet2"
      resource_group_name  = "example-rg1"
      virtual_network_name = "example-vnet1"
      address_prefixes     = ["10.0.64.0/18"]
    }
    bastion_subnet1 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "example-rg1"
    virtual_network_name = "example-vnet1"
    address_prefixes     = ["10.0.128.0/18"]
  }

 

}
public_ips = {
    pip1 = {
      name     = "frontend-pip1"
      resource_group_name = "example-rg1"
      location = "centralus"
    }
    pip2 = {
      name     = "PublicIPForLB"
      resource_group_name = "example-rg1"
      location = "centralus"
    }

      pip3 = {
      name     = "ng-pip"
      resource_group_name = "example-rg1"
      location = "centralus"
    }
}




nic = {
  nic1 = {
    name                 = "nic1"
    location             = "centralus"
    resource_group_name  = "example-rg1"
    virtual_network_name = "example-vnet1"
    subnet_name          = "example-subnet1"
    publicip_name        = "frontend-pip1"
  }

  nic2 = {
    name                 = "nic2"
    location             = "centralus"
    resource_group_name  = "example-rg1"
    virtual_network_name = "example-vnet1"
    subnet_name          = "example-subnet2"
    publicip_name        = "PublicIPForLB"
  }
}
vm_count = {
  vm1 = {
   vm_name             = "vm-1"
   resource_group_name = "example-rg1"
   location            = "centralus"
   vm_size                = "Standard_D2s_v3"
   nic_name            =  "nic1"
   admin_username      = "adminuser"
   admin_password = "Password@123"
  }
  vm2 = {
   vm_name             = "vm-2"
   resource_group_name = "example-rg1"
   location            = "centralus"
   vm_size                = "Standard_D2s_v3"
   nic_name            = "nic2"
   admin_username      = "adminuser"
   admin_password = "Password@123"
  }
}
nsg = {
  nsg1 = {
    name                 = "nsg1"
    location             = "centralus"
    resource_group_name  = "example-rg1"
    nic_name            = "nic1"
   nsg_name            = "nsg1"
  }
  nsg2 = {
    name                 = "nsg2"
    location             = "centralus"
    resource_group_name  = "example-rg1"
    nic_name            = "nic2"
   nsg_name            = "nsg2"
  }
}

bastions = {
  
  bastion1={
  name                 = "bastion1"
  location             = "centralus"
  resource_group_name  = "example-rg1"
  subnet_name          = "AzureBastionSubnet"
  virtual_network_name = "example-vnet1"
  publicip_name        = "frontend-pip1"
  
}


}

nsg_nic_asso ={
  ngsnic1  ={
  nic_name ="nic1"
  resource_group_name = "example-rg1"
  nsg_name = "nsg1"
}

 ngsnic2  ={
  nic_name ="nic2"
  resource_group_name = "example-rg1"
  nsg_name = "nsg2"
}
  }



lb  = {
  lb1 ={
  name                = "TestLoadBalancer"
  location            = "centralus"
  resource_group_name = "example-rg1"
  publicip_name  = "PublicIPForLB"
  backpool  = "backpool"

  
  


 }
}

ngw ={
  
   ng1 ={

  name                 = "nat-gateway"
  location            = "centralus"
  resource_group_name = "example-rg1"
  publicip_name = "ng-pip"
 
}
}
