#!/bin/bash

# Verifica se Postman è installato
if command -v postman &> /dev/null; then
    echo "✅ Postman è già installato."
else
    echo "🔧 Postman non è installato. Installazione in corso..."
    sudo snap install postman

    # Verifica se l'installazione è andata a buon fine
    if command -v postman &> /dev/null; then
        echo "✅ Postman è stato installato con successo."
    else
        echo "C'è stato un problema durante l'installazione di Postman."
    fi
fi
