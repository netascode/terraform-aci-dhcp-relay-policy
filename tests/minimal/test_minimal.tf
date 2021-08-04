terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

resource "aci_rest" "fvTenant" {
  dn         = "uni/tn-TF"
  class_name = "fvTenant"
}

module "main" {
  source = "../.."

  tenant = aci_rest.fvTenant.content.name
  name   = "DHCP-RELAY1"
}

data "aci_rest" "dhcpRelayP" {
  dn = module.main.dn

  depends_on = [module.main]
}

resource "test_assertions" "dhcpRelayP" {
  component = "dhcpRelayP"

  equal "name" {
    description = "name"
    got         = data.aci_rest.dhcpRelayP.content.name
    want        = module.main.name
  }
}
