# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src 

# copy csproj and restore as distinct layers
COPY *.sln .
COPY API/*.csproj ./api/
RUN dotnet restore

# copy everything else and build app
COPY API/. ./api/
WORKDIR /src/api
RUN dotnet publish -o ./dist

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY ./API/dist .
ENTRYPOINT ["dotnet", "API.dll"]

# FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
# WORKDIR /src

# COPY *.sln .  => copia qualquer solution para a area de container
# COPY API/*.csproj ./api/   => copia o csproj para a area do container
# RUN dotnet restore  => restaura todas dependencias do projeto 

# COPY API/. ./api/  => copia todo o conteudo da pasta API para a pasta api dentro do container
# WORKDIR /src/api  => aponta para qual a pasta que vai fazer a ação dentro do container
# RUN dotnet publish -o ./dist  => executa o comando "dotnet publish -o" e indica que todos arquivos criados no publish vai para a pasta dist

# FROM mcr.microsoft.com/dotnet/aspnet:6.0 => indica que vai usar a imagem do aspnet 6 runtime
# WORKDIR /app  => indica que vai para a pastsa /app dentro do container
# COPY ./API/dist .  => copia todos os arquivos de dentro do dist para o /app dentro do container
# ENTRYPOINT ["dotnet", "API.dll"] => executa o comando dotnet API.dll dentro da pasta /app

#dotnet build - para ver se tem algum erro
#dotnet restore - para restaurar as dependencias do projeto
#dotnet publish -o ./dist - gera o dll dentro da pasta dist
#docker build -t nome-imagem .
#docker container run -p 5000:80 nome-imagem