local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- General plugins
Plug('jiangmiao/auto-pairs')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {['branch'] = '0.1.x'})
Plug('nvim-treesitter/nvim-treesitter')
Plug('scrooloose/nerdtree')
Plug('tpope/vim-repeat')
Plug('tpope/vim-surround')
Plug('tpope/vim-unimpaired')
Plug('tpope/vim-vinegar')

-- Theme plugins
Plug('morhetz/gruvbox')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')

-- Git plugins
Plug('mhinz/vim-signify')
Plug('tpope/vim-fugitive')

-- Language plugins
Plug('neovim/nvim-lspconfig')
Plug('neoclide/coc.nvim', {['branch'] = 'release'})
Plug('fatih/vim-go', {['for'] = 'go', ['do'] = ':GoUpdateBinaries'})
--Plug('ray-x/go.nvim', {['for'] = 'go'})
Plug('hashivim/vim-terraform', {['for'] = {'terraform', 'hcl'}})
Plug('pangloss/vim-javascript', {['for'] = 'javascript'})
Plug('vim-python/python-syntax', {['for'] = 'python'})

vim.call('plug#end')

---------------------
-- Plugin Settings --
---------------------

-- Color scheme
vim.g.gruvbox_bold = 0
vim.g.gruvbox_italic = 1
vim.g.gruvbox_italicize_strings = 1
vim.g.gruvbox_improved_warnings = 1

-- Source control options
vim.g.signify_sign_change = '~'
vim.g.signify_sign_delete = '-'

-- Terraform
vim.g.terraform_fmt_on_save = 1

-- Python
vim.g.python_highlight_all = 1

-- Status line
require('lualine').setup {
  options = {
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    }
  }
}

-- Language servers
--local lspconfig = require('lspconfig')
--lspconfig.gopls.setup {}
--lspconfig.terraformls.setup {
--    filetypes = { 'terraform', 'terraform-vars', 'hcl'  }
--}

-- COC Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

--------------
-- Settings --
--------------

-- Colors
vim.cmd.colorscheme('gruvbox')
vim.opt.background = 'dark'
vim.opt.termguicolors = true

-- I save way too often to need a backup file
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Shorter updatetime leads to better completion experience.
vim.opt.updatetime = 300

-- Indenting
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- More intuitive window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- More readable wrapping
vim.opt.linebreak = true
vim.opt.showbreak = '↪ '

-- Wrap lines
vim.opt.wrapmargin = 160
vim.opt.textwidth = 160

-- Show line numbers on
vim.opt.number = true

-- Show real-time search/replace
vim.opt.inccommand = 'nosplit'
-- Be smart when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Mouse support
vim.opt.mouse = 'a'

-- Highlight matching braces
vim.opt.showmatch = true

-- Folding
vim.opt.foldenable = false
vim.opt.foldmethod = 'syntax'

-- Show trailing whitespace and tabs
vim.opt.listchars = { tab='» ', trail='·', nbsp='·', extends='›', precedes='‹' }

-- Don't show preview window
vim.opt.completeopt:remove { 'preview' }

-- Always show sign column
vim.opt.signcolumn = 'yes'

--------------
-- Mappings --
--------------

vim.g.mapleader = ';'

-- Open nvim init config
vim.keymap.set('', '<Leader>+', ':tabedit $MYVIMRC<CR>')

-- Natural movement for wrapped lines
vim.keymap.set('', 'k', 'gk')
vim.keymap.set('', 'j', 'gj')

-- Insert mode navigation
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<C-o>gj')
vim.keymap.set('i', '<C-k>', '<C-o>gk')
vim.keymap.set('i', '<C-l>', '<Right>')

-- Window navigation
vim.keymap.set('n', '<Leader>w', '<C-w>')

-- Tab navigation
vim.keymap.set('n', '<Leader>tn', 'gt')
vim.keymap.set('n', '<Leader>tp', 'gT')
vim.keymap.set('n', '<Leader>tt', ':tabnew<CR>')

-- Reverse tab
vim.keymap.set('n', '<S-Tab>', '<<')
vim.keymap.set('i', '<S-Tab>', '<Esc><<i')
vim.keymap.set('n', '<Tab>', '>>')

-- A touch of Emacs
vim.keymap.set('i', '<C-a>', '<Esc>I')
vim.keymap.set('i', '<C-e>', '<End>')
vim.keymap.set('n', '<C-a>', '^')
vim.keymap.set('n', '<C-e>', '<End>')
vim.keymap.set('v', '<C-a>', '^')
vim.keymap.set('v', '<C-e>', '$')

-- Terminal mode escape
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

-- Hunk jumping
vim.keymap.set('n', '<Leader>gj', '<Plug>(signify-next-hunk)')
vim.keymap.set('n', '<Leader>gk', '<Plug>(signify-prev-hunk)')

-- Change cwd to directory of open file
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>')

-- COC Mappings --
-- Use Tab for trigger completion with characters ahead and navigate
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set('i', '<TAB>', [[coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()]], opts)
vim.keymap.set('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- Make <Right> to accept selected completion item or notify coc.nvim to format
vim.keymap.set('i', '<Right>', [[coc#pum#visible() ? coc#pum#confirm() : "<Right>"]], opts)

-- Use <c-j> to trigger snippets
vim.keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
vim.keymap.set("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

vim.api.nvim_create_user_command('Shrug',
  function(opts)
    vim.api.nvim_paste([[¯\_(ツ)_/¯]], 'CRLF', -1)
  end,
  {}
)
