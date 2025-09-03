    #!/bin/bash
    session="_popup_$(tmux display -p '#S')" # Unique session name for the popup

    if ! tmux has -t "$session" 2> /dev/null; then
        session_id="$(tmux new-session -dP -s "$session" -F '#{session_id}')"
        tmux set-option -s -t "$session_id" key-table popup # Optional: customize keybindings for the popup
        tmux set-option -s -t "$session_id" status off # Optional: hide status bar in popup
        tmux set-option -s -t "$session_id" prefix None # Optional: disable prefix in popup
        session="$session_id"
    fi

    exec tmux attach -t "$session" > /dev/null
