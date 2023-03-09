# Dotfiles

## Neovim

https://neovim.io/

This setup is inspired by <a href="https://github.com/jessarcher/dotfiles">Jess Archer</a> from a <a href="https://laracasts.com">Laracasts.com</a> series. Thank you!

### Environment

For my installation I am using Windows terminal, running a Debian distribution with WSL2.

### WSL2 Terminal 

#### Neovim

For the Neovim installation, I followed the instructions underneath the 'AppImage ("universal" Linux package)' section: 

https://github.com/neovim/neovim/wiki/Installing-Neovim

#### Linux Packets

Further packet requirements, in order to fully use/install several Neovim plugins

```
sudo apt install make
sudo apt install gcc
sudo apt-get install g++
sudo apt install ripgrep
sudo apt-get install fd-find
sudo apt-get install npm
```

#### Node

To install the current node version, please refer to this page: https://nodejs.org/en/download/package-manager/

```
sudo npm install -g tree-sitter-cli
```

#### Composer

Install composer **globally**, so it can be used for plugin installation like phpactor

https://getcomposer.org/download/


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

## Windows Terminal 

### Install a Nerd font on the OS: 

https://learn.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup

https://www.nerdfonts.com/font-downloads

Configure this new font within Windows Terminal Settings.

### Customize PowerShell-Prompt with "Oh My Posh"

https://learn.microsoft.com/de-de/windows/terminal/tutorials/custom-prompt-setup

An example powershell profile file can be found in "terminal/Microsoft.PowerShell_profile.ps1".

### Powershell Profile

The currently used profile path is stored with the system variable "$PROFILE".

https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.3


## Git

### CRLF Setting

https://stackoverflow.com/questions/2825428/why-should-i-use-core-autocrlf-true-in-git

https://www.git-scm.com/book/en/v2/Customizing-Git-Git-Configuration

```
git config --global core.autocrlf false
```