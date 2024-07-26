#!/bin/bash

# Verifica se Nextcloud è installato
if dpkg -l | grep -qw "nextcloud-client"; then
    echo "✅ Nextcloud è già installato."
else
    echo "🔧 Nextcloud non è installato. Procedo con l'installazione..."

    # Aggiungi il repository PPA
    sudo add-apt-repository ppa:nextcloud-devs/client -y

    # Aggiorna i pacchetti
    sudo apt update

    # Installa Nextcloud
    sudo apt install nextcloud-client -y

    echo "✅ Nextcloud è stato installato con successo."
fi

# Carica le variabili dal file .env
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo "File .env non trovato. Crealo con le seguenti variabili:"
    echo "LOCAL_DIR, NEXTCLOUD_URL"
fi

# Verifica se sono state fornite tutte le variabili necessarie
if [ -z "$LOCAL_DIR" ] || [ -z "$NEXTCLOUD_URL" ]; then
    echo "Tutte le variabili (LOCAL_DIR, NEXTCLOUD_URL) devono essere definite nel file .env"
fi

# Esegui nextcloudcmd senza autenticazione
nextcloudcmd "$LOCAL_DIR" "$NEXTCLOUD_URL"
