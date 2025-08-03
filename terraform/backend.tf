terraform {
  backend "s3" {
    bucket         = "neerajmytfstatefile"
    key            = "neerajs.info/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "neerajs-terraform-lock"
    encrypt        = true
  }
}
