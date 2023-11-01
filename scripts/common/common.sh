#!/bin/bash

#######################################################################################
# Script to hold common code used by scripts
#######################################################################################

# Assume CODE_DIR is always set by the calling script

# Set script constants
readonly SRC_DIR="${CODE_DIR}/src"
readonly SCRIPTS_DIR="${CODE_DIR}/scripts"
readonly PACKAGE="individual"  # note package name here !
readonly ENV_NAME="individual-env"
# Set name of environment file holding dependencies list
readonly ENV_FILE='requirements.txt'

# Set python version
readonly PYVER="3.10"

echo " ---- * ----"
echo "Package name: ${PACKAGE}"
echo "Package root directory: ${CODE_DIR}"
echo "Source (src) directory: ${SRC_DIR}"
echo "Scripts directory: ${SCRIPTS_DIR}"
echo "Environment name: ${ENV_NAME}"
echo " ---- * ----"

#######################################################################################
# Code review and system context notes
# ====================================
#######################################################################################
