CREATE TABLE orders (
    id varchar(255) NOT NULL PRIMARY KEY,
    price decimal(10, 2),
    tax decimal(10, 2),
    final_price decimal(10, 2)
)