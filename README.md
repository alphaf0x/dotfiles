# Set minimal flag if desired (optional)
`export CHEZMOI_MINIMAL=true`

## What Gets Excluded in Minimal Mode:
- Personal tools like PIA VPN, hugo, etc.

# Install and apply
`chezmoi init --apply alphaf0x`

# Install chezmoi and your dotfiles on a new machine with a single command

chezmoi's install script can run chezmoi init for you by passing extra arguments to the newly installed chezmoi binary. If your dotfiles repo is github.com/$GITHUB_USERNAME/dotfiles then installing chezmoi, running chezmoi init, and running chezmoi apply can be done in a single line of shell:

`sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME`

If your dotfiles repo has a different name to dotfiles, or if you host your dotfiles on a different service, then see the reference manual for chezmoi init.

For setting up transitory environments (e.g. short-lived Linux containers) you can install chezmoi, install your dotfiles, and then remove all traces of chezmoi, including the source directory and chezmoi's configuration directory, with a single command:

`sh -c "$(curl -fsLS get.chezmoi.io)" -- init --one-shot $GITHUB_USERNAME`
