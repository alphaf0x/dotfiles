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

    # arrows
    # echo -n (set_color --bold efcf40)"❱"
    # echo -n (set_color --bold ef9540)"❱"
    # echo -n (set_color --bold ea3838)"❱"

    echo -n (set_color --bold 14b8a6)"→"

    #space
    echo -n " "

    set_color normal
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# aliases
alias vim="nvim"

alias ch="chezmoi"
alias chd="chezmoi diff"
alias cha="chezmoi apply"
