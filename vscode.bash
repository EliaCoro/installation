#!/bin/bash

# Verifica se Visual Studio Code è già installato tramite Snap
if snap list | grep -q code; then
    echo -e "✅ Visual Studio Code è già installato."
else
    # Installa Visual Studio Code tramite Snap
    sudo snap install --classic code
    echo -e "✅ Visual Studio Code è stato installato."
fi
