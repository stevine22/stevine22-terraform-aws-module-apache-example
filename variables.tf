variable "vpc_id" {
   type = string
   default = "vpc-0ec26d80b1e401855"
   
}

variable "my_ip_with_cidr" {
   type = string
   default = "216.246.231.154/32"
}


variable "public_key" {
   type = string
   default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCW5+8B7nbJLCIidElqDnUtjI9PWUihlgKYAvD2pa0E3CdD+CFI//5r4LFXnknwpGVoqYXKFqWn7k9oX/F7k9/wXtNm7E2GRwzd6Lihv0MW9PN/ds8Qz3a81Ku6Bj2MeWE5yN7v/MPKokZDUMFenJ8fQzU6i22iAzzKFh3uCSXYleq0bhLNDkwe8U0JWRq22UX4j8S+YH9gug7NK5mfjQ6rsSyVln1GDQZkU7Lo27nytGkBjjWq50LLGfP+uG/vLBpRof0eF9qrH/TR6lQl9/XmjU5xU1r0tr7D9keK1VEhc+el+BHXCyr2NuvqF+A3NvBLTMt/UxkuI6jBozKZQMTFzB6H0Gdx/R9eT+fRrqMvZdiqOidUn8FLR0Lqdti/JQBszlAtSsw996J21p0VE885RgYlcagCDneN8Xif86wLPSauFcDGsNkImaoIO9Ju3Qi+T2q+Lr6FRWkBHmJLzJ+PDvrMvFXA9tGZffCDNT+6QfMfbaPSAGqA2OBtJgaInwM= orianemogue@Orianes-MacBook-Pro.local"
 
}


variable "instance_type" {
  type = string 
  default = "t2.micro"
}

variable "server_name" {
  type = string 
  default = "Apache_server"
}