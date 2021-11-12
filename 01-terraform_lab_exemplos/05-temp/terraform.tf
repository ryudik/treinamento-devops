terraform {
  backend "remote" {
    organization = "LABRYE"

    workspaces {
      name = "work_rye"
    }
  }
}