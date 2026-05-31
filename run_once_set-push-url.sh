#!/bin/bash
source_dir="${XDG_DATA_HOME:-$HOME/.local/share}/chezmoi"
git -C "$source_dir" remote set-url --push origin git@github.com:arachnoah/dotfiles.git
