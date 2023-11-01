#!/bin/bash

#######################################################################################
# Script to create named virtual environment
# Uses requirements.txt file
#######################################################################################

# Set code root directory as script constant
CODE_DIR="$(dirname $(dirname "${PWD}"))"

# Source variables from common
source "${CODE_DIR}/scripts/common/common.sh"

echo "Virtual environment: ${ENV_NAME}"
echo "Virtual environment in: ~/virtualenvs"
echo "Environment dependencies listed in: ${ENV_FILE}"
echo "Target python version: ${PYVER}"
echo
# Warn user about requirements for use
echo "  -- Please check --"
echo "  Have previous virtualenvs been deleted if recreating these?"
echo "  Is the target python version (${PYVER}) set in in scripts/common/common.sh"
echo "  Is the target python version (${PYVER}) available on the system (e.g. module load etc) "
echo "  --  "

echo
CUR_PY=$(python --version 2>&1)  # Note redirect
echo "Current python: ${CUR_PY}"
echo

# Require the user to confirm
while true; do
    read -p "Do you want to continue?  " yn
    case $yn in
        [Yy]* )
          echo "---"
          echo "Creating virtual environment ${ENV_NAME} with ${PYVER} ";

          # Create directory under home
          mkdir -p ~/virtualenvs
          # Create virtual environment - with specified python version
          python"${PYVER}" -m venv ~/virtualenvs/"${ENV_NAME}"
          #python3.10 -m venv ~/virtualenvs/"${ENV_NAME}"

          # Activate the virtual environment
          source ~/virtualenvs/individual-env/bin/activate

          # Confirm python version to the user for debugging / info
          which python
          python --version

          # Install the required packages into the virtual environment
          python"${PYVER}" -m pip install -r "${CODE_DIR}/requirements.txt"

          break;;

        [Nn]* )
          echo "---"
          echo "Exiting - virtual environment not created"
          exit;;
        * )
          echo "Please answer yes or no.";;
    esac
done