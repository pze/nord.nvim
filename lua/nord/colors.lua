local colors = {}

local defaults = {
  polar_night = {
    origin = "#0f160f", -- nord0
    bright = "#243029", -- nord1
    brighter = "#2F3D36", -- nord2
    brightest = "#394A42", -- nord3
    light = "#637D75", -- out of palette
  },
  snow_storm = {
    origin = "#dcdccc", -- nord4
    brighter = "#8f8f8f", -- nord5
    brightest = "#9fafaf", -- nord6
  },
  frost = {
    polar_water = "#8FBCBB", -- nord7
    ice = "#88C0D0", -- nord8
    artic_water = "#81A1C1", -- nord9
    artic_ocean = "#5E81AC", -- nord10
  },
  aurora = {
    red = "#BF616A", -- nord11
    orange = "#D08770", -- nord12
    yellow = "#EBCB8B", -- nord13
    green = "#A3BE8C", -- nord14
    purple = "#B48EAD", -- nord15
  },
  none = "NONE",
}

colors.palette = defaults
colors.default_bg = "#0f1606" -- nord0

function colors.daltonize(severity)
  local daltonize = require("nord.utils.colorblind").daltonize

  for group, color in pairs(defaults) do
    if type(color) == "table" then
      for sub_group, sub_color in pairs(color) do
        colors.palette[group][sub_group] = daltonize(sub_color, severity)
      end
    end
  end
end

return colors
