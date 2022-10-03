#!/bin/bash

function installgo() {
    GO_VERSION="1.17.7"
    if [ ! -z "$2" ]; then
        GO_VERSION=($2)
    fi
    PLATFORM="linux-amd64"
    GOROOT="/usr/local/go"
    GOBIN="${GOROOT}/bin"
    PACKAGE_NAME="go$VERSION.$PLATFORM.tar.gz"
    TEMP_DIRECTORY=$(mktemp -d)
    profile="$HOME/.profile"

    echo "Downloading $PACKAGE_NAME ..."
    wget https://storage.googleapis.com/golang/$PACKAGE_NAME -O "$TEMP_DIRECTORY/go.tar.gz"

    if [ $? -ne 0 ]; then
         echo "Download failed! Exiting."
        exit 1
    fi

    echo "Extracting File..."
    sudo tar -C /usr/local -xzf go${PACKAGE_NAME}
    
    echo "Configuring shell profile in: $profile"
    #touch "$shell_profile"
    echo "export PATH=$GOBIN:$PATH" >> $profile
    source $profile
    

    rm -f "$TEMP_DIRECTORY/go.tar.gz"
}

case "$1" in
    go)
        installgo
        ;;
    *)
        installgo
        ;;
esac
