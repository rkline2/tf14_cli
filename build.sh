#!/bin/bash

venv_name="tf_env"
proj_name="tf_cli" 

read -p "Would you like to build a virtual environment? [y/n default y]: " resp
resp=${resp:-Y}

if [ ${resp^^} == 'Y' ]; then
echo -e "Building venv..."
python3 -m venv ${venv_name}
source ${venv_name}/bin/activate
fi

echo -e "\nInstalling requirements..."
pip install -r .dev_req
pip install .[dev]

echo -e "\nBuild complete!"

if [ ${resp^^} == 'Y' ]; then
echo -e "\nMake sure to run \"source ${venv_name}/bin/activate\" to run the virtual environment"
fi

read -p "Would you like to destroy all local files? [y/n default n]: " resp
resp=${resp:-N}

if [ ${resp^^} == 'Y' ]; then
echo -e "Destroying files..."
mv ${venv_name} ../
rm -rf ../${proj_name}
fi
