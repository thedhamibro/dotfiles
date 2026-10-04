#!/usr/bin/env bash

update_grid() {
    # Get the maximum workspace ID (ignoring negative IDs like scratchpads)
    # Using length of unique workspace IDs > 0
    # Or just getting the maximum workspace ID to determine if > 4. 
    # If the user wants max workspace number (e.g. 5 is open), we use max id.
    # If the user wants COUNT of workspaces, we use count. "4 or less workspaces open" implies count.
    
    # Let's get count of normal workspaces (ID > 0)
    COUNT=$(hyprctl workspaces -j | jq '[.[] | select(.id > 0)] | length')
    
    # We should also consider the highest workspace ID to ensure we don't truncate.
    # Wait, if `dynamic_grid = 0`, HyprExpo just shows a block of `cols * rows` slots.
    # If the highest active workspace is 5, and we use a 2x2 grid, workspace 5 won't fit on the first page.
    # It will paginate. Is pagination acceptable? Usually it's better to show all workspaces on one page.
    # So we should use the MAXIMUM workspace ID instead of COUNT.
    
    MAX_ID=$(hyprctl workspaces -j | jq 'map(select(.id > 0)) | max_by(.id) | .id')
    
    if [ "$MAX_ID" == "null" ] || [ "$MAX_ID" -le 4 ]; then
        hyprctl eval "hl.config({plugin = {hyprexpo = {columns = 2, rows = 2}}})" > /dev/null
    else
        hyprctl eval "hl.config({plugin = {hyprexpo = {columns = 3, rows = 3}}})" > /dev/null
    fi
}

# Run once at startup
update_grid

# Listen to Hyprland IPC for workspace events
nc -U $XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
    case "$line" in
        workspace*|createworkspace*|destroyworkspace*)
            update_grid
            ;;
    esac
done
