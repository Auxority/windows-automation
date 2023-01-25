# Save the current directory
$pwd = Get-Location

$WingetPrograms = @(
    'Nvidia.GeForceExperience',
    'Microsoft.PowerToys',
    'Microsoft.VisualStudioCode',
    'Git.Git',
    'Brave.Brave',
    'Discord.Discord',
    'OpenJS.NodeJS',
    'Valve.Steam',
    'TIDALMusicAS.TIDAL',
    'Oracle.JDK.19',
    'Mojang.MinecraftLauncher',
    'WhatsApp.WhatsApp',
    'Corsair.iCUE.4'
)

# Install all the programs
foreach ($program in $WingetPrograms) {
    try {
        winget install --id $program -e --source winget
    } catch {
        Write-Host "Failed to install $($program): $($_.Exception.Message)"
    }
}

# Download and install Wargaming Game Center
try {
    Invoke-WebRequest -Uri https://redirect.wargaming.net/WGC/Wargaming_Game_Center_Install_WoT_EU.exe -OutFile wargaming-installer.exe
    Start-Process .\wargaming-installer.exe -Wait
    Remove-Item .\wargaming-installer.exe
} catch {
    Write-Host "Failed to install Wargaming Game Center: $($_.Exception.Message)"
}

# Install FanControl
try {
    cd ~/Downloads
    git clone https://github.com/Rem0o/FanControl.Releases.git FanControl
    cd FanControl
    Start-Process .\Updater.exe -Wait
    cd $pwd
} catch {
    Write-Host "Failed to install FanControl: $($_.Exception.Message)"
}

# Install Paint.NET
try {
    cd ~/Downloads
    $html = Invoke-RestMethod -Uri https://www.dotpdn.com/downloads/pdn.html
    $html -match 'download\/v(.*?)\/paint' | Out-Null
    $pdnVersion = $Matches[1]
    $downloadUrl = "https://github.com/paintdotnet/release/releases/download/v$pdnVersion/paint.net.$pdnVersion.winmsi.x64.zip"
    Invoke-WebRequest -Uri $downloadUrl -OutFile paintdotnet.zip
    Expand-Archive .\paintdotnet.zip -DestinationPath .\paintdotnet
    Start-Process .\paintdotnet\paint.net.$pdnVersion.winmsi.x64.msi -Wait
    Remove-Item .\paintdotnet.zip
    Remove-Item .\paintdotnet -Recurse
    cd $pwd
} catch {
    Write-Host "Failed to install Paint.NET: $($_.Exception.Message)"
}
