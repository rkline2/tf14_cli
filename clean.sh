#!/bin/bash

source tf_env/bin/activate # tmp

read -p "Would you like to remove all python libraries associated to tf? [y/n default n]: " resp
resp=${resp:-N}

if [ ${resp^^} == 'Y' ]; then
    echo -e "\nUninstalling all libraries..."

    pip uninstall -y -r requirements.txt
    pip uninstall -y -r .dev_req
fi

echo -e "\nUninstalling tf..."
pip uninstall -y tf_cli

echo -e "\nDestroying venv... " # tmp
rm -rf tf_env/  

echo -e "Clearing cache files..."
rm -rf build/ dist/
rm -rf src/tf_cli.egg-info/

deactivate # tmp

echo -e "\nDone cleaning!"