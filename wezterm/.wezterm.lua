local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Visual Items
config.color_scheme = "catppuccin-macchiato"
config.window_decorations = 'RESIZE'--'|MACOS_FORCE_DISABLE_SHADOW'
config.font = wezterm.font_with_fallback({
    "Comic Code Ligatures",
    "Comicmono nf",
    "JetBrains Mono",
})
-- config.font = wezterm.font_with_fallback({
--     "Departure Mono",
--     "JetBrains Mono",
-- })
config.font_size = 14
config.hide_tab_bar_if_only_one_tab = true
config.keys = {
	{ mods = "OPT", key = "LeftArrow", action = wezterm.action.SendKey({ mods = "ALT", key = "b" }) },
	{ mods = "OPT", key = "RightArrow", action = wezterm.action.SendKey({ mods = "ALT", key = "f" }) },
	{ mods = "CMD", key = "LeftArrow", action = wezterm.action.SendKey({ mods = "CTRL", key = "a" }) },
	{ mods = "CMD", key = "RightArrow", action = wezterm.action.SendKey({ mods = "CTRL", key = "e" }) },
	{ mods = "CMD", key = "Backspace", action = wezterm.action.SendKey({ mods = "CTRL", key = "u" }) },
}
config.window_background_opacity = 0.9
-- Status bar
-- wezterm.on("update-right-status", function(window, pane)
--     -- "Wed Mar 3 08:14"
--     local date = wezterm.strftime("%a %b %-d %H:%M ")
--     local bat = ""
--     for _, b in ipairs(wezterm.battery_info()) do
--         local bat_percent = b.state_of_charge * 100
--
--         if bat_percent < 20 then
--             bat = "🪫" .. string.format("%.0f%%", bat_percent)
--         else
--             bat = "🔋" .. string.format("%.0f%%", bat_percent)
--         end
--     end
--     -- os.execute("source /Users/jasoncobb/cpu.sh")
--     -- local cpu = os.getenv("CPU_PERCENT")
--
--     window:set_right_status(wezterm.format({
--         { Text = bat .. "   " .. date}
--     }))
-- end)

-- Return
return config
