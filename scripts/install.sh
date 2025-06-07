#!/usr/bin/env bash

HOST="host/wired"
LOCAL_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
ROOT="$(dirname "$LOCAL_PATH")"
GEN_CFG_DIR="${ROOT}/config-generated"
HW_CONFIG="${ROOT}/${HOST}/hardware-configuration.nix"
HW_CONFIG_DIR="${ROOT}/${HOST}"

echo "Warning: This script is for automise ALL MY FIRST INSTALL OF NIXOS."
echo "It will do nothing more than run the nixos-generated-config and place it in my host/wired folder and rebuild the system."

root_verification () {
  if [[ $UID != 0 ]]; then 
    echo "This script requires root privileges."
    echo "Please, give root passwd or cancel to exit"
    sudo "$0" "$@"
    exit $?
  fi
}

delete_hardware_config () {
  if [[ -e "${HW_CONFIG}" ]]; then
    rm -rf "${HW_CONFIG}"
    echo "'${HW_CONFIG}' was been deleted successfully"
  fi
}

generate_new_hardware_config () {
  mkdir -p "${GEN_CFG_DIR}"
  cd "${GEN_CFG_DIR}"
  sudo nixos-generate-config --dir .
  if [[ -e "${GEN_CFG_DIR}/hardware-configuration.nix" ]]; then
    echo "hardware-configuration.nix was been generated successfully."
  fi
}

move_hardware_config () {
  mv "${GEN_CFG_DIR}/hardware-configuration.nix" "${HW_CONFIG_DIR}"
  if [[ -e "${HW_CONFIG}" ]]; then
    echo "hardware-configuration.nix was moved successfully." 
  fi
  cd "${ROOT}"
  rm -rf "${GEN_CFG_DIR}"
}

git_safe_directory () {
  if command -v git &> /dev/null; then
    git config --global --add safe.diretory "${ROOT}"
      if [[ $? -eq 0 ]]; then
        echo "Successfully added '${ROOT}' to root's git safe directory"
      else 
        echo "Warning: Failed to add '${ROOT}' to root's git safe directory. This usually causes rebuild issues."
      fi
    echo "Command 'git' not found."
  fi
}


generate_new_hardware_config

if [[ -e "${HW_CONFIG}" ]]; then
  delete_hardware_config
fi
move_hardware_config

sudo nixos-rebuild switch --flake .#
