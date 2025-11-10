# DevOps

server-stats.sh: Analisador de Desempenho Multi-Idioma

Visão Geral

O server-stats.sh é um script de shell desenvolvido para analisar e exibir as estatísticas vitais de desempenho de qualquer servidor Linux. Sua arquitetura prioriza comandos robustos e métodos de análise independentes do idioma (locale) configurado no sistema (português, inglês, etc.), garantindo que ele funcione de forma consistente em ambientes diversos.

Objetivo: Fornecer uma visão rápida e clara sobre:

Uptime e Carga Média.

Uso Total da CPU (em porcentagem).

Uso Total da Memória (livre, usada e total).

Uso Total do Disco (partição raiz /).

Os 5 principais processos por uso de CPU e Memória.

Pré-requisitos e Dependências

Este script depende do pacote sysstat para medir o uso da CPU de forma precisa e multi-idioma (usando o comando mpstat).

Instalação Automática

O script verifica automaticamente a presença do mpstat. Se ele não estiver instalado, ele tentará instalá-lo usando o sudo apt install (distribuições baseadas em Debian/Ubuntu).

Atenção: Se você estiver em uma distribuição diferente (ex: CentOS, Fedora), o comando de instalação será diferente (use sudo yum install sysstat ou sudo dnf install sysstat) e você pode precisar executá-lo manualmente antes de rodar o script.

Como Usar

Siga estes passos para preparar e executar o script:

1. Salvar o Script

Salve o código fornecido (com a versão final) no seu servidor com o nome server-stats.sh.

2. Dar Permissão de Execução

Você deve dar permissão de execução ao arquivo para que ele possa ser executado pelo shell:

chmod +x server-stats.sh


3. Executar

Execute o script a partir do seu diretório atual:

./server-stats.sh


Exemplo de Saída (Output)

O script utiliza cores para destacar as informações principais (Uso da CPU, Total da Memória, etc.) e está estruturado em seções claras:

==================================================
# System Uptime Info #
==================================================
 12:00:00 up 1 day,  1 user,  load average: 0.50, 0.60, 0.70

# ...
########## CPU USAGE ##########
Uso da CPU: 15.42%

# ...
########## MEMORY USAGE ##########
Total:15G  Used:7.5G  Free:7.5G

# ...


Detalhes Técnicos (Design Multi-Idioma)

O script utiliza técnicas avançadas para garantir a compatibilidade universal:

Métrica

Comando e Estratégia

Por que é Multi-Idioma?

Uso da CPU

mpstat 1 1 | awk "/Average/ || /Média/ {print 100 - \$NF}"

O mpstat exibe a linha de resumo com as palavras-chave "Average" ou "Média". O script filtra por ambas (||) e calcula o uso subtraindo o último campo ($NF, que é o %idle).

Uso de Memória

free -h | grep Mem | awk

O filtro é apenas na linha Mem, e o awk usa a posição de campo ($2, $3, $4), que é consistente, ignorando a tradução dos cabeçalhos.

Uso do Disco

df -h / | awk "NR==2 {...}"

O script foca apenas na segunda linha (NR==2) da saída do df, que contém os valores da partição raiz /, ignorando o cabeçalho.