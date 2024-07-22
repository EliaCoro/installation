#!/bin/bash

# Verifica se Sublime Text è installato
if command -v subl &> /dev/null; then
    echo "✅ Sublime Text è già installato."
else
    echo "🔧 Sublime Text non è installato. Installazione in corso..."

    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null

    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

    # Aggiorna i pacchetti e installa Sublime Text
    sudo apt-get update
    sudo apt-get install -y apt-transport-https sublime-text

    if command -v subl &> /dev/null; then
        echo "✅ Sublime Text è stato installato con successo."
    else
        echo "C'è stato un problema durante l'installazione di Sublime Text."
    fi
fi
