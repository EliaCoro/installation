#!/bin/bash

# Verifica se Google Chrome è già installato
if command -v google-chrome &> /dev/null; then
    echo -e "✅  Google Chrome è già installato."
else
    # Scarica il pacchetto di installazione di Google Chrome
    echo -e "🔧 Scaricamento del pacchetto di Google Chrome in corso..."
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

    # Installa Google Chrome
    echo -e "🔧 Installazione di Google Chrome in corso..."
    sudo dpkg -i google-chrome-stable_current_amd64.deb

    # Corregge eventuali dipendenze mancanti
    sudo apt-get install -f

    # Rimuove il pacchetto scaricato
    rm google-chrome-stable_current_amd64.deb

    echo -e "✅  Google Chrome è stato installato."
fi
