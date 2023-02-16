#/usr/bin/env pwsh
#
# This scripts keeps the windows session alive by sending SCROLLLOCK key signal

$wsh = New-Object -ComObject WScript.Shell
while ($true) {
    $wsh.SendKeys('{SCROLLLOCK}')
    Start-Sleep 60
}
