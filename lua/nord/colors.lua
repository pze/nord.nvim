local colors = {}

colors.palette = {}
colors.default_bg = "#0f1606" -- nord0

function colors.daltonize(severity)
  local defaults = vim.tbl_deep_extend({}, colors.palette)
  local daltonize = require("nord.utils.colorblind").daltonize

  for group, color in pairs(defaults) do
    if type(color) == "table" then
      for sub_group, sub_color in pairs(color) do
        colors.palette[group][sub_group] = daltonize(sub_color, severity)
      end
    end
  end
end

function colors.set_palette(palettes)
  colors.palette = vim.tbl_deep_extend({}, palettes)
end

return colors
