-- load the standard vis module
require('vis')

-- load the plugins
require('plugins/vis-autoclose')
require('plugins/vis-backspace')

vis.events.subscribe(vis.events.INIT, function()
  -- global configurations
  vis:command('set theme base16-3024')
  -- keymaps
  vis:map(vis.modes.NORMAL, ' l', function()
    vis:command('set showtabs!')
    vis:command('set showspaces!')
    vis:command('set shownewlines!')
  end)
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
  -- window configurations
  vis:command('set number')
  vis:command('set expandtab')
  vis:command('set tabwidth 2')
  vis:command('set autoindent')
  vis:command('set showeof off')
  -- file configurations
  if vis.win.syntax == 'ansi_c' or vis.win.syntax == 'makefile' then
    vis:command('set tabwidth 8')
    vis:command('set expandtab off')
  elseif vis.win.syntax == 'rust' or vis.win.syntax == 'python' then
    vis:command('set tabwidth 4')
  end
end)

vis.events.subscribe(vis.events.FILE_SAVE_PRE, function(file)
  -- delete trailing whitespace on save
  -- warning: this deletes the entire buffer
  -- inserts a new buffer that gets processed
  -- by string.gsub. save mode is set to
  -- automatic. perhaps atomic would be safer
  local buf = file:content(0, file.size)
  local pos = vis.win.selection.pos
  file:delete(0, file.size)
  file:insert(0, string.gsub(buf, '[ \t]+\n', '\n'))
  vis.win.selection.pos = pos
end)
