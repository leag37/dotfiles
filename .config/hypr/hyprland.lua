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

---------------
-- AUTOSTART --
---------------


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
    dim_inactive = true,
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

-- File manager
hl.bind(mod .. " + F", hl.dsp.exec_cmd(file_manager))

-- Close window
hl.bind(mod .. " + Q", hl.dsp.window.close())

-- Log out of hyprland
hl.bind(mod .. " + SHIFT + Y", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Reboot PC
hl.bind(mod .. " + SHIFT + CTRL + Y", hl.dsp.exec_cmd("reboot"))

-- Shutdown PC
hl.bind(mod .. " + SHIFT + CTRL + ALT + Y", hl.dsp.exec_cmd("shutdown now"))

-- Program menu
hl.bind(mod .. " + R", hl.dsp.exec_cmd(menu))

-- Focus
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "left" }), { description = "Swap tiled window left" })
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "right" }), { description = "Swap tiled window right" })
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "up" }), { description = "Swap tiled window up" })
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "down" }), { description = "Swap tiled window down" })
hl.bind(mod .. " + SHIFT + X", hl.dsp.layout("rotatesplit 90"))


-- Workspaces
-------------

for i = 1, 10 do
  local key = i % 10
  hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

