#!/usr/bin/env bash

HOST="host/wired"
PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
ROOT="$(dirname "$PATH")"
GEN_CFG_DIR="${ROOT}/config-generated"
HW_CONFIG="${ROOT}/${HOST}/hardware-configuration.nix"
HW_CONFIG_DIR="${ROOT}/${HOST}"

if [[ $UID != 0 ]]; then 
  echo "This script requires root privileges."
  exec sudo "$0" "$@" 
fi

delete_hardware_config () {
  if [[ -e "${HW_CONFIG}" ]]; then
    rm -rf "${HW_CONFIG}"
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
    exit 1 
  fi
}

generate_new_hardware_config

if [[ -e "${HW_CONFIG}" ]]; then
  delete_hardware_config
fi
move_hardware_config

rm -rf "${CFG_DIR}"
cd "${ROOT}"
sudo nixos-rebuild switch --flake .#

