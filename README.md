# Terraform-Secrets-Management

---------------------------- PREFACE ---------------------------- 

Hashicorp’s Terraform is well known IaC tool and AWS is the most popular cloud provider.
In order to be able to do IaC tasks on AWS infrastructure, Terraform needs AWS credentials (access_key and secret_key) which authenticates and helps Terraform manage AWS.

In case, we want to create AWS DB instance, we would pass the access_key, secret_key along with DB_username and DB_password in configuration files (.tf files).
However, these credentials when passed in configuration files raise security concerns as they reflect in configuration files as well as terraform.tfstate file. We can keep the state file in backends like AWS S3 using straight forward way but security concerns remain regarding credentials.


In order to overcome this situation, along with Terraform we will use:
Hashicorp Vault: To store access_key and secret_key for AWS authentication.
AWS Secrets manager: To store DB_username and DB_password.

---------------------------- ABOUT ----------------------------

Author: Pushpak Badadale

Email ID: itspushpaksworld496@gmail.com

LinkedIn ID: 

Date: 2023-04-10 v1


---------------------------- END OF README FILE ----------------------------
