#!/usr/bin/env bash
set -e

INSTALL_DIRECTORY=${INSTALL_DIRECTORY:-"/etc/dxlwazuh"}

pip install ../robobluekit
pip install .

if [[ ! -d "${INSTALL_DIRECTORY}" ]]; then
    mkdir "${INSTALL_DIRECTORY}"
    mkdir "${INSTALL_DIRECTORY}/config"
fi

cp ./config/dxlwazuh.config "${INSTALL_DIRECTORY}/config/dxlwazuh.config"
cp ./config/monitoring.config "${INSTALL_DIRECTORY}/config/monitoring.config"

cp ./infra/dxlwazuh.service /etc/systemd/system/

systemctl daemon-reload
