#/usr/bin/env pwsh
#
# This script installs the necessary requirements for Rust

winget install -ie Microsoft.VCRedist.2015+.x64
winget install -ie Microsoft.VisualStudio.2022.BuildTools
winget install -ie Rustlang.Rustup
