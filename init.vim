"Plugins
call plug#begin()

Plug 'coderifous/textobj-word-column.vim'
Plug 'wellle/targets.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'romainl/vim-cool'
Plug 'junegunn/vim-easy-align'
Plug 'nathanalderson/yang.vim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'ray-x/lsp_signature.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'ellisonleao/glow.nvim'
Plug 'onsails/diaglist.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-neotest/nvim-nio'
Plug 'mfussenegger/nvim-dap'
" Plug 'Pocco81/DAPInstall.nvim'
Plug 'rcarriga/nvim-dap-ui'
Plug 'itchyny/vim-haskell-indent'
Plug 'dcampos/nvim-snippy'
Plug 'dcampos/cmp-snippy'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
Plug 'karb94/neoscroll.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

call plug#end()

" netrw
let g:netrw_dirhistmax = 0

" glow
let g:glow_border = "rounded"

" targets.vim
autocmd User targets#mappings#user call targets#mappings#extend({
    \ 'b': {'pair': [{'o':'(', 'c':')'}, {'o':'[', 'c':']'}, {'o':'{', 'c':'}'}, {'o':'<', 'c':'>'}]},
    \ })

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" leader key
let mapleader="\<Space>"

" UI
set textwidth=0         "Prevent hard-wrap text
set wrapmargin=0
set wrap
set linebreak           "Break (visually) by word instead of character

set visualbell          "Removes audiobell and sets visualbell
set t_vb=               "Empty visualbell

set nojoinspaces        "Prevents inserting two spaces after punctuation on a join

set pumheight=5         "Show only 5 suggestions

set splitbelow          "Horizontal split below current
set splitright          "Vertical split to the right of current

set hlsearch            "Highlight search result
set incsearch           "Incremental search
set ignorecase
set smartcase
set inccommand=nosplit

set nofoldenable        "Disable folding

set hidden              "if hidden not set, TextEdit might fail

set cmdheight=1

set noshowmode

set noruler

set laststatus=3
set statusline=
set statusline+=\ %t
set statusline+=%m\ 
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %l,%c\ 

set cursorline

set noshowmatch "don't jump to matching pair

set lazyredraw

"colorscheme
set termguicolors
set background=dark
augroup colorscheme
    autocmd Colorscheme * highlight StatusLineNC guibg=#aa8888
    autocmd Colorscheme * highlight StatusLine guibg=#bcbcbc
    autocmd Colorscheme * highlight NormalFloat guibg=#1f2428 guifg=#c9d1d9
augroup end
colorscheme github_dark

" don't fill EoB with '~'
let &fcs='eob: '

set guicursor=n-v-c:hor25,i-ci-r-cr:ver25

set shortmess+=acW "remove/modify some messages

set signcolumn=no "don't display sign column

" Show next 3 lines while scrolling
if !&scrolloff
    set scrolloff=3
endif

" Show next 5 lines while side scrolling
if !&sidescrolloff
    set sidescrolloff=5
endif

" Use Ctrl+L to clear the highlighting of hlsearch
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" Search and replace
nnoremap <leader>h :%s//g<Left><Left>
xnoremap <leader>h :s//g<Left><Left>

" Indentation rules and use spaces
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set smartindent
filetype plugin indent on
syntax on

set undolevels=1000

set backspace=indent,eol,start

set clipboard+=unnamedplus "Enable xsel clipboard

" sets d => "delete"
" leader+d => "cut"
nnoremap x "_x
nnoremap X "_X
nnoremap d "_d
nnoremap D "_D
xnoremap d "_d
nnoremap <leader>d "+d
nnoremap <leader>D "+D
xnoremap <leader>d "+d
nnoremap <leader>x "+x
nnoremap <leader>X "+X

" Autocomplete settings
set completeopt+=menuone "show completion menu even when there is only one match
set completeopt+=menu
set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview

" Tap jk to escape to normal mode
inoremap jk <Esc>`^

" save session
nnoremap <leader>s :mksession<CR>

" persistent undo
set undodir=~/.local/share/nvim/undodir
set undofile

" json comments syntax highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" set title of the window
autocmd BufEnter * let &titlestring = ' ' . expand(@%)
set title

" use ripgrep for grep
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" automatically show quickfix list after grep
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
    autocmd FileType qf nnoremap <silent> <buffer> <CR> <CR>:cclose<CR>
augroup END

" mapping to do a silent grep
nnoremap <leader>g :silent grep!<Space>

" make :cnext and :cprev loop
command! Cnext try | cnext | catch | cfirst | catch | endtry
command! Cprev try | cprev | catch | clast | catch | endtry

nnoremap <C-f> :QFilter<Space>
nnoremap <C-h> :silent colder<CR>

" move up and down based on display lines
nnoremap <silent> j gj
nnoremap <silent> k gk

" move to prev and next buffers, similar to tabs in qutebrowser
nnoremap <silent> <C-j> :bnext<CR>
nnoremap <silent> <C-k> :bprev<CR>

" move to prev and next items in the quickfix list
nnoremap <silent> <C-n> :Cnext<CR>
nnoremap <silent> <C-p> :Cprev<CR>

" shortcut to open quickfix list
nnoremap <silent> gq :cw<CR>

set tildeop

" LSP
lua << EOF
local nvim_lsp = require('lspconfig')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setqflist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end


  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>F', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)

  require 'lsp_signature'.on_attach({
    hint_prefix = ' ',
    toggle_key = '<C-x>',
    doc_lines = 0
  }, bufnr)

end

-- Setup nvim-autpairs & nvim-cmp.
require("nvim-autopairs").setup {}
local cmp_autopairs = require'nvim-autopairs.completion.cmp'
local cmp = require'cmp'

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

cmp.setup({
window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
},
snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
      end,
},
mapping = {
  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = false }),
  ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
},
sources = {
  { name = 'nvim_lsp' },
  { name = 'buffer' },
  { name = 'path' },
  { name = 'snippy' },
},
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
nvim_lsp['clangd'].setup {
  cmd = { "/opt/homebrew/opt/llvm/bin/clangd" },
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

local servers = { 'pylsp', 'hls', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})

EOF

" Terminal mappings
tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" Treesitter
lua << EOF
    require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "cpp", "python", "java", "json", "yang", "yaml", "haskell", "rust", "vim", "lua" },
        highlight = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
        refactor = {
            highlight_definitions = { enable = true },
            highlight_current_scope = { enable = false },
            smart_rename = {
                enable = true,
                keymaps = {
                    smart_rename = "grr",
                },
            },
            navigation = {
                enable = true,
                keymaps = {
                    goto_definition_lsp_fallback = "gnd",
                    list_definitions = "gnD",
                    goto_next_usage = "<a-*>",
                    goto_previous_usage = "<a-#>",
                },
            },
        },
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                },
            },
            move = {
                enable = true,
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
        },
        indent = {
            enable = false
        },
    }
EOF

" diaglist
lua require("diaglist").init()
nmap <leader>dw <cmd>lua require('diaglist').open_all_diagnostics()<cr>
nmap <leader>d0 <cmd>lua require('diaglist').open_buffer_diagnostics()<cr>

" Comment.nvim
lua require('Comment').setup()

" DAP
lua << EOF
-- local dap_install = require("dap-install")
-- dap_install.config("python", {})

local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
EOF

" nvim-snippy
imap <expr> <Tab> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<Tab>'
imap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
xmap <Tab> <Plug>(snippy-cut-text)

" neoscroll
lua require('neoscroll').setup()

" telescope-fzf-native
lua << EOF
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}
require('telescope').load_extension('fzf')
EOF

" telescope
nnoremap <leader>ff <cmd> Telescope find_files<cr>
nnoremap <leader>fg <cmd> Telescope live_grep<cr>
nnoremap <leader>fb <cmd> Telescope buffers<cr>
nnoremap <leader>fh <cmd> Telescope help_tags<cr>

" lualine
lua << EOF
require('lualine').setup()
EOF
