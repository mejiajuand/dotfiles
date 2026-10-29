-- load the vis module
require('vis')

-- load plugins
require('plugins/vis-autoclose')
require('plugins/vis-backspace')
require('plugins/vis-trim')

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

vis.events.subscribe(vis.events.FILE_SAVE_PRE, function(file, path)
  -- prevent writing to file if not modified
  if not file.modified then
    return false
  end
end)
