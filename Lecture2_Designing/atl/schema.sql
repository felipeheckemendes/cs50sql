

CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
        PRIMARY KEY("id")
);

CREATE TABLE "check_ins" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
        PRIMARY KEY("id"),
        FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
        FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
        PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline_id" INTEGER,
    "airport_code_from" TEXT NOT NULL,
    "airport_code_to" TEXT NOT NULL,
    "departure_datetime" NUMERIC NOT NULL,
    "arrival_datetime" NUMERIC NOT NULL,
        PRIMARY KEY("flight_number"),
        FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);