🚀 SSH Remote Server Setup (VM Local)

Este projeto demonstra a configuração de um servidor Linux (Debian/Ubuntu) em uma máquina virtual, permitindo acesso remoto seguro via SSH com autenticação baseada em chaves, além da instalação do Fail2Ban para proteção contra ataques de força bruta.

🎯 Objetivos e Requisitos Atendidos

✅ Configuração de acesso SSH seguro

✅ Utilização de duas chaves SSH distintas para autenticação

✅ Criação de aliases de conexão no arquivo ~/.ssh/config

✅ Instalação e configuração do Fail2Ban (Stretch Goal)

🧩 Cenário de Teste

O ambiente foi composto por:

Host (Cliente): Máquina principal rodando Ubuntu

Guest (Servidor): Máquina virtual Debian/Ubuntu

Software de Virtualização: VirtualBox (ou similar)

O acesso remoto foi simulado via Port Forwarding:

Configuração	Valor
Modo de Rede	NAT
Porta do Host	2222
Porta do Guest	22 (SSH)
⚙️ Passo a Passo da Configuração
1️⃣ Configuração Inicial e Teste de Acesso

Com o port forwarding configurado, o acesso inicial foi testado a partir do Host:

ssh <usuario_vm>@127.0.0.1 -p 2222

2️⃣ Criação e Configuração das Chaves SSH

A autenticação via chave SSH é mais segura do que por senha.
As chaves foram geradas no Host (cliente) e as públicas copiadas para a VM.

🗝️ A. Geração das Chaves (no Host)
# Geração da Chave A e Chave B

bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/servidor_vm_a
ssh-keygen -t rsa -b 4096 -f ~/.ssh/servidor_vm_b

📤 B. Envio da Chave Pública (para a VM)
# Exemplo de envio da Chave A

bash
ssh-copy-id -i ~/.ssh/servidor_vm_a.pub -p 2222 <usuario_vm>@127.0.0.1

🔐 C. Teste de Conexão via Chave
# Teste de acesso com cada chave

bash
ssh -i ~/.ssh/servidor_vm_a -p 2222 <usuario_vm>@127.0.0.1
ssh -i ~/.ssh/servidor_vm_b -p 2222 <usuario_vm>@127.0.0.1

3️⃣ Configuração de Aliases SSH (no Host)

Para simplificar o acesso, foi configurado o arquivo ~/.ssh/config:

bash
Host vm-chave-a
    HostName 127.0.0.1
    Port 2222
    User XXXX
    IdentityFile ~/.ssh/servidor_vm_a


Agora, o acesso pode ser feito apenas com:

ssh vm-chave-a

🛡️ Stretch Goal: Segurança com Fail2Ban

O Fail2Ban foi instalado na VM para monitorar logs de acesso SSH e bloquear IPs suspeitos.

1️⃣ Instalação (na VM)
bash
sudo apt update
sudo apt install fail2ban

2️⃣ Configuração do Jail SSH
bash
Arquivo: /etc/fail2ban/jail.local

bash
[DEFAULT]
bantime = 30m
maxretry = 5

[sshd]
enabled = true

3️⃣ Verificação do Serviço

bash
sudo systemctl status fail2ban.service
sudo fail2ban-client status


✅ O serviço sshd aparece na lista de Jails, indicando que a proteção está ativa e funcionando corretamente.

🧠 Conclusão

Este projeto demonstra um setup completo e seguro de servidor SSH dentro de uma VM local, cobrindo desde a autenticação por chave até o endurecimento de segurança com o Fail2Ban.

https://roadmap.sh/projects/ssh-remote-server-setup