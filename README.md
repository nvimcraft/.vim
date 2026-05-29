# dotvim

Full-featured Vim 9 script configuration

## Structure

```
~/.vim/
├── vimrc                          # Entry point; creates directories, sources modules
├── config/                        # Explicitly-sourced config modules
│   ├── options.vim                # Core behavior: encoding, numbers, search, splits, mouse
│   ├── appearance.vim             # UI/visual: clipboard, colors, status line, folding
│   ├── editing.vim                # Indentation, wrapping, format options
│   ├── mappings.vim               # All custom mappings
│   ├── lsp.vim                    # LSP server registration and global options
│   └── lsp/                       # Per-language LSP server definitions
│       ├── vtsls.vim              # JavaScript / TypeScript (vtsls)
│       ├── python.vim             # Python (pyright)
│       ├── go.vim                 # Go (gopls)
│       ├── rust.vim               # Rust (rust-analyzer)
│       ├── yaml.vim               # YAML (yaml-language-server)
│       ├── json.vim               # JSON (vscode-json-language-server)
│       ├── html.vim               # HTML (vscode-html-language-server)
│       ├── css.vim                # CSS (vscode-css-language-server)
│       └── markdown.vim           # Markdown (marksman)
├── plugin/
│   └── bootstrap.vim              # Plugin loader: auto-clones and adds to runtimepath
├── after/
│   └── plugin/
│       ├── autocmds.vim           # Post-plugin autocommands: yank highlight, whitespace, cursor
│       ├── fzf.vim                # FZF layout, colors, and preview window config
│       └── gitgutter.vim          # GitGutter sign customization and performance
├── autoload/
│   └── utils.vim                  # On-demand utility functions (toggles, file info, LSP helpers)
├── ftplugin/                      # Per-filetype overrides (python, go, js/ts, yaml, etc.)
├── plugged/                       # Auto-cloned plugin directories
└── data/                          # Runtime artifacts (auto-created)
    ├── backup/
    ├── swap/
    └── undo/
```

## Plugins

Auto-cloned and loaded by `plugin/bootstrap.vim`:

| Plugin                           | Purpose                        |
| -------------------------------- | ------------------------------ |
| `junegunn/fzf`                   | Fuzzy finder engine            |
| `junegunn/fzf.vim`               | FZF Vim integration            |
| `tpope/vim-commentary`           | Toggle comments (`gc`)         |
| `tpope/vim-surround`             | Surround text objects          |
| `tpope/vim-fugitive`             | Git integration                |
| `airblade/vim-gitgutter`         | Git diff signs in the gutter   |
| `jiangmiao/auto-pairs`           | Auto-close brackets and quotes |
| `christoomey/vim-tmux-navigator` | Seamless tmux/vim pane nav     |
| `yegappan/lsp`                   | Built-in LSP client            |

## Key mappings

Leader is `<Space>`.

### General

| Mapping      | Action                  |
| ------------ | ----------------------- |
| `<leader>cs` | Clear search highlight  |
| `<leader>nr` | Toggle relative numbers |
| `<leader>tp` | Toggle paste mode       |
| `<leader>fi` | Show file info          |
| `<leader>fm` | Format file             |
| `<leader>j`  | Move line down          |
| `<leader>k`  | Move line up            |

### Tabs

| Mapping      | Action    |
| ------------ | --------- |
| `<leader>tn` | Tab new   |
| `<leader>to` | Tab only  |
| `<leader>tc` | Tab close |
| `<leader>tm` | Tab move  |

### FZF

| Mapping      | Action    |
| ------------ | --------- |
| `<leader>ff` | Files     |
| `<leader>fb` | Buffers   |
| `<leader>fg` | Rg (grep) |
| `<leader>fH` | Helptags  |

### Git (Fugitive)

| Mapping      | Action     |
| ------------ | ---------- |
| `<leader>gs` | Status     |
| `<leader>gb` | Blame      |
| `<leader>gd` | Diff split |
| `<leader>gl` | Log        |
| `<leader>gw` | Write      |
| `<leader>gu` | Read       |
| `<leader>gc` | Commit     |
| `<leader>gp` | Push       |

### GitGutter

| Mapping      | Action          |
| ------------ | --------------- |
| `]c`         | Next hunk       |
| `[c`         | Previous hunk   |
| `<leader>hs` | Stage hunk      |
| `<leader>hu` | Undo hunk       |
| `<leader>hp` | Preview hunk    |
| `<leader>hS` | Stage all hunks |

### LSP

| Mapping      | Action                                |
| ------------ | ------------------------------------- |
| `gd`         | Go to definition (LSP, fallback tags) |
| `gD`         | Go to declaration                     |
| `gi`         | Go to implementation                  |
| `gI`         | Peek definition                       |
| `K`          | Hover (LSP, fallback `keywordprg`)    |
| `gr`         | Show references                       |
| `grn`        | Rename                                |
| `gca`        | Code action                           |
| `<leader>ds` | Show diagnostics                      |
| `[d`         | Previous diagnostic                   |
| `]d`         | Next diagnostic                       |

## LSP servers

Configured in `config/lsp/`. Each server activates automatically when its binary is
found in `$PATH`.

| Language                | Server                        |
| ----------------------- | ----------------------------- |
| JavaScript / TypeScript | `vtsls`                       |
| Python                  | `pyright-langserver`          |
| Go                      | `gopls`                       |
| Rust                    | `rust-analyzer`               |
| YAML                    | `yaml-language-server`        |
| JSON                    | `vscode-json-language-server` |
| HTML                    | `vscode-html-language-server` |
| CSS                     | `vscode-css-language-server`  |
| Markdown                | `marksman`                    |

## Formatting

`<leader>fm` calls `utils.Format()`, which uses **LSP formatting** if the language
server is running, otherwise falls back to `gg=G` (reindent file). No per-filetype
formatter scripts are configured.

## Autocommands

| Event          | Action                                        |
| -------------- | --------------------------------------------- |
| `TextYankPost` | Brief highlight on yanked text (150ms)        |
| `BufWritePre`  | Strip trailing whitespace, create parent dirs |
| `BufReadPost`  | Restore cursor position to last edit location |
| `InsertEnter`  | Disable cursorline during insert mode         |
| `InsertLeave`  | Re-enable cursorline after insert mode        |
| `FileType`     | Enable spell check for text/markdown/tex      |
