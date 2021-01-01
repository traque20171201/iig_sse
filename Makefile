.DEFAULT_GOAL := usage

build:
	docker-compose build

up:
	rm -rf tmp/pids/server.pid
	docker-compose up

stop:
	docker-compose stop

init:
	export DB_PORT=$()
	docker-compose up -d
	docker-compose exec app bin/rails db:create
	db-migrate-up

db-migrate-up:
	scripts/db_migrate "postgres://localhost:5432/app_development?sslmode=disable&user=postgres" up
	scripts/db_migrate "postgres://localhost:5432/app_test?sslmode=disable&user=postgres" up
	docker-compose run --rm app ./bin/rails db:environment:set RAILS_ENV=test

db-migrate-down:
	scripts/db_migrate "postgres://localhost:5432/app_development?sslmode=disable&user=postgres" down
	scripts/db_migrate "postgres://localhost:5432/app_test?sslmode=disable&user=postgres" down

db-migrate-gen:
	migrate create -dir db/migrate -ext sql create_${table}

db-drop-create:
	docker-compose run --rm app ./bin/rails db:environment:set RAILS_ENV=development
	docker-compose run --rm -e RAILS_ENV=development app bundle exec rake db:drop db:create

reset: db-drop-create db-migrate-up

bundle:
	docker-compose run --rm app bundle install

console:
	docker-compose run --rm app bundle exec rails console

bash:
	docker-compose exec app /bin/bash

seed_fu:
	docker-compose run --rm app bin/rails db:seed_fu

usage:
	@echo usage: [build, up, stop, init, db-migrate-up, db-migrate-down, db-migrate-gen, db-drop-create, reset, bundle, console, bash, seed_fu]