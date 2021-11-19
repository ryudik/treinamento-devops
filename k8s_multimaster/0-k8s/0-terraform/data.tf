data "aws_vpc" "selected" {
  filter {
    name = "tag:Name"
    values = ["${var.vpc_name}"]
  }
}

data "aws_subnet_ids" "test_subnet_ids" {
  vpc_id = "${data.aws_vpc.selected.id}"
}
data "aws_subnet" "test_subnet" {
  count = "${length(data.aws_subnet_ids.test_subnet_ids.ids)}"
  id    = "${tolist(data.aws_subnet_ids.test_subnet_ids.ids)[count.index]}"
}
