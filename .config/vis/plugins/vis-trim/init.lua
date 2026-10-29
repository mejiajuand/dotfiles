vis.events.subscribe(vis.events.FILE_SAVE_PRE, function(file, path)
  -- if the file is unmodified, don't do anything extra
  if not file.modified then
    return
  end

  local buf = file:content(0, file.size)
  local modified_buf = string.gsub(buf, '[ \t]+\n', '\n')

  -- if contents are identical, there were no trailing whitespaces
  -- skip deletion and insertion operations
  if buf == modified_buf then
    return true
  end

  -- record the position of the cursor
  local pos = vis.win.selection.pos

  -- delete the file buffer. returns true on success
  local successful = file:delete(0, file.size)

  -- if delete fails, restore the buffer and proceed to write
  if not successful then
    vis:command('earlier 1')
    return true
  end

  -- insert the new buffer into the file. returns true on success
  successful = file:insert(0, modified_buf)

  -- if insert fails, restore the buffer and proceed to write
  if not successful then
    vis:command('earlier 1')
    return true
  end

  -- update the cursor position on success
  vis.win.selection.pos = pos
end)
