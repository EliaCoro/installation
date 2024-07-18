#!/bin/bash

# Funzione per stampare il messaggio con un'emoji
print_status() {
    if [[ $2 == "installed" ]]; then
        echo -e "$1 ✅ "
    elif [[ $2 == "installing" ]]; then
        echo -e "$1 🔧"
    else
        echo "$1"
    fi
}

# Verifica se rbenv è già installato
if command -v bash --login rbenv &> /dev/null; then
    print_status "rbenv è già installato." "installed"
else
    # Installa rbenv
    print_status "🔧 Installazione di rbenv in corso..." "installing"
    sudo apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev -y
    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
    ~/.rbenv/bin/rbenv init
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init - bash)"' >> ~/.bashrc
    print_status "rbenv è stato installato." "installed"
fi

# Esegui rbenv-doctor
print_status "Esecuzione di rbenv-doctor in corso..." "installing"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-doctor | bash
print_status "rbenv-doctor è stato eseguito." "installed"