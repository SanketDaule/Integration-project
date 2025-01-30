terraform {
  backend "s3" {
    bucket         = "infra-mgmt-sanket-mumbai"
    key            = "state/terraform.tfstate" 
    region         = "ap-south-1" 
    encrypt        = true 
  }
}
