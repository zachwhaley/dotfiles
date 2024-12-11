function set_keymap(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, {noremap = true, silent = true})
end

function map(shortcut, command)
  set_keymap('', shortcut, command)
end

function imap(shortcut, command)
  set_keymap('i', shortcut, command)
end

function nmap(shortcut, command)
  set_keymap('n', shortcut, command)
end

function tmap(shortcut, command)
  set_keymap('t', shortcut, command)
end

function vmap(shortcut, command)
  set_keymap('v', shortcut, command)
end
