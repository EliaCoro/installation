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

# Verifica se PostgreSQL 16 è già installato
if psql --version | grep "PostgreSQL 16" &> /dev/null; then
    print_status "PostgreSQL 16 è già installato." "installed"
else
    print_status "Installazione di PostgreSQL 16 e pacchetti aggiuntivi in corso..." "installing"
    
    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
    curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg
    sudo apt update
    sudo apt install -y postgresql-16 postgresql-contrib-16

    # Avvia il servizio PostgreSQL
    print_status "Avvio e abilitazione del servizio PostgreSQL in corso..." "installing"
    sudo systemctl start postgresql
    sudo systemctl enable postgresql

    # Connetti come utente postgres e crea utente e database con il nome dell'utente attuale
    print_status "Creazione dell'utente e del database con il nome dell'utente attuale in corso..." "installing"
    sudo -u postgres psql -c "CREATE USER $USER SUPERUSER;"
    sudo -u postgres psql -c "CREATE DATABASE $USER;"
    sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE $USER TO $USER;"

    print_status "PostgreSQL 16 è stato installato e configurato correttamente." "installed"
fi


# Add LESS environment variable to .bashrc if not exists yet

if ! grep -q "export LESS=-XMSR" ~/.bashrc; then
    echo "export LESS=-XMSR" >> ~/.bashrc
fi