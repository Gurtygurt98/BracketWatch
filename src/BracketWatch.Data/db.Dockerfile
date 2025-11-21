FROM mcr.microsoft.com/mssql/server:latest AS sqlserver
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=BracketWatchAdmin76
ENV MSSQL_DBNAME=Bracket_Watch
EXPOSE 1433 
VOLUME /var/opt/mssql/data
VOLUME /var/opt/mssql/log