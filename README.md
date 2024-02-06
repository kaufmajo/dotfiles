# Dotfiles

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