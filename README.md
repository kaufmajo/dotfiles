# Dotfiles

## Neovim

https://neovim.io/

This setup is inspired by <a href="https://github.com/jessarcher/dotfiles">Jess Archer</a> from a <a href="https://laracasts.com">Laracasts.com</a> series. Thank you!

### Environment

For my installation I am using Windows terminal, running a Debian distribution with WSL2.

### WSL2 Terminal 

For the Neovim installation, I followed the instructions underneath the 'AppImage ("universal" Linux package)' section: 

https://github.com/neovim/neovim/wiki/Installing-Neovim

Further packet requirements, in order to fully use/install several Neovim plugins

```
sudo apt install make
sudo apt install gcc
sudo apt install ripgrep
sudo apt-get install fd-find
```

### Windows Terminal 

Install a Nerd font on the OS: 

https://learn.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup

https://www.nerdfonts.com/font-downloads

Configure this new font within Windows Terminal Settings.

### Using Windows Clipboard with Neovim

https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl

```
File: options.lua

--
-- clipboard
--

vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
         ["+"] = "win32yank.exe -i --crlf",
         ["*"] = "win32yank.exe -i --crlf"
    },
    paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf"
    },
    cache_enabled = false
}
```
