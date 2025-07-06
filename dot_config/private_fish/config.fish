set -g fish_greeting ""

fish_add_path /opt/homebrew/bin

# Set fish prompt
function fish_right_prompt
    echo (set_color 5facbf)"$USER"@(prompt_hostname)
end

set -U fish_cursor_default block

function fish_prompt
    set_color --bold 4086ef

    set transformed_pwd (prompt_pwd | string replace -r "^~" (set_color --bold 06b6d4)"~"(set_color --bold 3b82f6))

    echo -n $transformed_pwd

    # git branch  
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        #space
        echo -n " "

        echo -n (set_color --bold 4338ca)"("

        set_color f0abfc
        echo -n (git branch --show-current)

        echo -n (set_color --bold 4338ca)")"
        set_color normal
    end

    # space
    echo -n " "

    echo -n (set_color --bold 14b8a6)"→"

    #space
    echo -n " "

    set_color normal
end

# Match colours from ghostty theme
set -l foreground d8dee9
set -l selection eff1f2
set -l comment 597bc5
set -l red c03d3d
set -l orange fa811e
set -l yellow cacd42
set -l green 7a9639
set -l purple 9250b1
set -l cyan 7dcfff
set -l pink 9250b1

# aliases
alias vim="nvim"

alias ch="chezmoi"
alias chd="chezmoi diff"
alias cha="chezmoi apply"
