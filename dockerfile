# escape=`

FROM mcr.microsoft.com/dotnet/sdk:6.0

#SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';$ProgressPreference='silentlyContinue';"]

RUN Invoke-WebRequest -OutFile nodejs.zip -UseBasicParsing "https://nodejs.org/dist/v8.10.0/node-v8.10.0-win-x64.zip"; `
Expand-Archive nodejs.zip -DestinationPath C:\; `
Rename-Item "C:\\node-v8.10.0-win-x64" c:\nodejs

ENV PATH="$WindowsPATH;c:\nodejs"
ENV PATH="$WindowsPATH;c:\Program Files\dotnet"

RUN npm config set registry https://registry.npmjs.org/