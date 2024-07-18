#!/bin/bash

# Funzione per stampare il messaggio con un'emoji
print_status() {
    if [[ $2 == "installed" ]]; then
        echo -e "$1 ✅"
    elif [[ $2 == "installing" ]]; then
        echo -e "$1 🔧"
    else
        echo "$1"
    fi
}

# Verifica se Redis è già installato
if command -v redis-server &> /dev/null; then
    print_status "Redis è già installato." "installed"
else
    # Installazione di Redis
    print_status "Installazione di Redis in corso..." "installing"
    curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
    sudo apt-get update
    sudo apt-get install -y redis-server

    # Verifica se l'installazione è riuscita
    if command -v redis-server &> /dev/null; then
        print_status "Redis è stato installato correttamente." "installed"
    else
        print_status "Si è verificato un problema durante l'installazione di Redis." "error"
    fi
fi
