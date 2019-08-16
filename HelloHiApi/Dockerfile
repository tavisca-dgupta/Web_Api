FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY HelloHiApi/HelloHiApi.csproj HelloHiApi/
RUN dotnet restore HelloHiApi/HelloHiApi.csproj
COPY . .
WORKDIR /src/HelloHiApi
RUN dotnet build HelloHiApi.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish HelloHiApi.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "HelloHiApi.dll"]
