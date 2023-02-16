#/usr/bin/env pwsh
#
# This scripts extends the path length limit

Set-ItemProperty 'HKLM:\System\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1
