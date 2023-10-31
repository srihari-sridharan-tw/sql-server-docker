FROM mcr.microsoft.com/mssql/server:2022-latest
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=My_Strong_Password_Cannot_Be_Guessed_In_A_Million_Years
ENV MSSQL_PID=Developer
ENV MSSQL_TCP_PORT=1433
WORKDIR /src
COPY initialize.sql ./initialize.sql
RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service broker manager has started" &&  /opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P My_Strong_Password_Cannot_Be_Guessed_In_A_Million_Years -i initialize.sql