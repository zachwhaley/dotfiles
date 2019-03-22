function fish_prompt
    set -l __last_command_exit_status $status

    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l green (set_color -o green)
    set -l blue (set_color -o blue)
    set -l normal (set_color normal)

    set -l arrow_color "$green"
    if test $__last_command_exit_status != 0
        set arrow_color "$red"
    end

    set -l arrow "$arrow_color➜ "
    if test "$USER" = 'root'
        set arrow "$arrow_color# "
    end

    set -l cwd $yellow(basename (prompt_pwd))

    echo -s "$blue╭ " $cwd $normal
    echo -n -s "$blue╰ " $arrow
end
