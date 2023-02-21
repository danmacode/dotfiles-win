#/usr/bin/env pwsh
#
# This script installs latest flutter stable
# Flutter default location - C:\dev\flutter\bin\flutter.bat

function Install-Flutter {
    # Set CHROME_EXECUTABLE to microsoft edge
    SetX CHROME_EXECUTABLE "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe"
    
    # Set envar JAVA_HOME "C:\Program Files\Java\jdk-19"
    if (Test-Path "${env:ProgramFiles}\Java\jdk-19") {
        sudo setx /m JAVA_HOME "${env:ProgramFiles}\Java\jdk-19"
        # Add "%JAVA_HOME%\bin" to system Path
        sudo Add-Path -LiteralPath "%JAVA_HOME%\bin" -Scope Machine
    }
    
    

    # download latest stable branch
    git clone 'https://github.com/flutter/flutter.git' -b stable --depth 1

    # add bin folder to user PATH variable
    Add-Path -LiteralPath "$env:SystemDrive\dev\futter\bin" -Scope User

    # Trigger a download of the SDK dependencies
    & "$env:SystemDrive\dev\flutter\bin\flutter.bat" --version
    
    # Disable analytics
    & "$env:SystemDrive\dev\flutter\bin\dart.bat" --disable-analytics

    # Accept required Android Licenses
    & "$env:SystemDrive\dev\flutter\bin\flutter.bat" flutter doctor --android-licenses

    # Refresh PATH VAR 
    Write-Host 'Use "RefreshEnv" in a new shell to get new PATH vars'
    Write-Host 'Upgrade with "flutter upgrade"'
}

Install-Flutter
