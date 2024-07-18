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

# Installa Oh My Bash se non è già installato
if [ ! -d "$HOME/.oh-my-bash" ]; then
    print_status "Installazione di Oh My Bash in corso..." "installing"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
    print_status "Oh My Bash è stato installato." "installed"
else
    print_status "Oh My Bash è già installato." "installed"
fi

# Installa il pacchetto di font Powerline se non è già installato
if ! dpkg -s fonts-powerline &> /dev/null; then
    print_status "Installazione di fonts-powerline in corso..." "installing"
    sudo apt-get install -y fonts-powerline
    print_status "fonts-powerline è stato installato." "installed"
else
    print_status "fonts-powerline è già installato." "installed"
fi

# Modifica il file .bashrc per impostare il tema "powerline" per Oh My Bash
print_status "Modifica di .bashrc per impostare il tema powerline..." "installing"
sed -i 's/^OSH_THEME=.*/OSH_THEME="powerline"/' "$HOME/.bashrc"
print_status "Il tema powerline è stato impostato in .bashrc." "installed"

# Ottieni tutti gli ID dei profili
profile_ids=$(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[],' ")

# Imposta il font per ciascun profilo
for id in $profile_ids; do
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$id/ font "Ubuntu Mono derivative Powerline 13"
done
# Aggiorna l'ambiente corrente con le modifiche apportate a .bashrc
source "$HOME/.bashrc"

echo "Configurazione completata!"
