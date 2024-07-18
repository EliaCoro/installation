#!/bin/bash
sudo apt install -y libfuse2

# Funzione per stampare il messaggio con un'emoji
print_status() {
    if [[ $2 == "installed" ]]; then
        echo -e "$1 \xE2\x9C\x85"  # Emoji check ✅
    elif [[ $2 == "installing" ]]; then
        echo -e "$1 \xF0\x9F\x94\xA7"  # Emoji wrench 🔧
    else
        echo "$1"
    fi
}

# Verifica se il file di JetBrains Toolbox esiste
toolbox_path="$HOME/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox"
if [ -f "$toolbox_path" ]; then
    print_status "JetBrains Toolbox è già installato." "installed"
    exit 0  # Esci dallo script perché JetBrains Toolbox è già installato
fi

# Installa JetBrains Toolbox
print_status "Download di JetBrains Toolbox in corso..." "installing"
curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash

# Verifica se l'installazione è riuscita
if [ -f "$toolbox_path" ]; then
    print_status "JetBrains Toolbox è stato installato correttamente." "installed"
else
    print_status "Si è verificato un problema durante l'installazione di JetBrains Toolbox." "error"
fi