# Requires -Version 3.0
# A script to prepare the build/run environment for the devcontainer.

$ErrorActionPreference = 'Stop'

# Make sure we're in the root of the repository.
Set-Location "$PSScriptRoot/../../"

# Make sure the .env file exists for the devcontainer to load.
if (!(Test-Path -PathType Leaf '.devcontainer/.env')) {
    Write-Host "Creating empty .env file for devcontainer."
    New-Item -ErrorAction SilentlyContinue -Type File -Name '.devcontainer/.env'
}
