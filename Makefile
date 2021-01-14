.DEFAULT_GOAL := usage

build:
	docker-compose build

init:
	export DB_PORT=$()
	if [ -z "$$(docker network ls -q -f name=iig_sse)" ]; then docker network create iig_sse; fi
	docker-compose up -d
	docker-compose exec app bin/rails db:create

db-migrate-up:
	migrate -path db/migrate_sql -database "postgres://localhost:5437/iig_sse?sslmode=disable&user=postgres" up
	docker-compose run --rm -T app bin/rails db:schema:dump
	docker-compose run --rm app ./bin/rails db:environment:set RAILS_ENV=production

db-migrate-down:
	migrate -path db/migrate_sql -database "postgres://localhost:5437/iig_sse?sslmode=disable&user=postgres" down
	docker-compose run --rm -T app bin/rails db:schema:dump

init-data:
	docker-compose run --rm app psql -U postgres -d iig_sse -h db -p 5432 -f ./db/prod_data_sql/00_data_insert.sql

seed-fu:
	docker-compose run --rm app bin/rails db:seed_fu

fix-webpacker:
	docker-compose run --rm app bundle exec rails webpacker:install

up:
	rm -rf tmp/pids/server.pid
	docker-compose up -d

down:
	docker-compose down

stop:
	docker-compose stop

bash:
	docker-compose exec app /bin/bash

bundle:
	docker-compose run --rm app bundle install

console:
	docker-compose run --rm app bundle exec rails console

reset: db-drop-create db-migrate-up

db-drop-create:
	# docker-compose run --rm app ./bin/rails db:environment:set RAILS_ENV=production
	# docker-compose run --rm -e RAILS_ENV=production app bundle exec rake db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1 db:create

debug:
	rm -rf tmp/pids/server.pid
	docker-compose up

usage:
	@echo usage: [build, init, db-migrate-up, db-migrate-down, init-data, seed_fu, fix-webpacker, up, down, stop, bash, bundle, console, reset, db-drop-create, debug]
