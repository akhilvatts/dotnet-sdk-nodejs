ARG BASE_IMAGE
ARG NODE_VERSION

FROM ${BASE_IMAGE}

# Set error and progress preferences for a cleaner experience
SHELL ["powershell", "-ExecutionPolicy", "Bypass", "-Command",  "$ErrorActionPreference = 'Stop'; $ProgressPreference='silentlyContinue';"]  

RUN Invoke-WebRequest -OutFile nodejs.zip -UseBasicParsing "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-win-x64.zip"; 
RUN Expand-Archive nodejs.zip -DestinationPath C:\;
RUN Rename-Item "C:\\node-v${NODE_VERSION}-win-x64" c:\nodejs

# Update PATH environment variable
ENV PATH="$WindowsPATH;C:\nodejs;C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\MSBuild\Current\Bin;C:\Program Files\NuGet;C:\Program Files\dotnet"