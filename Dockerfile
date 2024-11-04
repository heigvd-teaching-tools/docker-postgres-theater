# syntax=docker/dockerfile:1

#
# Compress data input
#
FROM alpine AS prepare
COPY init.sql /data/
RUN gzip /data/init.sql


#
# Base Postgres configuration
#
FROM postgres:16.4-alpine AS base

ENV POSTGRES_DB=postgres
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres


#
# Load data input into the db
#
FROM base AS builder

# Do not keep postgres running after initial loading
RUN ["sed", "-i", "s/exec \"$@\"/echo \"skipping...\"/", "/usr/local/bin/docker-entrypoint.sh"]

ENV PG_USER=postgres
ENV PGDATA=/data

COPY --from=prepare /data/init.sql.gz /docker-entrypoint-initdb.d/

RUN ["/usr/local/bin/docker-entrypoint.sh", "postgres"]


#
# Prepared db with loaded content
#
FROM base

COPY --from=builder /data $PGDATA
