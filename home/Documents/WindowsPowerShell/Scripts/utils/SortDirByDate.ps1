#/usr/bin/env pwsh
<#
    A function to sort all files inside a directory by date
    Usage: SortDirByDate -Path <path>
    Example: SortDirByDate -Path ~\Downloads
#>
# https://stackoverflow.com/questions/29126555/set-data-structure-in-powershell
# https://stackoverflow.com/questions/53990444/in-powershell-how-can-i-create-a-hashset-with-the-constructor-accepting-a-collec

Function SortDirByDate {
    [CmdletBinding()]
    param (
        [parameter(Mandatory = $False)][string]$Dir = "$env:USERPROFILE\Downloads"
    )
    process {
        [Object[]]$Files = Get-ChildItem -Path $Dir -File # Array of objects (files)

        $DateSet = New-Object System.Collections.Generic.HashSet[String]
        $DateSet.Add($(Get-Date -f "yyyy-MM-dd"))
        ForEach ($f in $Files) {
            $fDay = $f.CreationTime | Get-Date -f "yyyy-MM-dd"
            # Create folder for yyyy-MM-dd if not exists
            if (!($DateSet.Contains($fDay))) { 
                New-Item -Path "$Dir\$fDay" -ItemType Directory -Force | Out-Null
            } 
            Move-Item -Path "$Dir\$f" -Destination "$Dir\$fDay" | Out-Null
        }

    }
}


 

