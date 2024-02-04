local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Visual Items
config.color_scheme = "catppuccin-macchiato"
-- config.window_decorations = 'RESIZE'
config.font = wezterm.font_with_fallback({
    "comic code ligatures",
    "comicmono nf",
})
config.font_size = 13

-- Status bar
wezterm.on("update-right-status", function(window, pane)
    -- "Wed Mar 3 08:14"
    local date = wezterm.strftime("%a %b %-d %H:%M ")
    local bat = ""
    for _, b in ipairs(wezterm.battery_info()) do
        local bat_percent = b.state_of_charge * 100

        if bat_percent < 20 then
            bat = "🪫" .. string.format("%.0f%%", bat_percent)
        else
            bat = "🔋" .. string.format("%.0f%%", bat_percent)
        end
    end
    -- os.execute("source /Users/jasoncobb/cpu.sh")
    -- local cpu = os.getenv("CPU_PERCENT")

    window:set_right_status(wezterm.format({
        { Text = bat .. "   " .. date}
    }))
end)

-- Return
return config
