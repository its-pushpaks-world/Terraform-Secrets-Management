resource "aws_db_instance" "example" {
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name              = "example"
  allocated_storage    = "10"
  # Set the secrets from AWS Secrets Manager
  username = local.my_creds.username
  password = local.my_creds.password
}
