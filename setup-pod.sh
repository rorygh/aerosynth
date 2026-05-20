#!/usr/bin/env bash
set -euo pipefail

# Machine setup for a fresh pod.
# Run this before cloning the repo.

# Vim key bindings
echo "set -o vi" >> ~/.bashrc

# Git identity
git config --global user.name "Rory M"
git config --global user.email "rory@mcclenagan.net"

# Cache credentials on first use
git config --global credential.helper store

# System packages
apt-get update && apt-get install -y unzip p7zip-full

# rclone
curl https://rclone.org/install.sh | bash

# Miniconda
curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh
bash /tmp/miniconda.sh -b -p /opt/miniconda
rm /tmp/miniconda.sh
/opt/miniconda/bin/conda init bash
source /opt/miniconda/etc/profile.d/conda.sh

# Accept terms of service
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
