# Save the current directory
$pwd = Get-Location

# Install Geforce Experience
winget install --id Nvidia.GeForceExperience -e --source winget

# Install Visual Studio Code
winget install --id Microsoft.VisualStudioCode -e --source winget

# Install Git
winget install --id Git.Git -e --source winget

# Install Brave Browser
winget install --id Brave.Brave -e --source winget

# Install Discord
winget install --id Discord.Discord -e --source winget

# Install NodeJS
winget install --id OpenJS.NodeJS -e --source winget

# Download and install Wargaming Game Center
Invoke-WebRequest -Uri https://redirect.wargaming.net/WGC/Wargaming_Game_Center_Install_WoT_EU.exe -OutFile wargaming-installer.exe
Start-Process .\wargaming-installer.exe -Wait
Remove-Item .\wargaming-installer.exe

# Install Steam
winget install --id Valve.Steam -e --source winget

# Install FanControl
cd ~/Downloads
git clone https://github.com/Rem0o/FanControl.Releases.git FanControl
cd FanControl
Start-Process .\Updater.exe -Wait
cd $pwd

# Install Tidal
winget install --id TIDALMusicAS.TIDAL -e --source winget

# Install Paint.NET
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

# Install Java Development Kit
winget install --id Oracle.JDK.19 -e --source winget

# Install Minecraft
winget install --id Mojang.MinecraftLauncher -e --source winget
