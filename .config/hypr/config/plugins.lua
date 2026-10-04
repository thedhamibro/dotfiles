hl.plugin.load(os.getenv("HOME") .. "/.local/src/hyprexpo/hyprexpo.so")

hl.config({
    plugin = {
        hyprexpo = {
            columns = 3,
            rows = 0,
            gaps_in = 5,
            gaps_out = 0,
            bg_col = "rgb(111111)",
            workspace_method = "center current",
            gesture_distance = 200,
            gesture_fingers = 3,
            gesture_direction = "up",
            cancel_key = "escape",
            show_cursor = 1,
            drag_drop_enable = 1,
            dynamic_grid = 0,
            fill_gaps = 1,
            show_workspace_names = 1,
            label_text_mode = "id",
            label_position = "center",
            label_font_size = 120,
            label_color_default = "rgb(ffffff)",
            label_color_current = "rgb(ffffff)",
            label_bg_enable = 0,
            wallpaper_bg = 0
        },
    },
})
hl.plugin.hyprexpo.gesture({ fingers = 3, direction = "down", action = "cancel" })
