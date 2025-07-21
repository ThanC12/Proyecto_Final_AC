# Imagen base para .NET runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080

# Imagen base para SDK
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["LOGIN1/LOGIN1.csproj", "LOGIN1/"]
RUN dotnet restore "LOGIN1/LOGIN1.csproj"
COPY . .
WORKDIR "/src/LOGIN1"
RUN dotnet build "LOGIN1.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "LOGIN1.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "LOGIN1.dll"]
