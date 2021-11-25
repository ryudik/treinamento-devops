<h1 align="center">
<img src="https://i.imgur.com/nwfkVsb.png" title="Cl√≠nica Pomarola" />
</h1>

<h3 align="center">
  Desafio Treinamento Devops
</h3>

<p align="center">
  <a href="#sobre o projeto">Sobre o projeto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#tecnologias">Tecnologias</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#iniciando">Iniciando</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#funcionalidades">Funcionalidades</a>
</p>

## Ì†ΩÌ±®Ì†ºÌøª‚ÄçÌ†ΩÌ≤ª Sobre o projeto

**Objetivo:** Exercitar os conhecimentos adquiridos do treinamento
eta:
- Criar uma **rede isolada** para esta aplica√ß√£o
- Criar uma **pipeline** de infraestrutura para provisionar uma imagem que ser√° utilizada em um cluster kubernetes (single master)
- Criar uma **pipeline** para provisionar um cluster Kubernetes multi master utilizando a imagem criada na pipeline de infraestrutura 
- Criar uma pipeline para provisionar o banco de dados (dev, stage, prod) que ser√° utilizado nas aplica√ß√µes que estar√£o no kubernetes. Esta base de dados, ser√° provisionada em uma inst√¢ncia privada, com acesso a Internet via Nat Gateway na mesma vpc do kubernetes multi master 
- Criar uma **pipeline** de desenvolvimento para deployar os ambientes de uma aplica√ß√£o Java (dev, stage, prod) com liga√ß√£o a um banco de dados mysql-server (utilizar o cluster kubernetes(multi master) provisionado pela pipeline de infraestrutura 

Para ver o **Reposit√≥rio do projeto**, clique aqui: [repo-desafio-final-devops](https://github.com/weslleyfs/Wes-Desafio-Final-Devops)</br>

### Ì†ΩÌ≤ª Desenvolvedores
- [Ricardo Bastos Natalino](https://github.com/)
- [Ronaldo Yudi Endo](https://github.com/ryudik)
- [Tiago R. Sartorato](https://github.com/)
- [Vinicius Faraco Gimenes](https://github.com/)
- [Weslley Ferreira Dos Santos](https://github.com/weslleyfs)

## Ì†ΩÌ∫Ä Tecnologias

Plataformas e Tecnologias que utilizamos para desenvolver este projeto:

- [AWS](https://aws.amazon.com/)
- [Linux (Ubuntu)](https://ubuntu.com/)
- [Shell Script](https://www.gnu.org/software/bash/)
- [Terraform](https://www.terraform.io/)
- [Ansible](https://www.ansible.com/)
- [Docker](https://www.docker.com/)
- [Kubernetes](https://kubernetes.io/)
- [Jenkins](https://www.jenkins.io/)
- [Mysql](https://www.mysql.com//)
- [Java](https://www.java.com/)


## Ì†ΩÌ≤ª Descri√ß√£o do Projeto

- A seguir a descri√ß√£o resumida das Pipelines e solu√ß√µes adotadas em cada  parte do projeto.

### Pr√©-requisitos



#### Cria√ß√£o da pipeline de infraestrutura para provisionar e guardar uma imagem
- [Reposit√≥rio](hhttps://github.com/weslleyfs/Wes-Desafio-Final-DEVOPS/tree/main/Build_AMI_AWS)


```

```

#### Cria√ß√£o da pipeline para provisionar um cluster Kubernetes multi master
- [Reposit√≥rio](https://github.com/weslleyfs/Wes-Desafio-Final-DEVOPS/tree/main/Build-k8s-mult-master)

```

```

#### Cria√ß√£o da pipeline para provisionar mysqls externos em redes isoladas (dev, stage, prod)

```

```

####  Cria√ß√£o da pipeline de de desenvolvimento para deploy de uma aplica√ß√£o Java nos ambientes (dev, stage, prod)
```
DB_USER=seu_usuario
DB_PASSWORD=sua_senha
DB_HOST=seu_host
DB_PORT=sua_port
DB_NAME=nome_do_banco
JWT_SECRET=seu_segredo

```

## ‚öôÔ∏è Funcionalidades
Funcionalidades que o sistema oferece:
- Cadastro e Login de Usu√°rios
- Cadastro de Clientes e Especialistas
- Cadastro de Atendimentos e de Hist√≥ricos de Prontu√°rios
- Pesquisa
	- Busca de atendimentos por Status, Paciente, Especialista, Data de agendamento ou de atendimento
- Cria√ß√£o de Agendamentos
- Criptografia de senhas
- Sistema de autentica√ß√£o de usu√°rio
- Valida√ß√£o de requisi√ß√µes
- Mensagens de erro customizadas *user friendly*
- Documenta√ß√£o dos endpoints

## Ì†ΩÌ≥Ñ Licen√ßa

Este projeto est√° sob a licen√ßa de (PomaLabs).


> Written with [StackEdit](https://stackedit.io/).
