# escape=`

FROM mcr.microsoft.com/dotnet/sdk:4.8

SHELL ["powershell", "-Command"]
RUN iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')); `
    Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1

RUN choco install -y choco-cleaner

RUN choco install nvm -y

RUN nvm install 8.10.0

RUN nvm use 8.10.0

RUN node -v