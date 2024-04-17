FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-1803

# Set error and progress preferences for a cleaner experience
SHELL ["powershell", "-ExecutionPolicy", "Bypass", "-Command",  "$ErrorActionPreference = 'Stop'; $ProgressPreference='silentlyContinue';"]  

RUN Invoke-WebRequest -OutFile nodejs.zip -UseBasicParsing "https://nodejs.org/dist/v8.10.0/node-v8.10.0-win-x64.zip"; 
RUN Expand-Archive nodejs.zip -DestinationPath C:\;
RUN Rename-Item "C:\\node-v8.10.0-win-x64" c:\nodejs

# Update PATH environment variable
ENV PATH="$WindowsPATH;C:\nodejs"

ENV PATH="$WindowsPATH;C:\Program Files\dotnet"

ENV PATH="$WindowsPATH;C:\Program Files\NuGet"

ENV PATH="$WindowsPATH;C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\MSBuild\Current\Bin"