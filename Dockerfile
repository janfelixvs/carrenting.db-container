FROM mariadb:latest

ENV MARIADB_ROOT_PASSWORD=12345
ENV MARIADB_DATABASE=carrenting

ADD setup.sql /docker-entrypoint-initdb.d/