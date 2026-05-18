# dotfiles

Managed with [chezmoi](https://chezmoi.io).

## Bootstrap a new machine

**Arch / Manjaro:**
```bash
sudo pacman -S chezmoi
chezmoi init --apply https://github.com/arachnoah/dotfiles.git
```

**Debian / Ubuntu (and anywhere else):**
```bash
sh -c "$(curl -fsLS get.chezmoi.io)"   # or: sh -c "$(wget -qO- get.chezmoi.io)"
~/bin/chezmoi init --apply https://github.com/arachnoah/dotfiles.git
```

## Post-install

### Required packages

The shell configs will warn about missing tools on every new terminal until these are installed.

Arch / Manjaro:
```bash
sudo pacman -S keychain neovim
```

Debian / Ubuntu:
```bash
sudo apt install keychain neovim
```

### SSH keys

Keychain auto-detects private keys in `~/.ssh/` by looking for files with a matching `.pub`.
No manual configuration needed — just make sure your keys are in `~/.ssh/`.

## Updating

On any managed machine:
```bash
chezmoi update   # pulls latest from git and applies
```

To edit a file:
```bash
chezmoi edit ~/.zshrc   # opens the source file
chezmoi apply           # applies changes
```

To push changes made on this machine:
```bash
chezmoi git -- push origin master
```
