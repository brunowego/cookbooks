terraform {
  required_providers {
    boundary = {
      source  = "hashicorp/boundary"
      version = "1.1.3"
    }
  }
}

provider "boundary" {
  addr                            = "http://127.0.0.1:9200"
  auth_method_id                  = "ampw_1234567890"
  password_auth_method_login_name = "admin"
  password_auth_method_password   = "Pa$$w0rd!"
}
