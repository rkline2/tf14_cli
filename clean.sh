#!/bin/bash

venv_name="tf14_env"
proj_name="tf14_cli" 

source ${venv_name}/bin/activate # tmp

read -p "Would you like to remove all python libraries associated to ${proj_name}? [y/n default n]: " resp
resp=${resp:-N}

if [ ${resp^^} == 'Y' ]; then
    echo -e "\nUninstalling all libraries..."

    pip uninstall -y -r requirements.txt
    pip uninstall -y -r .dev_req
fi

echo -e "\nUninstalling ${proj_name}..."
pip uninstall -y ${proj_name}

echo -e "\nDestroying ${venv_name}... " # tmp
rm -rf ${venv_name}/  

echo -e "Clearing cache files..."
rm -rf build/ dist/
rm -rf src/${proj_name}.egg-info/

deactivate # tmp

echo -e "\nDone cleaning!"