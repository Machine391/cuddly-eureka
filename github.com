#!/bin/bash

# Function to update setuptools and pip
update_setuptools_and_pip() {
    echo "Updating setuptools..."
    sudo apt update
    sudo apt install python3-setuptools python3-pip -y
    sudo easy_install3 -U pip
}

# Function to upgrade requests library
upgrade_requests_library() {
    echo "Upgrading requests library..."
    sudo pip3 install requests --upgrade
}

# Function to install requests[socks]
install_requests_socks() {
    echo "Installing requests[socks]..."
    sudo pip3 install requests[socks]
}

# Function to install stem library
install_stem_library() {
    echo "Installing stem library..."
    sudo pip3 install stem
}

# Main function to execute the script
main() {
    update_setuptools_and_pip
    upgrade_requests_library
    install_requests_socks
    install_stem_library
}

# Execute the main function
main