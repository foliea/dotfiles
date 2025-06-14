<#
.SYNOPSIS
    A PowerShell script to automate the setup and configuration of a new Windows computer.

.DESCRIPTION
    This script streamlines the setup of a new Windows installation by performing the following actions:
    - Checks for and requests Administrator privileges.
    - Installs a list of common applications using the Windows Package Manager (winget).
    - Configures essential Windows settings for a better user experience (e.g., showing file extensions).
    - (Optional) Removes pre-installed bloatware applications.

.NOTES
    Author: Gemini
    Version: 1.0

    HOW TO RUN THIS SCRIPT:
    1. Save this entire file with a '.ps1' extension (e.g., "setup.ps1").
    2. Right-click the Start button and select "Windows PowerShell (Admin)" or "Terminal (Admin)".
    3. In the PowerShell window, you may need to change the execution policy to allow this script to run.
       Type the following command and press Enter, then type 'Y' and press Enter:
       Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
    4. Navigate to the directory where you saved the script. For example, if you saved it to your Desktop:
       cd $env:USERPROFILE\Desktop
    5. Run the script by typing its name and pressing Enter:
       .\setup.ps1
#>

#================================================================================================
# SCRIPT CONFIGURATION
#================================================================================================

# --- Customize Your Applications Here ---
# Add or remove applications from this list as you see fit.
# To find the ID of a package, use the command: winget search "Application Name"
$applicationsToInstall = @(
    # --- Browsers ---
    "Google.Chrome",

    # --- Communication ---
    "Discord.Discord",
    "Signal.Signal",
    "Whatsapp.WhatsApp",

    # --- Productivity & Utilities ---
    "7zip.7zip",
    "Microsoft.PowerToys",

    # --- Developer Tools ---
    "Microsoft.VisualStudioCode",
    "Wrap.Wrap",
    "Docker.DockerDesktop",
    "Ubuntu.Ubuntu",
    "PowerShell.PowerShell",
)

# --- Set to $true to run the bloatware removal section ---
$removeBloatware = $true

#================================================================================================
# SCRIPT LOGIC - Do not edit below unless you know what you are doing.
#================================================================================================

#region Administrative Priveleges Check
#------------------------------------------------------------------------------------------------
# Check if the script is running as an Administrator, and if not, re-launch it as admin.
#------------------------------------------------------------------------------------------------
function Start-ScriptAsAdmin {
    if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Warning "Administrator permissions are required to run this script."
        Write-Warning "Attempting to re-launch as Administrator..."
        Start-Process pwsh -Verb RunAs -ArgumentList "-NoProfile -File `"$PSCommandPath`""
        exit
    }
}
#endregion

#region Core Functions
#------------------------------------------------------------------------------------------------
# Functions for installing software, changing settings, and removing apps.
#------------------------------------------------------------------------------------------------

function Install-Software {
    Write-Host "`n"
    Write-Host "===============================================" -ForegroundColor Cyan
    Write-Host "         STARTING SOFTWARE INSTALLATION        " -ForegroundColor Cyan
    Write-Host "===============================================" -ForegroundColor Cyan
    Write-Host "This will install the apps defined in the '`$applicationsToInstall' list."

    # Check if winget is available
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Write-Error "FATAL: Windows Package Manager (winget) is not installed or not in your PATH."
        Write-Error "Please install App Installer from the Microsoft Store to continue: https://aka.ms/getwinget"
        exit
    }

    foreach ($app in $applicationsToInstall) {
        Write-Host "`n-----------------------------------------------" -ForegroundColor Green
        Write-Host "Installing $app..." -ForegroundColor Yellow

        # Check if the package is already installed
        $installed = winget list --id $app --accept-source-agreements
        if ($installed -match $app) {
            Write-Host "$app is already installed. Skipping." -ForegroundColor Green
        } else {
            winget install --id $app -e --accept-package-agreements --accept-source-agreements
            if ($LASTEXITCODE -ne 0) {
                Write-Error "Failed to install $app. Please check the output above for errors."
            } else {
                Write-Host "Successfully installed $app." -ForegroundColor Green
            }
        }
    }
    Write-Host "`n`n[SUCCESS] Software installation process complete." -ForegroundColor Green
}

function Configure-WindowsSettings {
    Write-Host "`n"
    Write-Host "===============================================" -ForegroundColor Cyan
    Write-Host "         CONFIGURING WINDOWS SETTINGS          " -ForegroundColor Cyan
    Write-Host "===============================================" -ForegroundColor Cyan

    # --- Show File Extensions in File Explorer ---
    Write-Host "Enabling 'Show File Extensions'..." -ForegroundColor Yellow
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0 -Force

    # --- Show Hidden Files and Folders ---
    Write-Host "Enabling 'Show Hidden Files'..." -ForegroundColor Yellow
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1 -Force

    # --- Enable Dark Mode for Apps ---
    Write-Host "Enabling Dark Mode for applications..." -ForegroundColor Yellow
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0 -Type DWord -Force

    # --- Enable Dark Mode for System ---
    Write-Host "Enabling Dark Mode for system..." -ForegroundColor Yellow
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0 -Type DWord -Force

    Write-Host "`n[SUCCESS] Windows settings configured." -ForegroundColor Green
}

function Remove-Bloatware {
    if (-not $removeBloatware) {
        Write-Host "`nSkipping bloatware removal. To enable, set '`$removeBloatware' to `$true at the top of the script." -ForegroundColor Gray
        return
    }

    Write-Host "`n"
    Write-Host "===============================================" -ForegroundColor Red
    Write-Host "            REMOVING BLOATWARE                 " -ForegroundColor Red
    Write-Host "===============================================" -ForegroundColor Red

    $bloatware = @(
      # To be determined on next machine setup
    )

    foreach ($app in $bloatware) {
        Write-Host "Attempting to remove $app..." -ForegroundColor Yellow
        Get-AppxPackage -AllUsers $app | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
        if ($?) {
            Write-Host "Removed $app." -ForegroundColor Green
        } else {
            Write-Host "Could not remove or find $app." -ForegroundColor Gray
        }
    }

    Write-Host "`n[SUCCESS] Bloatware removal process complete." -ForegroundColor Green
}
#endregion

#================================================================================================
# SCRIPT EXECUTION
#================================================================================================

# --- Start of Script ---
Start-ScriptAsAdmin

Write-Host "===============================================" -ForegroundColor Magenta
Write-Host "         WINDOWS SETUP SCRIPT STARTED          " -ForegroundColor Magenta
Write-Host "===============================================" -ForegroundColor Magenta

# --- Execute Main Functions ---
Install-Software
Configure-WindowsSettings
Remove-Bloatware

Write-Host "`n`n"
Write-Host "===============================================" -ForegroundColor Magenta
Write-Host "             SETUP SCRIPT FINISHED             " -ForegroundColor Magenta
Write-Host "===============================================" -ForegroundColor Magenta
Write-Host "It's recommended to restart your computer to ensure all changes take effect." -ForegroundColor Cyan
