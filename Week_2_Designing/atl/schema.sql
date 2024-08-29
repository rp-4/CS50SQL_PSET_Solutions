CREATE TABLE passengers (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE checkins (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "flight" INTEGER,
    "time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight") REFERENCES "flights"("id")
);

CREATE TABLE airlines (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "section" TEXT NOT NULL CHECK("section" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY("id")
);

CREATE TABLE flights (
    "id" INTEGER,
    "number" INTEGER NOT NULL,
    "airline_id" INTEGER,
    "departure" TEXT NOT NULL,
    "departure_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "arrival" TEXT NOT NULL,
    "arrival_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);

