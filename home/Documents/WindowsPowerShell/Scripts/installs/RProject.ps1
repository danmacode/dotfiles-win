#/usr/bin/env pwsh
#
# This script installs R project & adds its bin folder to path 

function Install-RProject {
    if (Get-Command winget) {
        winget install -ie RProject.R
    }
    else {
        choco install r.project -y 
    }
}

function Add-ToPath {
    $text = (winget list --id Rproject.R)
    $regex = "[\d\.]+";
    $Matches = [Regex]::Matches($text, $regex);
    $RVersion = $Matches[0].Value; # "R-4.2.3"
    $BinDir = "$env:ProgramFiles\R\$RVersion\bin"

    Write-Host "Adding $BinDir to PATH"
    if (Get-Command refreshenv) {
        Write-Host "Alias refreshenv currently installed"
        refreshenv
    }
}

function Install-RStudio {
    winget install -ie Posit.RStudio
}
