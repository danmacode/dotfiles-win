#/usr/bin/env pwsh
#
# This script does the following:
# - remove the shortcut that links "python" to the store install
# - dowload & graphic install of latest Python3 (from official site) if none present
# - add python folder to user path
# - update pip 

function Remove-Shortcut {
    # remove windows store python shortcut
    Remove-Item -Path "C:\Users\user\AppData\Local\Microsoft\WindowsApps\python3.exe" -Force -ErrorAction SilentlyContinue
}
function Install-Python {
    $downloadURl = "https://www.python.org/downloads/"
    $downloadRegex = '\bhref="(?<url>.+?\.exe)"\s*>\s*Download Python (?<version>\d+\.\d+\.\d+)'
    if ((Invoke-RestMethod $downloadURl) -notmatch $downloadRegex) {
        throw "Could not determine latest Python version and download URL" 
    }
    else {
        # $Matches contains the results of the regex-matching operation.
        $Url = $Matches.url
        $pyPath = "${env:TEMP}\python-$($Matches.version).exe"
        Invoke-WebRequest -URI $Url -OutFile $pyPath
     
        # install python
        # $Command = "$pyPath /InstallAllUsers=1 CompileAll=1 PrependPath=1"
        # Invoke-Expression -Command $Command -Wait
        Start-Process -FilePath $pyPath -Wait
        Write-Host "Python installed"
        Remove-Item -Path $pyPath -Force
    } 
}

function Add-ToPath {
    # Add user python folder
    [string]$verFolder = ""
    $verFolder = $(Get-ChildItem ${env:APPDATA}\Python* | Select-Object -First 1)
    if ($verFolder -eq "") {
        # No AppData folder for Python, must be at C:\ (e.g. C:\Python10)
        Write-Host "No appdata python found, switching to $env:SystemDrive\Python*"
        $verFolder = $(Get-ChildItem ${env:SystemDrive}\Python* | Select-Object -First 1)
    }
    # Maybe the file is in another location - e.g. C:\Program Files\Python311
    if (!(Test-Path $verFolder)) { $verFolder = $(Split-Path -Path (get-command python.exe).Path -Parent) }
    if (!(Test-Path $verFolder)) {
        throw "Can't find Python folder"
    }
    else {
        Write-Host "Adding $verFolder to PATH"
        Add-Path -LiteralPath "$verFolder\" -Scope User
        Add-Path -LiteralPath "$verFolder\Scripts\" -Scope User
    }
}

function Update-Pip {
    # upgrade pip
    python -m pip install --upgrade pip
    Write-Host "Running 'python -m pip install --upgrade pip'"
    if (-not $?) {
        Write-Host "might need to use 'python -m ensurepip'"
    }
}

# Main entry point

Remove-Shortcut
if ($?) { Install-Python }
if ($?) { Add-ToPath }
if ($?) { Update-Pip }
