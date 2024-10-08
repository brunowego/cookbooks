resource "boundary_scope" "global" {
  description  = "Global Scope"
  global_scope = true
  name         = "global"
  scope_id     = "global"
}

resource "boundary_scope" "org" {
  name                     = "Henkiz"
  description              = "Organization scope for Henkiz"
  scope_id                 = boundary_scope.global.id
  auto_create_admin_role   = true
  auto_create_default_role = true
}

resource "boundary_scope" "keycloak" {
  name                     = "Keycloak"
  description              = "Project for Keycloak"
  scope_id                 = boundary_scope.org.id
  auto_create_admin_role   = true
  auto_create_default_role = true
}

resource "boundary_auth_method_oidc" "keycloak" {
  name                 = "Keycloak"
  description          = "Keycloak auth method for Henkiz"
  scope_id             = boundary_scope.org.id
  issuer               = "http://127.0.0.1:8080/realms/henkiz"
  client_id            = "boundary"
  client_secret        = var.keycloak_client_secret
  signing_algorithms   = ["RS256"]
  api_url_prefix       = "http://127.0.0.1:9200"
  is_primary_for_scope = true
  state                = "active-public"
}

resource "boundary_credential_store_static" "static_cred_store" {
  name        = "boundary-cred-store"
  description = "Static boundary credential store"
  scope_id    = boundary_scope.keycloak.id
}

resource "boundary_credential_username_password" "keycloak_static_db_creds" {
  name                = "keycloak_static_db_creds"
  description         = "Keycloak PostgreSQL admin credentials"
  credential_store_id = boundary_credential_store_static.static_cred_store.id
  username            = "keycloak"
  password            = "keycloak"
}

resource "boundary_managed_group" "developer" {
  name           = "Developers"
  description    = "Developer team managed group linked to Keycloak"
  auth_method_id = boundary_auth_method_oidc.keycloak.id
  filter         = "\"Developers\" in \"/token/groups\""
}

resource "boundary_managed_group" "dba" {
  name           = "Database Administrator"
  description    = "DBA team managed group linked to Keycloak"
  auth_method_id = boundary_auth_method_oidc.keycloak.id
  filter         = "\"DBA\" in \"/token/groups\""
}

resource "boundary_role" "developer" {
  name          = "Developer"
  description   = "Assing admin rights"
  principal_ids = [boundary_managed_group.developer.id]
  grant_strings = ["id=*;type=*;actions=list,read"]
  scope_id      = boundary_scope.org.id
}

resource "boundary_role" "dba" {
  name           = "DBA"
  description    = "Administrator role for ${boundary_scope.keycloak.id}"
  principal_ids  = [boundary_managed_group.dba.id]
  grant_strings  = ["id=*;type=*;actions=*"]
  grant_scope_id = boundary_scope.keycloak.id
  scope_id       = boundary_scope.org.id
}

resource "boundary_host_catalog_static" "postgresql" {
  name        = "PostgreSQL"
  description = "PostgreSQL database"
  scope_id    = boundary_scope.keycloak.id
}

resource "boundary_host_static" "postgresql" {
  type            = "static"
  name            = "PostgreSQL"
  description     = "PostgreSQL database"
  address         = "127.0.0.1"
  host_catalog_id = boundary_host_catalog_static.postgresql.id
}

resource "boundary_host_set_static" "postgresql" {
  type            = "static"
  name            = "PostgreSQL"
  description     = "Host set for PostgreSQL Database"
  host_catalog_id = boundary_host_catalog_static.postgresql.id
  host_ids        = [boundary_host_static.postgresql.id]
}

resource "boundary_target" "db_admin" {
  type                     = "tcp"
  name                     = "PostgreSQL"
  description              = "PostgreSQL Database"
  scope_id                 = boundary_scope.keycloak.id
  session_connection_limit = 2
  default_port             = 5432

  host_source_ids = [
    boundary_host_set_static.postgresql.id
  ]

  brokered_credential_source_ids = [
    boundary_credential_username_password.keycloak_static_db_creds.id
  ]
}

# resource "boundary_target" "backend_servers_ssh_target" {
#   type                     = "ssh"
#   name                     = "ssh_server_injected"
#   description              = "Backend SSH target"
#   scope_id                 = boundary_scope.org.id
#   default_port             = 22
#   session_connection_limit = -1
#   session_max_seconds      = 600
#   worker_filter            = "\"vault\" in \"/tags/type\""

#   host_source_ids = [
#     boundary_host_set_static.backend_servers_ssh.id
#   ]
# }
