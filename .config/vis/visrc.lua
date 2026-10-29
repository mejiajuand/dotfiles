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

-- remove trailing whitespaces if possible, otherwise abort
vis.events.subscribe(vis.events.FILE_SAVE_PRE, function(file)
  -- trimmed file buffer
  local buf = string.gsub(file:content(0, file.size), '[ \t]+\n', '\n')
  -- current cursor position
  local pos = vis.win.selection.pos
  -- attempt to delete the file buffer. returns bool
  if not file:delete(0, file.size) then
    return false -- abort the write operation
  end
  -- attempt to write the trimmed buffer into the file. returns bool
  if not file:insert(0, buf) then
    return false -- abort the write operation
  end
  -- update the cursor position
  vis.win.selection.pos = pos
  -- proceed with the write operation
  return true
end)
