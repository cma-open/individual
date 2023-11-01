#!/bin/bash

#######################################################################################
# Script to create named virtual environment
# Uses requirements.txt file
#######################################################################################

# Set code root directory as script constant
CODE_DIR="$(dirname $(dirname "${PWD}"))"

# Source variables from common
source "${CODE_DIR}/scripts/common/common.sh"

echo "Deleting virtual environment from: ${ENV_NAME}"

# Move to virtualenvs directory
cd ~/virtualenvs/
pwd
# Remove the directory
rm -rf "${ENV_NAME}"
echo "Remaining dirs present within ~/virtualenvs"
ls ~/virtualenvs/