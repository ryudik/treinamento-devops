output "mysql_out" {
  value = [
    "${aws_instance.mysql_pv.private_ip} - ssh -i ~/.ssh/acesso.pv ubuntu@${aws_instance.mysql_pv.private_dns}"
  ]
}
