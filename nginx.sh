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

# Verifica se Nginx è già installato
if command -v nginx &> /dev/null; then
    print_status "Nginx è già installato." "installed"
else
    # Installa Nginx
    print_status "Installazione di Nginx in corso..." "installing"
    sudo apt update
    sudo apt install -y nginx
    sudo usermod -aG www-data $USER

    # Verifica se l'installazione è riuscita
    if command -v nginx &> /dev/null; then
        print_status "Nginx è stato installato correttamente." "installed"
    else
        print_status "Si è verificato un problema durante l'installazione di Nginx." "error"
    fi
fi
