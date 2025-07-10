# PowerShell Profile with Starship Prompt

# Initialize Starship prompt
Invoke-Expression (&starship.exe init powershell)

# Set basic environment variables
$env:EDITOR = "code"
$env:VISUAL = "code"

# Set PSReadLine options for better command line experience
if (Get-Module -ListAvailable PSReadLine) {
    Set-PSReadLineOption -BellStyle None
    Set-PSReadLineKeyHandler -Key Tab -Function Complete
}