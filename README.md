Here’s a **clean, practical README.md** you can copy-paste directly.
It explains *what you’re doing*, *how to set it up*, and *why things work*, without being bloated.

You can tweak names/paths later, but this is a **solid baseline** most experienced dotfile users are happy with.

---

````md
# Dotfiles

Personal dotfiles managed using a **bare Git repository**.

This setup allows me to track configuration files directly in `$HOME`
while avoiding a traditional working directory.

---

## Repository layout

- Git directory (bare repo): `~/dotfiles`
- Working tree: `$HOME`
- Neovim config: `~/.config/nvim`

Plugin data, caches, and system-generated files are **not tracked**.

---

## Setup on a new machine

### 1. Clone the bare repository

```bash
git clone --bare git@github.com:mahamudh472/dotfiles.git ~/dotfiles
````

### 2. Create the alias

```bash
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

(Optional: add this alias to `.bashrc` / `.zshrc`)

### 3. Hide untracked files (recommended)

```bash
dot config --local status.showUntrackedFiles no
```

### 4. Checkout only what you need

```bash
dot checkout -- .bashrc .zshrc .config/nvim
```

This avoids overwriting machine-specific or existing files.

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
* Editor setup should be reproducible and self-bootstrapping

---

## Notes

* Existing dotfiles may need to be backed up before checkout
* Different machines may use different subsets of configs
* This repository is intended for personal use

```

