#/usr/bin/env pwsh
#
# ~/Documents/PowerShell/Microsoft.Powershell_profile.ps1 - PowerShell 7 profile
# This file is managed by chezmoi. Always use `chezmoi edit $profile``
# Requires -Version 7

# CHOCOLATEY tab-completions - see https://ch0.co/tab-completion
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
If (Test-Path($ChocolateyProfile)) { Import-Module "$ChocolateyProfile" }

# CUSTOM FUNCS - load own fns at startup
Get-ChildItem "$env:USERPROFILE\Documents\WindowsPowerShell\Functions\*.ps1" | ForEach-Object { .$_ }

# ALIASES
New-Alias np Notepad.exe
Set-Alias tn Test-NetConnection
