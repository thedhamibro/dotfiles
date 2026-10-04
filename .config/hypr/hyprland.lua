-- CachyOS Hyprland Configuration

require("config.animations")
require("config.autostart")
require("config.colors")
require("config.decorations")
require("config.variables")
require("config.environment")
require("config.inputs")
require("config.binds")
require("config.misc")
require("config.monitors")
package.loaded["config.windowrules"] = nil
require("config.windowrules")
package.loaded["config.workspaces"] = nil
require("config.workspaces")
require("config.plugins")

-- For Noctalia Color templates
require("noctalia").apply_theme()
