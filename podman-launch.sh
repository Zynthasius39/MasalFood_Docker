#!/bin/bash

podman rm -f mf_db
podman rm -f mf_api
podman network rm -f mfnet
podman network create mfnet

podman run -d \
	--rm \
	--name mf_db \
	--network mfnet \
	-v "$(pwd)"/mfdb.sql:/docker-entrypoint-initdb.d/mfdb.sql:ro \
	-e POSTGRES_USER=postgres \
	-e POSTGRES_PASSWORD=S3CR3TP4SSW0RD \
	docker.io/postgres:latest

podman run -d \
	--rm \
	--name mf_api \
	--network mfnet \
	-v "$(pwd)"/api/static:/server/static:ro \
	-v "$(pwd)"/api/main.jar:/server/main.jar:ro \
	-w /server \
	-e MFDB_HOST=mf_db \
	-e MFDB_PORT=5432 \
	-e MFDB_USER=postgres \
	-e MFDB_PASSWORD=S3CR3TP4SSW0RD \
	docker.io/openjdk:21-jdk \
	java -jar /server/main.jar
