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

-- delete trailing whitespaces on save
vis.events.subscribe(vis.events.FILE_SAVE_PRE, function(file)
  if not file.modified then
    return false
  end

  local buf = file:content(0, file.size)
  local clean_buf = string.gsub(buf, '[ \t]+\n', '\n')

  -- there were no trailing whitespaces, proceed to write
  if buf == clean_buf then
    return true
  end

  -- record the cursor position
  local pos = vis.win.selection.pos

  -- update the file buffer with the clean buffer
  -- WARNING: delete will execute regardless if it succeeds or fail,
  -- leaving you with a completely empty buffer if insert fails.
  -- this function will return false if either delete or insert
  -- return false, meaning the write operation will not (should not)
  -- go through. use :q! to quit without saving to preserve the last
  -- save state of the file. i will look more into doing this in a
  -- safer manner. vis:command('x/[ \t]+\n/ c/\n/') throws a segfault
  if file:delete(0, file.size) then
    if file:insert(0, clean_buf) then
      -- set the cursor position and proceed to write
      vis.win.selection.pos = pos
      return true
    end
  end

  -- abort the write operation
  return false
end)
