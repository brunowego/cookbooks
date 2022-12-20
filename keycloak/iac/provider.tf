terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.1.0"
    }
  }
}

provider "keycloak" {
  client_id = "admin-cli"
  url       = "http://127.0.0.1:8080"
  username  = "admin"
  password  = "Pa$$w0rd!"
}
