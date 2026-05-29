# dotvim

> **NOTE**: The complete vim9script setup lives on the dev branch. This branch
> main uses legacy VimScript for compatibility with older Vim versions.

## Structure

```
~/.vim/
├── vimrc                          # Entry point; dirs, filetype detection, sources config/
├── config/
│   ├── options.vim                # Encoding, leader, numbers, search, splits, netrw
│   ├── appearance.vim             # Syntax, statusline, folding
│   ├── editing.vim                # Indentation, wrapping, formatoptions, completion
│   └── mappings.vim               # Leader mappings: tabs, lines, toggles
├── after/
│   └── plugin/autocmds.vim        # Cross-cutting autocommands (yank, whitespace, cursor)
├── autoload/
│   └── utils.vim                  # Lazy-loaded helpers (toggles, PrettierPipe, JqPipe)
├── ftplugin/                      # Per-filetype settings + formatting
│   ├── python.vim                 # tabstop=4, black
│   ├── javascript.vim             # tabstop=2, PrettierPipe
│   ├── typescript.vim             # tabstop=2, PrettierPipe
│   ├── json.vim                   # tabstop=2, JqPipe
│   ├── markdown.vim               # tabstop=4, fold by section, spell
│   ├── yaml.vim                   # tabstop=4, prettier
│   └── vim.vim                    # tabstop=4, fold by marker, :help via K
├── data/
│   ├── backup/                    # Backup files (auto-created)
│   ├── swap/                      # Swap files (auto-created)
│   └── undo/                      # Persistent undo (auto-created)
└── .netrwhist                     # netrw history (auto-generated)
```

## Key mappings

Leader is `<Space>`. All mappings defined in `config/mappings.vim`.

| Mapping      | Action                             |
| ------------ | ---------------------------------- |
| `<leader>cs` | Clear search highlight             |
| `<leader>tn` | Tab new                            |
| `<leader>to` | Tab only                           |
| `<leader>tc` | Tab close                          |
| `<leader>tm` | Tab move (cursor placed)           |
| `<leader>j`  | Move current line down             |
| `<leader>k`  | Move current line up               |
| `<leader>nr` | Toggle relative / absolute numbers |
| `<leader>tp` | Toggle paste mode                  |
| `<leader>fi` | Show file info dialog              |
| `<leader>fm` | Format buffer (per-filetype)       |
| `<leader>vr` | Reload vimrc                       |
| `<leader>w`  | Quick save                         |

Visual-mode `<leader>j`/`<leader>k` move the selected block up/down.

## Formatting

`<leader>fm` is buffer-local, defined per filetype in `ftplugin/`.

| Filetype   | Formatter                          | Fallback |
| ---------- | ---------------------------------- | -------- |
| Python     | `black -q -`                       | `gg=G`   |
| JavaScript | `utils#PrettierPipe()` (defensive) | `gg=G`   |
| TypeScript | `utils#PrettierPipe()` (defensive) | `gg=G`   |
| JSON       | `utils#JqPipe()` (defensive)       | `gg=G`   |
| YAML       | `prettier --stdin-filepath`        | `gg=G`   |
| Markdown   | —                                  | `gg=G`   |
| Vim        | —                                  | `gg=G`   |

`PrettierPipe()` and `JqPipe()` (defined in `autoload/utils.vim`) never clobber the
buffer on non-zero exit — the original content is preserved and a warning shown.

## Autocommands

All defined in `after/plugin/autocmds.vim`.

| Event          | Action                                        |
| -------------- | --------------------------------------------- |
| `TextYankPost` | Brief highlight on yanked text (150ms)        |
| `BufWritePre`  | Strip trailing whitespace (opt-in filetypes)  |
| `BufWritePre`  | Auto-create parent directory                  |
| `BufReadPost`  | Restore cursor position to last edit location |
| `InsertEnter`  | Disable cursorline during insert mode         |
| `InsertLeave`  | Re-enable cursorline after insert mode        |
| `WinLeave`     | Disable cursorline when leaving window        |
| `WinEnter`     | Re-enable cursorline when entering window     |
| `FileType`     | Enable spell check for text/markdown/tex      |
