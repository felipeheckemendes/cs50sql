CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL,
    `password` VARCHAR(128) NOT NULL,
    CONSTRAINT `check_username_format` CHECK (`username` REGEXP '^[a-z_.]+$'),
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(64),
    `year_founded` YEAR NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(64),
    PRIMARY KEY(`id`)
);

CREATE TABLE `people_connections` (
    `user1_id` INT UNSIGNED,
    `user2_id` INT UNSIGNED,
    FOREIGN KEY(`user1_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`user2_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `schools_connections` (
    `user_id` INT UNSIGNED,
    `school_id` INT UNSIGNED,
    `affiliation_start_date` DATE NOT NULL,
    `affiliation_end_date` DATE,
    `degree_type` ENUM('BA', 'MA', 'PhD') NOT NULL,
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE `companies_connections` (
    `user_id` INT UNSIGNED,
    `company_id` INT UNSIGNED,
    `affiliation_start_date` DATE NOT NULL,
    `affiliation_end_date` DATE,
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);