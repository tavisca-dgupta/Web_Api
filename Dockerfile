FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS runtime

WORKDIR app  
COPY bin/Debug/netcoreapp2.1/publish .  
   
ENTRYPOINT ["dotnet", "HelloHiApi.dll"]  

