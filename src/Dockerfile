# Build stage
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

COPY Server/Insurance.Server.csproj Server/
COPY Client/Insurance.Client.csproj Client/
COPY Shared/Insurance.Shared.csproj Shared/

RUN dotnet restore Server/Insurance.Server.csproj

COPY . .

RUN dotnet publish Server/Insurance.Server.csproj -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app

ENV ASPNETCORE_URLS=http://+:8080

COPY --from=build /app/publish .

EXPOSE 8080

ENTRYPOINT ["dotnet", "Insurance.Server.dll"]
