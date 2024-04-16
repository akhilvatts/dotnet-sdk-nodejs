# escape=`

ARG BASE_IMAGE
ARG NODE_VERSION

FROM ${BASE_IMAGE}

SHELL ["powershell", "-Command"]
RUN iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')); `
    Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1

RUN choco install -y choco-cleaner

RUN choco install nvm -y

RUN nvm install ${NODE_VERSION}

RUN nvm use ${NODE_VERSION}

RUN node -v