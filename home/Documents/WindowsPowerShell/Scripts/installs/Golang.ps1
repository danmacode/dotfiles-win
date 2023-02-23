#/usr/bin/env pwsh
#
# This script installs the latest golang available @ winget


function InstallWinget-Go {
    $res = $(winget search --name 'Go Programming Language')
    $res1 = $($res | Sort-Object -Property Version | Select-Object -Last 1 )
    
    $vRegex = 'GoLang\.Go\.\d+.\d+'
    if ($res1 -notmatch $vRegex) {
        throw "Could not determine latest winget Golang ver." 
    }
    else {
        # $Matches contains the results of the regex-matching operation.
        $goId = $Matches.0
        Write-Host "winget install -ie $goId"
        winget install -ie $goId
    }
}

# Main 
InstallWinget-Go
