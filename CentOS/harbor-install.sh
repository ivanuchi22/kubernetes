#!/bin/bash
curl -Lo harbor-offline-installer.tgz https://github.com/goharbor/harbor/releases/download/v2.10.0/harbor-offline-installer-v2.10.0.tgz
tar xvf harbor-offline-installer.tgz
cd harbor
# Editamos el archivo harbor.yml a nuestro gusto
./install.sh
docker ps
curl https://localhost
