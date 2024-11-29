# dotfiles.nvim

## :arrow_up: Update
`:Lazy` + `Shift + U`
<br/>
:exclamation: Make sure you have a compiler in path

## Util info
`:h starting` and `:h base-directories.`

## :handshake: Dependencies
### C/C++ compiler
- Windows: `msys2` or [`Build Tools for Visual Studio 2022`](https://aka.ms/vs/17/release/vs_BuildTools.exe)
- Ubuntu: `sudo apt update && sudo apt install build-essential`

### `file` command
- Windows: part of Git installation (`C:\Program Files\Git\usr\bin\file.exe`)

### [fd](https://github.com/sharkdp/fd)
- Windows: `winget install sharkdp.fd`
- Linux: `apt install fd-find`

### [fzf](https://github.com/junegunn/fzf)
- Windows: `winget install fzf`
- Linux: `sudo apt install fzf` 

### [ripgrep](https://github.com/BurntSushi/ripgrep)
- Windows: `$ winget install BurntSushi.ripgrep.MSVC`
- Linux `sudo apt-get install ripgrep`

## :wrench: Fix-Ups
### markdown-preview
- Disabled in `markdown-preview.lua`, enable it on Windows
- Windows only: `:Lazy build markdown-preview.nvim` before using first time


## TODOs
- [ ] Use `vivify` on Linux
- [ ] Disable `markdown-preview` for Linux
