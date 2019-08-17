terraform {
 backend "s3" {
    bucket = "kubernetesazatstate.com"
    key = "terrastate"
    region = "us-west-2"
  }
}



