-- main tables for users, educations and employers

CREATE TABLE users (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE institutes (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE companies (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- relationship tables

CREATE TABLE connections (
    "user_id" INTEGER,
    "connection_id" INTEGER CHECK("user_id" != "connection_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("connection_id") REFERENCES "users"("id")
);

CREATE TABLE educations (
    "id" INTEGER,
    "user_id" INTEGER,
    "institute_id" INTEGER,
    "start_day" INTEGER NOT NULL CHECK("start_day" >= 1 AND "start_day" <= 31),
    "start_month" INTEGER NOT NULL CHECK("start_month" >= 1 AND "start_month" <= 12),
    "start_year" INTEGER NOT NULL,
    "end_day" INTEGER CHECK("start_day" >= 1 AND "start_day" <= 31),
    "end_month" INTEGER CHECK("start_month" >= 1 AND "start_month" <= 12),
    "end_year" INTEGER,
    "degree" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("institute_id") REFERENCES "institutes"("id")
);

CREATE TABLE employers (
    "id" INTEGER,
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_day" INTEGER NOT NULL CHECK("start_day" >= 1 AND "start_day" <= 31),
    "start_month" INTEGER NOT NULL CHECK("start_month" >= 1 AND "start_month" <= 12),
    "start_year" INTEGER NOT NULL,
    "end_day" INTEGER CHECK("start_day" >= 1 AND "start_day" <= 31),
    "end_month" INTEGER CHECK("start_month" >= 1 AND "start_month" <= 12),
    "end_year" INTEGER,
    "title" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
