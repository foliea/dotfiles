function fish_cancel_insert_mode
  if commandline -P
    commandline -f cancel
  else
    set fish_bind_mode default
    commandline -f backward-char force-repaint
  end
end
