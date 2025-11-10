Markdown

https://roadmap.sh/projects/log-archive-tool

# 🗄️ Ferramenta de Arquivamento de Logs (Log Archive Tool)

Esta ferramenta simples em Bash foi desenvolvida para compactar e arquivar logs de um diretório especificado, armazenando-os em um local dedicado e registrando o processo.

## 🚀 Instalação e Uso

Siga os passos abaixo para configurar e executar a ferramenta.

### 1. Clonar o Repositório

Para começar, clone o repositório para a sua máquina local e navegue até o diretório do projeto:

```bash
git clone [https://github.com/your-repo/log-archiver](https://github.com/your-repo/log-archiver)
cd log-archiver
2. Tornar o Script Executável
Antes de rodar o script, você deve garantir que ele tenha permissões de execução:

Bash

chmod +x log-archive.sh
3. Executar o Script
Execute o script fornecendo o caminho para o diretório de logs que você deseja arquivar como um argumento.

Sintaxe:

```bash

./log-archive.sh <diretorio-de-log>
Exemplo: Se seus logs estiverem em /var/log/apache2:

```bash

./log-archive.sh /var/log/apache2
Resultado:

O script criará um diretório chamado archive_logs (se não existir).

O conteúdo do diretório de logs será compactado em um arquivo .tar.gz (ex: logs_archive_20251110_131500.tar.gz).

O processo será registrado em um arquivo chamado archive_log.txt.

⚙️ Requisitos do Projeto
O script atende aos seguintes requisitos:

Argumento de Linha de Comando: Aceita o diretório de log como argumento.

Compactação: Arquiva os logs em formato .tar.gz.

Armazenamento: Salva o arquivo compactado em um novo diretório (archive_logs).

Registro (Log): Registra a data e hora do arquivamento e o nome do arquivo gerado em archive_log.txt.
