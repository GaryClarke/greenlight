# Load .env file automatically
include .env
export $(shell sed 's/=.*//' .env)

# Create the new confirm target.
confirm:


run/api:
	go run ./cmd/api

db/psql:
	psql ${GREENLIGHT_DB_DSN}

db/migrations/new:
	migrate create -seq -ext=.sql -dir=./migrations ${name}

db/migrations/up:
	@echo 'Running up migrations...'
	migrate -path ./migrations -database $(DATABASE_DSN) up
