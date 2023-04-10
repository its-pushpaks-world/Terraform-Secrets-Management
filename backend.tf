terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "StateFiles"
    region = "ap-south-1"
  }
}
