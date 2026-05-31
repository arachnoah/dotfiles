#!/bin/bash
mkdir -p "$HOME/.ssh/config.d"
chmod 700 "$HOME/.ssh/config.d"
touch "$HOME/.ssh/config.d/local-keys"
chmod 600 "$HOME/.ssh/config.d/local-keys"
