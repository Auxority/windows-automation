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
