#!/bin/bash

# Verifica se Spotify è già installato
if snap list | grep spotify &> /dev/null; then
    echo -e "✅ Spotify è già installato."
else
    # Installa Spotify tramite Snap
    echo -e "🔧 Installazione di Spotify in corso..."
    sudo snap install spotify
    echo -e "✅ Spotify è stato installato."
fi
