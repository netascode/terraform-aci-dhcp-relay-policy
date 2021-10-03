<!-- BEGIN_TF_DOCS -->
[![Tests](https://github.com/netascode/terraform-aci-dhcp-relay-policy/actions/workflows/test.yml/badge.svg)](https://github.com/netascode/terraform-aci-dhcp-relay-policy/actions/workflows/test.yml)

# Terraform ACI DHCP Relay Policy Module

Manages ACI DHCP Relay Policy

Location in GUI:
`Tenants` » `XXX` » `Policies` » `Protocol` » `DHCP` » `Relay Policies`

## Examples

```hcl
module "aci_dhcp_relay_policy" {
  source  = "netascode/dhcp-relay-policy/aci"
  version = ">= 0.0.1"

  tenant      = "ABC"
  name        = "DHCP-RELAY1"
  description = "My Description"
  providers_ = [{
    ip                  = "10.1.1.1"
    type                = "epg"
    tenant              = "ABC"
    application_profile = "AP1"
    endpoint_group      = "EPG1"
  }]
}

```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aci"></a> [aci](#requirement\_aci) | >= 0.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aci"></a> [aci](#provider\_aci) | >= 0.2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tenant"></a> [tenant](#input\_tenant) | Tenant name. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | DHCP relay policy name. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description. | `string` | `""` | no |
| <a name="input_providers_"></a> [providers\_](#input\_providers\_) | List of DHCP providers. Choices `type`: `epg`, `external_epg`. | <pre>list(object({<br>    ip                      = string<br>    type                    = string<br>    tenant                  = optional(string)<br>    application_profile     = optional(string)<br>    endpoint_group          = optional(string)<br>    l3out                   = optional(string)<br>    external_endpoint_group = optional(string)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dn"></a> [dn](#output\_dn) | Distinguished name of `dhcpRelayP` object. |
| <a name="output_name"></a> [name](#output\_name) | DHCP relay policy name. |

## Resources

| Name | Type |
|------|------|
| [aci_rest.dhcpRelayP](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
| [aci_rest.dhcpRsProv](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
<!-- END_TF_DOCS -->