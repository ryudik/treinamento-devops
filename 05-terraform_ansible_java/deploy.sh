#!/bin/bash

cd terraform
terraform init
terraform apply -auto-approve

echo  "Aguardando a criação das maquinas ..."
sleep 5

HOST_DNS=$(terraform output | sed "s/\"//g"| sed "s/name = //g")

echo "
[ec2-java]
$HOST_DNS
" > ../ansible/hosts

cd ../ansible

ansible-playbook -i hosts configura.yml -u ubuntu --private-key ~/.ssh/acesso.pv

echo  "wget no site"
sleep 10

wget "http://$HOST_DNS"

# echo  "Acessando via SH"
# sleep 5
# ssh -i ~/Desktop/devops/treinamentoItau ubuntu@$HOST_DNS -o ServerAliveInterval=60