#!/bin/bash

#######################################################################################
# Script to uninstall the system
#######################################################################################

# Set python package code dir as script constant (relative to this script)
readonly CODE_DIR="$(dirname "$(dirname "${PWD}")")"

# Source variables from common
source "${CODE_DIR}/scripts/common/common.sh"

echo "Activating the virtual environment"
echo
source ~/virtualenvs/venv-env/bin/activate
echo

# Require the user to confirm
while true; do
    read -p "Do you want to uninstall the system?  " yn
    case $yn in
        [Yy]* )
          echo "---"
          echo "Uninstalling";
          cd ../..
          pwd
          pip uninstall ${PACKAGE}
          break;;
        [Nn]* )
          echo "---"
          echo "Exiting"
          exit;;
        * )
          echo "Please answer yes or no.";;
    esac
done
echo

#######################################################################################
# Code review and system context notes
# ====================================
#######################################################################################
