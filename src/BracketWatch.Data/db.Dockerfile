FROM mcr.microsoft.com/mssql/server:latest AS sqlserver
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=BracketWatchAdmin76
ENV MSSQL_DBNAME=Bracket_Watch
EXPOSE 1433 