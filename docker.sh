#!/bin/bash

# Funzione per stampare il messaggio con un'emoji
print_status() {
    if [[ $2 == "installed" ]]; then
        echo -e "$1 \xE2\x9C\x85"  # Emoji check ✅
    elif [[ $2 == "installing" ]]; then
        echo -e "$1 \xF0\x9F\x94\xA7"  # Emoji wrench 🔧
    else
        echo "$1"
    fi
}

# Verifica se Docker è già installato
if command -v docker &> /dev/null; then
    print_status "Docker è già installato." "installed"
else
    # Scarica lo script di installazione di Docker
    print_status "Download di get-docker.sh in corso..." "installing"
    curl -fsSL https://get.docker.com -o get-docker.sh

    # Esegui lo script di installazione di Docker
    print_status "Installazione di Docker tramite get-docker.sh in corso..." "installing"
    sudo sh get-docker.sh

    # Pulisci lo script di installazione di Docker
    rm get-docker.sh

    # Aggiungi l'utente corrente al gruppo Docker
    print_status "Aggiunta dell'utente al gruppo Docker in corso..." "installing"
    sudo groupadd docker
    sudo usermod -aG docker $USER

    print_status "Docker è stato installato." "installed"
fi

# Verifica se Docker Compose è già installato
if command -v docker-compose &> /dev/null; then
    print_status "Docker Compose è già installato." "installed"
else
    # Installa Docker Compose
    print_status "Installazione di Docker Compose in corso..." "installing"

    sudo apt-get install -y python3-distutils docker-compose

    print_status "Docker Compose è stato installato." "installed"
fi


