FROM alpine as prepare
COPY init.sql /data/
RUN gzip /data/init.sql



FROM postgres:13.3-alpine as builder

RUN ["sed", "-i", "s/exec \"$@\"/echo \"skipping...\"/", "/usr/local/bin/docker-entrypoint.sh"]

ENV POSTGRES_DB=postgres
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV PG_USER=postgres

ENV PGDATA=/data

COPY --from=prepare /data/init.sql.gz /docker-entrypoint-initdb.d/

RUN ["/usr/local/bin/docker-entrypoint.sh", "postgres"]



FROM postgres:13.3-alpine

ENV POSTGRES_DB=postgres
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

COPY --from=builder /data $PGDATA
