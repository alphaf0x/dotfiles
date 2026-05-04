# dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## Quick start

### Desktop (macOS)

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply alphaf0x
```

You'll be prompted: **"Is this a server install (no GUI apps)?"** — answer `no`.

### Server (Ubuntu/Linux)

```sh
export CHEZMOI_SERVER=true
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply alphaf0x
```

Setting `CHEZMOI_SERVER=true` skips the prompt and excludes all GUI apps, desktop configs (Ghostty, VS Code, casks), and desktop-only tools.

### Transient environments (containers, CI)

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --one-shot alphaf0x
```

## What's included

| Component | Desktop | Server |
|-----------|---------|--------|
| fish shell + prompt + colors | yes | yes |
| neovim (LazyVim) | yes | yes |
| tmux + TPM | yes | yes |
| fzf, ripgrep, fd | yes | yes |
| Ghostty terminal | yes | -- |
| Homebrew casks | yes | -- |
| VS Code + extensions | yes | -- |

## Day-to-day usage

```sh
chezmoi diff          # preview changes
chezmoi apply         # apply changes
chezmoi add ~/.file   # track a new file
chezmoi edit ~/.file  # edit a tracked file
chezmoi cd            # cd into source directory
```

Or use the fish aliases: `ch`, `chd`, `cha`.
