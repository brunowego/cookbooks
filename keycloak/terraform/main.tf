resource "keycloak_realm" "org" {
  realm        = "henkiz"
  display_name = "Henkiz"
}

resource "keycloak_openid_client" "boundary" {
  realm_id            = keycloak_realm.org.id
  name                = "Boundary"
  client_id           = "boundary"
  access_type         = "CONFIDENTIAL"
  root_url            = "http://127.0.0.1:9200"
  base_url            = "http://127.0.0.1:9200"
  valid_redirect_uris = ["http://127.0.0.1:9200/v1/auth-methods/oidc:authenticate:callback"]
  web_origins         = ["http://127.0.0.1:9200"]

  standard_flow_enabled        = true
  direct_access_grants_enabled = true
}

# resource "keycloak_openid_client_scope" "developer" {
#   realm_id = keycloak_realm.org.id
#   name     = "developers"
# }

resource "keycloak_group" "developer" {
  realm_id = keycloak_realm.org.id
  name     = "Developers"
}

resource "keycloak_group" "dba" {
  realm_id = keycloak_realm.org.id
  name     = "DBA"
}

resource "keycloak_user" "johndoe" {
  realm_id       = keycloak_realm.org.id
  username       = "johndoe"
  email          = "johndoe@example.com"
  first_name     = "John"
  last_name      = "Doe"
  email_verified = true

  initial_password {
    value     = "Pa$$w0rd!"
    temporary = false
  }
}

resource "keycloak_user_groups" "johndoe_developer" {
  realm_id = keycloak_realm.org.id
  user_id  = keycloak_user.johndoe.id

  group_ids = [
    keycloak_group.developer.id
  ]
}
