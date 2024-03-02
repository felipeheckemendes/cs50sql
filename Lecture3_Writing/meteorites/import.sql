.import --csv meteorites.csv temp

UPDATE "temp"
SET 
    "name"=trim("name"),
    "nametype"=trim("nametype"),
    "class"=trim("class"),
    "mass"=trim("mass"),
    "discovery"=trim("discovery"),
    "year"=trim("year"),
    "lat"=trim("lat"),
    "long"=trim("long");

UPDATE "temp"
SET "name"=NULL
WHERE "name" = '';

UPDATE "temp"
SET "id"=NULL
WHERE "id" = '';

UPDATE "temp"
SET "nametype"=NULL
WHERE "nametype" = '';

UPDATE "temp"
SET "class"=NULL
WHERE "class" = '';

UPDATE "temp"
SET "mass"=NULL
WHERE "mass" = '';

UPDATE "temp"
SET "discovery"=NULL
WHERE "discovery" = '';

UPDATE "temp"
SET "year"=NULL
WHERE "year" = '';

UPDATE "temp"
SET "lat"=NULL
WHERE "lat" = '';

UPDATE "temp"
SET "long"=NULL
WHERE "long" = '';

UPDATE "temp"
SET "mass"=ROUND("mass", 2)
;

UPDATE "temp"
SET "lat"=ROUND("lat", 2)
;

UPDATE "temp"
SET "long"=ROUND("long", 2)
;

UPDATE "temp"
SET "year"=CAST("year" AS INTEGER)
;

DELETE FROM "temp"
WHERE "name"='Relict';

CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" Text,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY("id")
);

INSERT INTO "meteorites" 
("name", "nametype", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "nametype", "class", "mass", "discovery", "year", "lat", "long" FROM "temp" ORDER BY "year" ASC, "name";

DROP TABLE "temp";