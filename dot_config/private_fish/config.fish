set -g fish_greeting ""

fish_add_path /opt/homebrew/bin



if status is-interactive
    # Commands to run in interactive sessions can go here
end

# aliases
alias vim = "nvim"

alias ch = "chezmoi"
alias chd = "chezmoi diff"
alias cha = "chezmoi apply"
