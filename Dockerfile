#Dockerfile

FROM mcr.microsoft.com/dotnet/sdk:6.0

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

COPY DotnetTemplate.Web /DotnetTemplate.Web

WORKDIR /DotnetTemplate.Web

RUN dotnet build
RUN npm install && npm run build

ENTRYPOINT ["dotnet", "run"]