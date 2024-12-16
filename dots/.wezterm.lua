local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Scroll
config.scrollback_lines = 50000
config.enable_scroll_bar = true
config.min_scroll_bar_height = '2cell'
config.colors = {
  scrollbar_thumb = "#4c566a",
}

-- Theme and font
config.color_scheme = 'nord'
config.font = wezterm.font("Source Han Code JP")
config.font_size = 14
config.use_ime = true

config.window_decorations = "RESIZE"
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}
config.show_new_tab_button_in_tab_bar = false

-- Background image
local image_dir = os.getenv("HOME") .. '/Desktop/images'
local images = {}

print('Searching for images in ' .. 'ls ' .. image_dir .. '/*.(png|jpg|jpeg)')
local p = io.popen('find ' .. image_dir .. ' -type f -name "*.png" -o -name "*.jpg" -o -name "*.jpeg"')
for line in p:lines() do
  table.insert(images, line)
end
p:close()

math.randomseed(os.time())
local image = images[math.random(#images)] or ''
print('Using image: ' .. image)

config.background = {
  {
    source = {
      File = image,
    },
    repeat_x = 'NoRepeat',
    repeat_y = 'NoRepeat',
    vertical_align = 'Middle',
    horizontal_align = 'Center',
    hsb = {
      brightness = 0.03,
      saturation = 0.5,
      hue = 1.0,
    },
  },
}

return config
