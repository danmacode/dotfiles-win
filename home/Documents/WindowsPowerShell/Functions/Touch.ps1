function touch {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )
  
    if (Test-Path -LiteralPath $Path) {
      (Get-Item -Path $Path).LastWriteTime = Get-Date
    }
    else {
        try { New-Item -Type File -Path $Path }
        catch [System.IO.IOException] {
            "Unable to create '$Path'"
        }
    }
}
