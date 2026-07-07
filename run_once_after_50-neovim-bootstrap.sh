#!/usr/bin/env bash
# Auto-run the neolazy Neovim bootstrap on first chezmoi apply per machine.
# Self-guarding: if nvim is already installed we assume this machine is set up
# and do nothing, so re-applying chezmoi here is harmless.
set -euo pipefail

if command -v nvim >/dev/null 2>&1; then
  echo "[neovim-bootstrap] nvim already installed — skipping bootstrap."
  exit 0
fi

# Need git to fetch the bootstrap repo; install it if missing.
if ! command -v git >/dev/null 2>&1; then
  echo "[neovim-bootstrap] installing git..."
  if [ "$(id -u)" -eq 0 ]; then
    apt-get update -qq && apt-get install -y git
  else
    sudo apt-get update -qq && sudo apt-get install -y git
  fi
fi

repo="$HOME/src/neolazy"
if [ -d "$repo/.git" ]; then
  git -C "$repo" pull --ff-only || true
else
  mkdir -p "$HOME/src"
  git clone https://github.com/tkirkland/neolazy "$repo"
fi

echo "[neovim-bootstrap] running neolazy bootstrap..."
bash "$repo/neovim-lazy-setup.sh"
