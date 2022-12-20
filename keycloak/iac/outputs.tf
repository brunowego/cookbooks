output "boundary_client_id" {
  value = keycloak_openid_client.boundary.client_id
}

output "boundary_client_secret" {
  value     = keycloak_openid_client.boundary.client_secret
  sensitive = true
}
