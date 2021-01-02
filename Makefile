.DEFAULT_GOAL := usage

build:
	docker-compose build

up:
	rm -rf tmp/pids/server.pid
	docker-compose up

down:
	docker-compose down

stop:
	docker-compose stop

init:
	export DB_PORT=$()
	if [ -z "$$(docker network ls -q -f name=iig)" ]; then docker network create iig; fi
	docker-compose up -d
	docker-compose exec app bin/rails db:create
	db-migrate-up

db-migrate-up:
	# For container is running on Linux(Ubuntu, CentOS)
	scripts/db_migrate "postgres://localhost:5432/app_development?sslmode=disable&user=postgres" up
	scripts/db_migrate "postgres://localhost:5432/app_test?sslmode=disable&user=postgres" up
	# For container is running on Windows or MacOS
	# scripts/db_migrate "postgres://host.docker.internal:5432/app_development?sslmode=disable&user=postgres" up
	# scripts/db_migrate "postgres://host.docker.internal:5432/app_test?sslmode=disable&user=postgres" up
	docker-compose run --rm app ./bin/rails db:environment:set RAILS_ENV=test

db-migrate-down:
	# For container is running on Linux(Ubuntu, CentOS)
	scripts/db_migrate "postgres://localhost:5432/app_development?sslmode=disable&user=postgres" down
	scripts/db_migrate "postgres://localhost:5432/app_test?sslmode=disable&user=postgres" down
	# For container is running on Windows or MacOS
	# scripts/db_migrate "postgres://host.docker.internal:5432/app_development?sslmode=disable&user=postgres" down
	# scripts/db_migrate "postgres://host.docker.internal:5432/app_test?sslmode=disable&user=postgres" down

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

init_data:
	docker-compose run --rm app psql -U postgres -d app_development -h db -p 5432 -f ./db/prod_data_sql/00_data_insert.sql

fix-webpacker:
	docker-compose run --rm app bundle exec rails webpacker:install

usage:
	@echo usage: [build, up, down, stop, init, db-migrate-up, db-migrate-down, db-migrate-gen, db-drop-create, reset, bundle, console, bash, seed_fu]