# escape=`

FROM chocolatey/choco:latest-windows

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

#RUN Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

#RUN choco install -y choco-cleaner

RUN choco install nvm -y

RUN nvm install 8.10.0

RUN nvm use 8.10.0

RUN node -v