createdb:
	docker-compose up -d

migrate:
	migrate -path internal/infra/database/migrations -database "mysql://root:root@tcp(localhost:3306)/orders" -verbose up

.PHONY: createdb migrate
