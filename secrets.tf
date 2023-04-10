data "aws_secretsmanager_secret_version" "creds" {
  # Fill in the name you gave to your secret
  secret_id = "MyDemoSecret"
}

locals {
  my_creds = jsondecode(
  data.aws_secretsmanager_secret_version.creds.secret_string
  )
}