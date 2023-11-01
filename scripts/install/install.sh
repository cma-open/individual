#!/bin/bash

#######################################################################################
# Script to install the system
# Requires virtualenv to exist at ~/virtualenvs directory
#######################################################################################

# Set python package code dir as script constant (relative to this script)
readonly CODE_DIR="$(dirname "$(dirname "${PWD}")")"

# Source variables from common
source "${CODE_DIR}/scripts/common/common.sh"

echo "Activating the virtual environment: ${ENV_NAME}"
echo
source ~/virtualenvs/"${ENV_NAME}"/bin/activate
echo

echo "Install the system: via developer or user option"
echo "Select Y only for one of the two following options"
echo
echo "Consider: are you developing the system, or are you an end user?"
echo
sleep 2

# Require the user to confirm
while true; do
    read -p "Do you want to install the system as a developer for further development?  " yn
    case $yn in
        [Yy]* )
          echo "---"
          echo "Installing - development mode";
          cd ../..
          pwd
          pip install -e . -v
          break;;
        [Nn]* )
          echo "---"
          # Require the user to confirm
          while true; do
              read -p "Do you want to install the system as an end user?  " yn
              case $yn in
                  [Yy]* )
                    echo "---"
                    echo "Installing system for end use";
                    cd ../..
                    pwd
                    pip install . -v
                    break 2;;
                    # break from both nested loops
                  [Nn]* )
                    echo "---"
                    echo "Exiting"
                    exit;;
                  * )
                    echo "Please answer yes or no.";;
              esac
          done;;
        * )
          echo "Please answer yes or no.";;
    esac
done
echo
