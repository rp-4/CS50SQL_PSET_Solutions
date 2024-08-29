CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT,
    "year" NUMERIC,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY("id")
);

-- import csv
.import --csv --skip 1 meteorites.csv meteorites_temp

-- Any empty values in meteorites.csv are represented by NULL in the meteorites table.
-- Keep in mind that the mass, year, lat, and long columns have empty values in the CSV.

UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "mass" = "";

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "year" = "";

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "lat" = "";

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "long" = "";

-- All columns with decimal values (e.g., 70.4777) should be rounded to the nearest hundredths place (e.g., 70.4777 becomes 70.48).
-- Keep in mind that the mass, lat, and long columns have decimal values.

UPDATE "meteorites_temp"
SET "mass" = ROUND("mass", 2),
"lat" = ROUND("lat", 2),
"long" = ROUND("long", 2);

-- All meteorites with the nametype “Relict” are not included in the meteorites table.

DELETE FROM meteorites_temp WHERE nametype = "Relict";

-- The meteorites are sorted by year, oldest to newest,
-- and then—if any two meteorites landed in the same year—by name, in alphabetical order.
-- You’ve updated the IDs of the meteorites from meteorites.csv, according to the order specified in #4.
-- The id of the meteorites should start at 1, beginning with the meteorite that landed in the oldest year
-- and is the first in alphabetical order for that year.


CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT,
    "year" NUMERIC,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY("id")
);

INSERT INTO meteorites ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM meteorites_temp
ORDER BY year, name;
