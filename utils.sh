#!/bin/bash

# Aggiorna l'elenco dei pacchetti
sudo apt update

# Aggiorna tutti i pacchetti installati
sudo apt upgrade -y

sudo apt dist-upgrade -y

# Funzione per installare un pacchetto se non è già installato
install_if_not_present() {
    if dpkg -l | grep -q "^ii  $1 "; then
        echo -e "\xE2\x9C\x85 $1 è già installato."
    else
        sudo apt-get install -y $1
        echo -e "\xE2\x9C\x85 $1 è stato installato."
    fi
}

# Elenco dei pacchetti da installare
packages=(
    htop
    iotop
    software-properties-common
    apt-transport-https
    wget
    curl
    tree
    openssh-server
    net-tools
    git
    gparted
    solaar
    mtr
    lm-sensors
    gnupg2
    lsb-release
    gpg
)

# Itera attraverso l'elenco dei pacchetti e installali se necessario
for package in "${packages[@]}"; do
    install_if_not_present $package
done

echo "Tutti i pacchetti sono stati installati."

echo "Rimuovo apache2"
sudo apt remove apache2 -y