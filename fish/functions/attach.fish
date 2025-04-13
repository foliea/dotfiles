function attach
    if not test $TMUX

        if type tmux >/dev/null 2>&1
            set --local session $argv[1]

            tmux has-session -t $session; and tmux attach-session -d -t $session
            or tmux new-session -s $session; and kill %self
        end
    end
end
