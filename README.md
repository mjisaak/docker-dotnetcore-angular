# Build container for dotnet Angular projects
Docker image to build dotnet core based Angular projects

This image is based on *microsoft/dotnet:2.2-sdk* and contains everything you need to build a dotnet core based Angular project:
* Node.js 8.x LTS
* NPM (latest)
* node-sass (latest)
* Angular CLI (latest)

The image will reduce your build time to a minimum since you don't have to run ```npm rebuild node-sass``` for every build.

[![Build Status](https://dev.azure.com/mjisaak/dockerhub-dotnetcore-angular/_apis/build/status/mjisaak.docker-dotnetcore-angular?branchName=master)](https://dev.azure.com/mjisaak/dockerhub-dotnetcore-angular/_build/latest?definitionId=4&branchName=master)

# Usage

Consider you created a project using ```dotnet new angular -o MyAngular```, all you need to containerize your project is the following Dockerfile:

```bash
FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mjibrandl/dotnetcore-angular:latest AS build
WORKDIR /src
COPY ["MyAngular.csproj", "./"]
RUN dotnet restore "./MyAngular.csproj"
COPY . .
WORKDIR "/src"
RUN dotnet build "MyAngular.csproj" -c Release -o /app

FROM build AS publish

RUN dotnet publish "MyAngular.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "MyAngular.dll"]
```