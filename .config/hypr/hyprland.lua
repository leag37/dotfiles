--------------
-- MONITORS --
--------------

hl.monitor({
	output	  = "",
	mode		  = "preferred",
	position	= "auto",
	scale		  = "auto",
})

-----------------
-- MY PROGRAMS --
-----------------
local terminal = "kitty"
local file_manager = "dolphin"
local menu = "hyprlauncher"
local browser = "brave"

---------------
-- AUTOSTART --
---------------
hl.on("hyprland.start", function()
  hl.exec_cmd("hypridle")
  hl.exec_cmd("waybar")
  hl.exec_cmd("protonvpn-app")
end)

-------------------
-- LOOK AND FEEL --
-------------------
--<Up> https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
  general = {
    border_size = 1,
    gaps_in = 2,
    gaps_out = 5,
    float_gaps = 0,
    layout = "dwindle",
    resize_on_border = true,
  },

  decoration = {
    rounding = 8,
    rounding_power = 2.0,
    active_opacity = 1.0,
    inactive_opacity = 1.0,

    dim_modal = true,
    dim_inactive = false,
    dim_strength = 0.5,

    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },
  },


  animations = {
    enabled = true,
  },

  dwindle = {
    force_split = 2,
    preserve_split = true,
  },

  master = {
    new_status = "master",
  },

  scrolling = {
    fullscreen_on_one_column = true,
  },
})

----------
-- MISC --
----------

hl.config({
  misc = {
  },
})

-----------
-- INPUT --
-----------

hl.config({
  input = {
    follow_mouse = 2,
    focus_on_close = 2,
  },
})

--------------
-- KEYBINDS --
--------------

local mod = "SUPER"

-- Core bindings
----------------

-- Terminal
hl.bind(mod .. " + T", hl.dsp.exec_cmd(terminal))

-- Browser
hl.bind(mod .. " + B", hl.dsp.exec_cmd(browser))

-- File manager
hl.bind(mod .. " + F", hl.dsp.exec_cmd(file_manager))

-- Close window
hl.bind(mod .. " + Q", hl.dsp.window.close())

-- Log out of hyprland
hl.bind(mod .. " + SHIFT + GRAVE", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Lock
hl.bind(mod .. " + SHIFT + MINUS", hl.dsp.exec_cmd("loginctl lock-session"))

-- Suspend
hl.bind(mod .. " + SHIFT + CTRL + MINUS", hl.dsp.exec_cmd("systemctl suspend"))

-- Reboot PC
hl.bind(mod .. " + SHIFT + CTRL + GRAVE", hl.dsp.exec_cmd("hyprshutdown -t 'Rebooting...' --post-cmd 'reboot'"))

-- Shutdown PC
hl.bind(mod .. " + SHIFT + CTRL + ALT + GRAVE", hl.dsp.exec_cmd("hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0'"))

-- Program menu
hl.bind(mod .. " + R", hl.dsp.exec_cmd(menu))

-- Windows
----------

-- Focus
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move windows
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "left" }), { description = "Swap tiled window left" })
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "right" }), { description = "Swap tiled window right" })
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "up" }), { description = "Swap tiled window up" })
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "down" }), { description = "Swap tiled window down" })
hl.bind(mod .. " + SHIFT + X", hl.dsp.layout("rotatesplit 90"))
hl.bind(mod .. " + SHIFT + W", hl.dsp.layout("swapsplit"))

hl.bind(mod .. " + SHIFT + left", hl.dsp.window.swap({ direction = "left" }), { description = "Swap tiled window left" })
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "right" }), { description = "Swap tiled window right" })
hl.bind(mod .. " + SHIFT + up", hl.dsp.window.swap({ direction = "up" }), { description = "Swap tiled window up" })
hl.bind(mod .. " + SHIFT + down", hl.dsp.window.swap({ direction = "down" }), { description = "Swap tiled window down" })
hl.bind(mod .. " + SHIFT + TAB", hl.dsp.layout("rotatesplit -90"))
hl.bind(mod .. " + TAB", hl.dsp.layout("rotatesplit 90"))

-- Resizing windows
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { description = "Toggle fullscreen" })
hl.bind(mod .. " + SHIFT + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }), { description = "Toggle maximized" })
hl.bind(mod .. " + SHIFT + HOME", hl.dsp.window.resize({ x = -10, y = 0, relative = true }))
hl.bind(mod .. " + SHIFT + END", hl.dsp.window.resize({ x = 10, y = 0, relative = true }))
hl.bind(mod .. " + SHIFT + page_up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }))
hl.bind(mod .. " + SHIFT + page_down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }))

-- Mouse control
-- Drag and resize
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Scroll through workspaces by scrolling
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Workspaces
-------------

for i = 1, 10 do
  local key = i % 10
  hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end


-- Multimedia
-------------

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
