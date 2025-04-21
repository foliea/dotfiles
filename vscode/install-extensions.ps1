# Ensure the script stops on errors
$ErrorActionPreference = "Stop"

# Path to the ui-extensions.txt file
$ExtensionsFile = ".\ui-extensions.txt"

# Check if the file exists
if (-Not (Test-Path -Path $ExtensionsFile)) {
    Write-Error "Error: File '$ExtensionsFile' not found."
    exit 1
}

# Check if the 'code' command is available
if (-Not (Get-Command "code" -ErrorAction SilentlyContinue)) {
    Write-Error "Error: 'code' command not found. Please ensure Visual Studio Code is installed and the 'code' command is added to your PATH."
    exit 1
}

# Read and install extensions
Get-Content -Path $ExtensionsFile | ForEach-Object {
    $extension = $_.Trim()
    if (-Not [string]::IsNullOrWhiteSpace($extension)) {
        Write-Host "Installing extension: $extension"
        code --install-extension $extension --force
    }
}
