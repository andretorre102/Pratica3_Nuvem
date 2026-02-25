API Feiras Agroecológicas na Nuvem (AWS + Docker)

Esta é uma Prática da Disciplina de Desenvolvimento em Nuvem da Universidade Federal do Cariri, com o objetivo de criar e hospedar uma infraestrutura conteinerizada na Amazon Web Services (AWS).

Para nuvem, usamos uma instância EC2 em Ubuntu na AWS
A orquestração se dá com Docker e Docker Compose
Backend: Python com Flask
Banco de Dados: PostgreSQL

O sistema consiste em dois contêineres se comunicando em uma rede interna. A aplicação web conecta-se ao PostgreSQL, realiza uma consulta unindo dados de feiras e seus respectivos organizadores, e expõe o resultado em formato JSON através da porta 5000.

Para rodar o Projeto em uma máquina virtual com Docker instalado, você deverá:
1. Clonar este repositório:
git clone https://github.com/andretorre102/Pratica3_Nuvem.git
2. Na VM, entrar na pasta do Projeto:
cd main
3. Subir os contêineres em segundo plano:
sudo docker-compose up -d
4. Acessar pelo seu navegador:
http://IP_DA_MAQUINA:5000

   


























