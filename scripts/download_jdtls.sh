#!/bin/bash

mkdir -p /tmp/jdtls_install
cd /tmp/jdtls_install

wget "http://download.eclipse.org/jdtls/milestones/1.9.0/jdt-language-server-1.9.0-202203031534.tar.gz"

tar -xvf "jdt-language-server-1.9.0-202203031534.tar.gz"
mkdir -p ~/jdtls
cp -R * ~/jdtls/

ln -s $HOME/jdtls/bin/jdtls /usr/local/bin/

echo "JDTLS installed."
