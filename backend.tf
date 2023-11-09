terraform {
  backend "s3" {
    bucket = "prasanthkumarr"
    key = "main"
    region = "ap-south-1"
  }
}
