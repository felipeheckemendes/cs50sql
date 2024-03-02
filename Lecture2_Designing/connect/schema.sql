CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
        PRIMARY KEY("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT CHECK("type" IN ('Elementary School', 'Middle School', 'High School', 'Lower School]', 'Upper School', 'College', 'University')),
    "location" TEXT,
    "founding_year" INTEGER CHECK("founding_year">0),
        PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
        PRIMARY KEY("id")
);

CREATE TABLE "users_connections" (
    "user_id1" INTEGER,
    "user_id2" INTEGER,
        FOREIGN KEY("user_id1") REFERENCES "users"("id"),
        FOREIGN KEY("user_id2") REFERENCES "users"("id")
);

CREATE TABLE "schools_connections" (
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    "type_of_degree" TEXT CHECK("type_of_degree" IN ('BA', 'MD', 'PhD')),
        FOREIGN KEY("user_id") REFERENCES "users"("id"),
        FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE "companies_connections" (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    "title" TEXT NOT NULL,
        FOREIGN KEY("user_id") REFERENCES "users"("id"),
        FOREIGN KEY("company_id") REFERENCES "companies"("id")
);