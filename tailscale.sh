#!/bin/bash

# Verifica se Tailscale è già installato
if command -v tailscale &> /dev/null; then
    echo -e "✅ Tailscale è già installato."
else
    echo -e "🔧 Installazione di Tailscale in corso..."
    curl -fsSL https://tailscale.com/install.sh | sh

    sudo tailscale up

    echo -e "✅ Tailscale è stato installato e avviato."
fi
