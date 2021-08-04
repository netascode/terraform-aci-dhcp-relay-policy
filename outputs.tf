output "dn" {
  value       = aci_rest.dhcpRelayP.id
  description = "Distinguished name of `dhcpRelayP` object."
}

output "name" {
  value       = aci_rest.dhcpRelayP.content.name
  description = "DHCP relay policy name."
}
