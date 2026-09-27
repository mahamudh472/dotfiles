# Dotfiles

Personal dotfiles managed using a **bare Git repository**.

This setup allows me to track configuration files directly in `$HOME`
while avoiding a traditional working directory.

---

## Repository layout

* Git directory (bare repo): `~/dotfiles`
* Working tree: `$HOME`
* Neovim config: `~/.config/nvim`

Plugin data, caches, and system-generated files are **not tracked**.

---

## Setup on a new machine

### 1. Clone the bare repository

```bash
git clone --bare git@github.com:mahamudh472/dotfiles.git ~/dotfiles
```

### 2. Create the alias

```bash
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

(Optional: add this alias to `.bashrc` / `.zshrc`)

### 3. Hide untracked files

```bash
dot config --local status.showUntrackedFiles no
```

### 4. Checkout only what you need

```bash
dot checkout HEAD -- .bashrc .zshrc .config/nvim
```

This avoids overwriting machine-specific or existing files.

> **Note:** When restoring files from a fresh machine, use `HEAD` explicitly:
>
> ```bash
> dot checkout HEAD -- <file-or-directory>
> ```
>
> This restores the committed version from the repository.

---

## Zsh

The repository contains the Zsh configuration, but **Oh My Zsh, its plugins, and Powerlevel10k are external dependencies and are not tracked**.

After checking out `.zshrc`, install the following:

### Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Powerlevel10k

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Zsh Autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### Zsh Syntax Highlighting

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Then reload the configuration:

```bash
source ~/.zshrc
```

### Zsh dependencies

The `.zshrc` expects:

* Oh My Zsh
* Powerlevel10k
* `zsh-autosuggestions`
* `zsh-syntax-highlighting`

These dependencies are intentionally **not tracked in the dotfiles repository**.

The Powerlevel10k configuration itself is tracked separately:

```text
~/.p10k.zsh
```

---

## Neovim

* Plugin manager: **lazy.nvim**
* lazy.nvim is **auto-bootstrapped** on first launch
* No manual plugin installation required

After checking out the config:

```bash
nvim
```

On first run:

* lazy.nvim installs itself
* plugins are installed automatically
* `lazy-lock.json` ensures reproducible versions

### Tracked files

* `~/.config/nvim/init.lua`
* `~/.config/nvim/lua/`
* `~/.config/nvim/lazy-lock.json`

### Not tracked

* `~/.local/share/nvim/`
* plugin binaries, caches, or build artifacts

---

## Philosophy

* Minimal, modular configuration
* Selective checkout per machine
* No secrets committed to Git
* External dependencies are documented but not tracked
* Editor and shell configuration should be reproducible and self-bootstrapping where possible

---

## Notes

* Existing dotfiles may need to be backed up before checkout
* Different machines may use different subsets of configs
* Different machines may use different shells and terminals
* Install external dependencies before sourcing configuration files that depend on them
* This repository is intended for personal use
