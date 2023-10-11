#!/bin/bash

#######################################################################################
# Script to create named virtual environment
# Uses requirements.txt file
#######################################################################################

# Set code root directory as script constant
CODE_DIR="$(dirname $(dirname "${PWD}"))"

# Source variables from common
source "${CODE_DIR}/scripts/common/common.sh"


echo "Creating virtual environment from: ${CONDA_ENV_FILE}"

#conda env create -f "${CODE_DIR}/environment.yml"

#conda create --name "${ENV_NAME}" --file "${CODE_DIR}/${CONDA_ENV_FILE}"


echo " --------------------------------------------------"
mkdir -p ~/virtualenvs
python -m venv ~/virtualenvs/individual-env
source ~/virtualenvs/individual-env/bin/activate
python3.12 -m pip install -r "${CODE_DIR}/requirements.txt"