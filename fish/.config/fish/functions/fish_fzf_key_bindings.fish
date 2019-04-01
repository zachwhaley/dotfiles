function fish_fzf_key_bindings
    set -l fzfs /usr/share/fzf/shell/key-bindings.fish ~/.fzf/shell/key-bindings.fish
    for fzf in $fzfs
        if test -e $fzf
            source $fzf
            fzf_key_bindings
            break
        end
    end
end
