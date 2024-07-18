#!/bin/bash

# Esegui utils.sh per primo se esiste
if [[ -f ./utils.sh ]]; then
    echo "Esecuzione di utils.sh..."
    source ./utils.sh
else
    echo "utils.sh non trovato."
fi

# Trova e esegui tutti gli altri script nella directory corrente
for script in ./*.sh ./*.bash; do
    # Salta install_all.sh
    if [[ $script == "./install_all.sh" || $script == "./utils.sh" ]]; then
        continue
    fi
    
    if [[ -f $script ]]; then
        echo "Esecuzione di $(basename "$script")..."
        source "$script"
    else
        echo "$(basename "$script") non trovato."
    fi
done

echo "Tutti gli script sono stati eseguiti."
