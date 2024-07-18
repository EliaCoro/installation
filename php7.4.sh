#!/bin/bash

print_status() {
    if [[ $2 == "installed" ]]; then
        echo -e "$1 ✅"
    elif [[ $2 == "installing" ]]; then
        echo -e "$1 🔧"
    else
        echo "$1"
    fi
}

if php -v | grep -q "7.4"; then
    print_status "PHP 7.4 è già installato." "installed"
else
    print_status "Installazione di PHP 7.4 in corso..." "installing"
    sudo apt -y install software-properties-common
    sudo add-apt-repository -y ppa:ondrej/php
    sudo apt-get update
    sudo apt -y install php7.4

    # Installa i pacchetti PHP 7.4 aggiuntivi
    print_status "Installazione dei pacchetti PHP 7.4 aggiuntivi in corso..." "installing"
    sudo apt install -y php7.4-cli php7.4-common php7.4-curl php7.4-fpm php7.4-ldap php7.4-mbstring php7.4-pgsql php7.4-xml php7.4-zip php7.4-imap php7.4-gd php7.4-intl

    print_status "PHP 7.4 e i pacchetti aggiuntivi sono stati installati." "installed"
fi
