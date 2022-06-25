#!/bin/bash

dist_dir="dist/"

echo -e "Building .tar file..."
python3 setup.py sdist

echo -e "\nDeploying file to pip..."
twine upload ${dist_dir}*

read -p "\nWould you like to remove local file(s) in dir \"${dist_dir}\"? [y/n default n]: " resp
resp=${resp:-N}

if [ ${resp^^} == 'Y' ]; then
    echo -e "\nRemoving files in dir \"${dist_dir}\"..."
    rm -rf ${dist_dir}
fi

echo -e "\nDone deploying!"