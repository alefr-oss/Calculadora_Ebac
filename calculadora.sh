#!/bin/bash

LOG_FILE="historico_calculos.txt"

# Função silenciosa para tratar os números
limpar_numero() {
    echo "$1" | tr -d '.' | tr ',' '.'
}

while true; do
    clear
    echo "=== CALCULADORA DATA PRO ==="
    # O cabeçalho agora indica como ver as opções
    echo "Dica: Digite 'ajuda' para ver os comandos."
    
    if [ -f "$LOG_FILE" ]; then
        echo -n "Última: "
        tail -n 1 "$LOG_FILE" | cut -d '-' -f 2-
    fi
    echo "----------------------------"

    read -p "Operação ou comando: " entrada
    entrada=$(echo "$entrada" | tr '[:upper:]' '[:lower:]')

    # 1. Comando de AJUDA
    if [[ "$entrada" == "ajuda" || "$entrada" == "?" || "$entrada" == "help" ]]; then
        echo -e "\n--- COMANDOS DISPONÍVEIS ---"
        echo "Soma:          1, +, soma, adicao"
        echo "Subtração:     2, -, sub, menos"
        echo "Multiplicação: 3, *, mult, vezes"
        echo "Divisão:       4, /, div, dividido"
        echo "Histórico:     5, historico"
        echo "Sair:          6, sair"
        echo "----------------------------"
        read -p "Pressione Enter para voltar..." p
        continue
    fi

    # 2. Comando de SAÍDA
    [[ "$entrada" == "sair" || "$entrada" == "6" ]] && break

    # 3. Comando de HISTÓRICO
    if [[ "$entrada" == "5" || "$entrada" == "historico" ]]; then
        echo -e "\n--- HISTÓRICO ---"
        [ -f "$LOG_FILE" ] && cat "$LOG_FILE" || echo "Vazio."
        read -p "Pressione Enter..." p; continue
    fi

    # 4. Entrada de números para cálculo
    read -p "N1: " n1_br
    read -p "N2: " n2_br

    n1=$(limpar_numero "$n1_br")
    n2=$(limpar_numero "$n2_br")

    case $entrada in
        1|"+"|"soma"|"adicao") res=$(echo "$n1 + $n2" | bc -l); op="+";;
        2|"-"|"sub"|"menos")  res=$(echo "$n1 - $n2" | bc -l); op="-";;
        3|"*"|"mult"|"vezes") res=$(echo "$n1 * $n2" | bc -l); op="*";;
        4|"/"|"div"|"dividido")
            if (( $(echo "$n2 == 0" | bc -l) )); then
                echo "Erro: Divisão por zero!"; sleep 2; continue
            fi
            res=$(echo "scale=2; $n1 / $n2" | bc -l); op="/";;
        *) echo "Comando inválido! Digite 'ajuda'."; sleep 2; continue;;
    esac

    # Formatação e Log
    res_br=$(echo "$res" | tr '.' ',')
    RESULTADO="$n1_br $op $n2_br = $res_br"
    
    echo "----------------------------"
    echo "RES: $RESULTADO"
    echo "$(date '+%d/%m/%Y %H:%M') - $RESULTADO" >> "$LOG_FILE"
    
    sleep 2
done

echo "Sistema encerrado."
