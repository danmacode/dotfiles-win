#/usr/bin/env pwsh
#
# This file is managed by chezmoi. Always use `chezmoi edit $profile``

# CHOCOLATEY tab-completions - see https://ch0.co/tab-completion
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
If (Test-Path($ChocolateyProfile)) { Import-Module "$ChocolateyProfile" }

# CUSTOM FUNCS - load own fns at startup
$FuncsDir = "$env:USERPROFILE\Documents\WindowsPowerShell\Functions"
If (Test-Path($FuncsDir)) { Get-ChildItem $FuncsDir | ForEach-Object { .$_ } }

# ALIASES
New-Alias np Notepad.exe
Set-Alias tn Test-NetConnection

# Use starship or custom pwsh prompt
if (Get-Command starship) { Invoke-Expression (&starship init powershell) }
else {
	function Prompt {
		Write-Host ($PWD -replace [regex]::Escape([Environment]::GetFolderPath("UserProfile")), "~") -ForegroundColor Cyan
		Write-Host (Get-Date -format HH:mm) -NoNewLine
		return " ❯ ";
	}
}
