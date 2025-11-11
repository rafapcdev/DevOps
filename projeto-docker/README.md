🐳 Basic Dockerfile — "Hello, Captain!"

Este projeto demonstra como criar uma imagem Docker básica usando o Alpine Linux como base.
Ao executar o container gerado, ele imprimirá a mensagem:

"Hello, Captain!"

📦 Objetivo

Criar um Dockerfile mínimo e funcional capaz de gerar uma imagem que, ao ser executada, apenas exibe uma mensagem no console antes de encerrar.

🧱 Estrutura do Projeto
.
├── Dockerfile
└── README.md

⚙️ Requisitos

O arquivo deve se chamar Dockerfile

Deve estar no diretório raiz do projeto

Deve usar a imagem base alpine:latest

Ao ser executada, a imagem deve imprimir "Hello, Captain!"

🚀 Dockerfile (Exemplo)
# Imagem base
FROM alpine:latest

# Comando que será executado ao rodar o container
CMD ["echo", "Hello, Captain!"]

🧪 Como Testar o Projeto
1️⃣ Construir a Imagem

No diretório do projeto, execute:

docker build -t hello-captain .

2️⃣ Executar o Container
docker run --rm hello-captain


🖥️ Saída esperada:

Hello, Captain!

🧩 Desafio Extra (Opcional)

Quer deixar o projeto mais interativo?
Permita que o container receba um nome como argumento e imprima uma saudação personalizada:

FROM alpine:latest
ARG NAME=Captain
CMD ["sh", "-c", "echo Hello, $NAME!"]


E ao construir a imagem:

docker build -t hello-docker --build-arg NAME=Marcos .


Resultado esperado:

Hello, Marcos!

📚 Referências

Docker Docs – Dockerfile reference

Alpine Linux Image on Docker Hub

🧠 Conclusão

Este projeto é um ótimo ponto de partida para aprender:

A estrutura e sintaxe de um Dockerfile

O processo de build e execução de containers