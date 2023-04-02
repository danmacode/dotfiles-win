#/usr/bin/env pwsh
#
# This script installs latest fzf & fd-find
# https://github.com/junegunn/fzf
# https://github.com/sharkdp/fd

winget install -ie Microsoft.VCRedist.2015+.x64
winget install -ie junegunn.fzf
winget install -ie sharkdp.fd
