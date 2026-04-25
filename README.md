# Projeto: Calculadora em Shell Script

Este repositório contém o meu primeiro projeto prático, desenvolvido para exercitar a integração entre scripts de automação e lógica de programação.

## Descrição do Projeto
O objetivo deste projeto é fornecer uma calculadora funcional diretamente pelo terminal. O script gerencia a interação com o usuário, processa os dados inseridos e retorna o resultado da operação matemática escolhida.

---

## Como executar o arquivo .sh

Para rodar a calculadora no seu ambiente local (Linux, macOS ou Git Bash no Windows), siga os passos abaixo:

1. **Dar permissão de execução:**
   Abra o terminal na pasta do arquivo e digite:
   ```bash
   chmod +x calculadora.sh

## Executar o script
    ./calculadora.sh
    O script solicitará os números e a operação desejada diretamente no terminal.

# Lógica do Projeto
  > O código foi estruturado para realizar operações matemáticas básicas via linha de comando.
  
  ## O que o código faz:

* Coleta de Dados: O script utiliza o comando read (ou inputs do sistema) para capturar dois números digitados pelo usuário.
* Seleção de Operação: Apresenta um menu para escolher entre Soma, Subtração, Multiplicação ou Divisão.
* Processamento: Utiliza estruturas condicionais (como if/else ou case) para identificar a operação escolhida e realizar o cálculo matemático.
* Exibição: O resultado é impresso na tela de forma clara para o usuário.

      Tecnologias utilizadas: Shell Script para automação de interface de terminal e Python para a lógica de cálculo
