CREATE TABLE ingredients (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    PRIMARY KEY("id")
);

CREATE TABLE ingredients_record (
    "id" INTEGER,
    "ingredient_id" INTEGER,
    "action" TEXT NOT NULL CHECK("action" IN ('purchase', 'used')),
    "amount" NUMERIC NOT NULL,
    "price" NUMERIC,
    "date" NUMERIC NOT NULL,
    "total_amount" NUMERIC NOT NULL,
    "unit" TEXT NOT NULL CHECK("amount" IN ('gm', 'units', 'litre')),
    PRIMARY KEY("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE donuts (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "gluten_free" TEXT NOT NULL DEFAULT "no" CHECK("gluten_free" IN ('yes', 'no')),
    "price" NUMERIC NOT NULL,
    "old_donut" TEXT NOT NULL DEFAULT "no" CHECK("old_donut" IN ('yes', 'no')),
    PRIMARY KEY("id")
);

CREATE TABLE donut_ingredients (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE customers (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT,
    "email" TEXT NOT NULL UNIQUE,
    "deleted" TEXT NOT NULL DEFAULT "no" CHECK("deleted" IN ('yes', 'no')),
    PRIMARY KEY("id")
);

CREATE TABLE orders (
    "id" INTEGER,
    "customer_id" INTEGER,
    "total_amount" NUMERIC NOT NULL,
    "date" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE order_details (
    "order_id" INTEGER,
    "donut_id" INTEGER,
    "qty" INTEGER NOT NULL,
    "amount" NUMERIC NOT NULL,
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE transaction_details (
    "order_id" INTEGER,
    "total_amount" NUMERIC NOT NULL,
    "date" NUMERIC NOT NULL,
    "status" TEXT NOT NULL CHECK("status" IN ('success', 'failed', 'pending')),
    PRIMARY KEY("order_id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("id")
);
