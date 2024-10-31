FROM golang:1.23-alpine

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

# Install migrate tool
RUN apk add --no-cache curl && \
    curl -L https://github.com/golang-migrate/migrate/releases/download/v4.15.1/migrate.linux-amd64.tar.gz -o migrate.tar.gz && \
    tar -xvzf migrate.tar.gz && \
    mv migrate /usr/local/bin/migrate && \
    rm migrate.tar.gz

EXPOSE 8000 8080 50051

# Command to run migrations and start the application
CMD migrate -path internal/infra/database/migrations -database "mysql://root:root@tcp(mysql:3306)/orders" -verbose up && \
    go run cmd/ordersystem/main.go cmd/ordersystem/wire_gen.go