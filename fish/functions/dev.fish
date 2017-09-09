function dev
    if not test $TMUX;
        if type tmux > /dev/null 2>&1
            tmux has-session -t default; and tmux attach-session -d -t default; or tmux new-session -s default; and kill %self
        end
    end
end

