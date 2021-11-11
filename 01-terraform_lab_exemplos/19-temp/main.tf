provider "aws" {
  region = "sa-east-1"
}

module "criar_instancia" {
  source = "git@github.com:ryudik/module.git"
  nome = "Ronaldo_EC2_Module"
}
