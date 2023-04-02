#/usr/bin/env pwsh
#
# This script installs the Microsoft Visual C/C++ Redistributables

winget install -ie Microsoft.VCRedist.2015+.x64
python -m pip install --upgrade pip # update pip
python -m pip install pywin32 # necessary for VBox
