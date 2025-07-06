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

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection

# aliases
alias vim="nvim"

alias ch="chezmoi"
alias chd="chezmoi diff"
alias cha="chezmoi apply"
