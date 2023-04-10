terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "vault" {
  address = "http://127.0.0.1:8200/"
  token = "education"
}

data "vault_generic_secret" "demo" {
  path = "secret/pushpak-aws"
}

provider "aws" {
  region     = "ap-south-1"
  access_key = data.vault_generic_secret.demo.data["access_key"]
  secret_key = data.vault_generic_secret.demo.data["secret_key"]
}
