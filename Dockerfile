FROM mcr.microsoft.com/dotnet/core/sdk:2.2-alpine3.9 AS build-env
WORKDIR /app

COPY . ./
RUN dotnet restore

COPY . ./
RUN dotnet publish ./marketplace-microservice-backend/marketplace-microservice-backend.csproj -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-alpine3.9
WORKDIR /marketplace-microservice-backend
COPY --from=build-env /app/marketplace-microservice-backend/out .
ENTRYPOINT ["dotnet","marketplace-microservice-backend.dll"]
