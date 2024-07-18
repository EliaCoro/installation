#!/bin/bash

# Funzione per stampare il messaggio con un'emoji
print_status() {
    if [[ $2 == "installed" ]]; then
        echo -e "$1 ✅"
    elif [[ $2 == "installing" ]]; then
        echo -e "$1 🔧"
    else
        echo "$1"
    fi
}

# Verifica se AnyDesk è già installato
if command -v anydesk &> /dev/null; then
    print_status "AnyDesk è già installato." "installed"
else
    print_status "Installazione di AnyDesk in corso..." "installing"
    curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo gpg --dearmor -o /usr/share/keyrings/anydesk.gpg
    echo "deb [signed-by=/usr/share/keyrings/anydesk.gpg] http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list > /dev/null
    sudo apt update
    sudo apt install -y anydesk
    print_status "AnyDesk è stato installato." "installed"
fi
