provider "aws" {
  region = "sa-east-1"
}

module "criar_instancia" {
  source = "./instancia"
  nome = "Ronaldo_EC2_Module"
}
