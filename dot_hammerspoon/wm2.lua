local hotkey = hs.hotkey
local L = require('wm-layout')
local S = require('wm-utils')

local primaryKey = { 'option' }

local DevSpace = { BuiltIn = 2, External = 1 }
local app_layouts = {
  ['WeChat'] = { pos = L.rb_3x3 },
  ['Telegram'] = { pos = L.lb_3x3 },
  ['QQ'] = { pos = L.rb_3x3 },
  ['System Settings'] = { pos = L.center },
}

-- Auto layout
-- options = { ignoreNoMatched = boolean }
local auto_layout = function(win, options)
  win = win or hs.window.focusedWindow()
  local app_name = win:application():title()
  print('auto layout window', app_name)

  local app_config = app_layouts[app_name]
  if app_config and app_config.pos then
    app_config.pos(win)
  end
end

hotkey.bind(primaryKey, 'escape', auto_layout)
