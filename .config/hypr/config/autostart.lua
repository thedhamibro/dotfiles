-- Auto-start config
-- if you dont use UWSM add your auto start programs here, otherwise use XDG autostart https://wiki.archlinux.org/title/XDG_Autostart

hl.on("hyprland.start", function ()
    hl.exec_cmd("systemctl --user set-environment XDG_SESSION_CLASS=user && dbus-update-activation-environment --systemd --all XDG_SESSION_CLASS")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("kitty --class scratch_kitty")
    hl.exec_cmd("xhost +SI:localuser:root")
    hl.exec_cmd("~/.config/hypr/scripts/expo-grid-sync.sh &")
end)

