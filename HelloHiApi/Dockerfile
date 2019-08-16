FROM mcr.microsoft.com/dotnet/core/aspnet:latest AS base  
WORKDIR app  
COPY bin/Debug/netcoreapp2.1/publish .  
ENTRYPOINT ["dotnet", "HelloHiApi.dll"]  