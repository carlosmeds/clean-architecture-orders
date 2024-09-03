# Projeto de Sistema de Pedidos

Este projeto implementa um sistema de pedidos utilizando uma arquitetura limpa. Ele inclui serviços HTTP, GraphQL e gRPC.

## Pré-requisitos
- Docker
- Docker Compose
- Go
- Evans (para testar o gRPC)
- Configuração
- Subir os Serviços com Docker Compose

Para subir os serviços necessários (MySQL e RabbitMQ) utilizando o Docker Compose, execute o seguinte comando:


```sh
make createdb
```

## Rodar as Migrações

Para rodar as migrações e criar as tabelas necessárias no banco de dados, execute o seguinte comando:

```sh
make migrate
```

Isso irá aplicar as migrações definidas na pasta `internal/infra/database/migrations`.

Portas dos Serviços
- MySQL: 3306
- RabbitMQ: 5672 (porta de comunicação) e 15672 (porta de gerenciamento)
- Servidor HTTP: 8000
- Servidor gRPC: 50051
- Servidor GraphQL: 8080


## Como Rodar
### HTTP
Para testar as APIs HTTP, você pode utilizar os arquivos .http na pasta `api/`. Para listar os pedidos, utilize o arquivo `list_orders.http`.

### GraphQL
Para testar as APIs GraphQL, você pode utilizar o playground GraphQL. No playground, você pode executar queries e mutations. Para listar os pedidos:

```
query orders {
  orders {
    id
    Price
    Tax
    FinalPrice
  }
}
```

### gRPC
Para testar as APIs gRPC, você pode utilizar o Evans. Primeiro, inicie o Evans no modo REPL. Dentro do REPL do Evans, você pode chamar os métodos gRPC. Para listar os pedidos:

```
call ListOrders
```