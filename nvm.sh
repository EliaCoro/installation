#!/bin/bash

# Verifica se nvm è già installato
if command -v nvm &> /dev/null; then
    echo -e "✅ nvm è già installato."
else
    # Installa nvm
    echo -e "🔧 Installazione di nvm in corso..."
    curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
    
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    echo -e "✅ nvm è stato installato."
fi

# Verifica se node LTS è già installato
if command -v node &> /dev/null && node --version | grep 'v' &> /dev/null; then
    echo -e "✅ Node LTS è già installato."
else
    # Installa la versione LTS di Node.js
    echo -e "🔧 Installazione di Node LTS in corso..."
    nvm install --lts
    echo -e "✅ Node LTS è stato installato."
fi
