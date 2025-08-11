# --- dev stage: hot reload ---
FROM mcr.microsoft.com/dotnet/sdk:9.0-azurelinux3.0 AS dev
WORKDIR /work
ENV ASPNETCORE_URLS=http://0.0.0.0:8080 \
    DOTNET_WATCH_SUPPRESS_LAUNCH_BROWSER=1 \
    DOTNET_USE_POLLING_FILE_WATCHER=1
EXPOSE 8080
CMD ["dotnet","watch","--project","src/BracketWatch.API/BracketWatch.API.csproj","run","--urls","http://0.0.0.0:8080"]

FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:9.0-azurelinux3.0 AS build
WORKDIR /source
COPY . .
ARG TARGETARCH
RUN --mount=type=cache,id=nuget,target=/root/.nuget/packages \
    dotnet publish -a ${TARGETARCH/amd64/x64} --use-current-runtime --self-contained false -c Release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:9.0.8-azurelinux3.0-distroless-composite AS final
WORKDIR /app
ENV ASPNETCORE_URLS=http://0.0.0.0:8080
COPY --from=build /app .
USER $APP_UID
ENTRYPOINT ["dotnet","BracketWatch.API.dll"]
