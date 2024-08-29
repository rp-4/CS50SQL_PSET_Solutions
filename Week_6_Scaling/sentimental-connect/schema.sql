-- main tables for users, educations and employers

CREATE TABLE users (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32),
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE institutes (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `city` VARCHAR(32) NOT NULL,
    `state` VARCHAR(32) NOT NULL,
    `country` VARCHAR(32) NOT NULL,
    `year` YEAR NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE companies (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `city` VARCHAR(32) NOT NULL,
    `state` VARCHAR(32) NOT NULL,
    `country` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`)
);

-- relationship tables

CREATE TABLE connections (
    `user_id` INT,
    `connection_id` INT CHECK(`user_id` != `connection_id`),
    PRIMARY KEY(`user_id`, `connection_id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`connection_id`) REFERENCES `users`(`id`)
);

CREATE TABLE educations (
    `user_id` INT,
    `institute_id` INT,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `degree` VARCHAR(32) NOT NULL,
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`institute_id`) REFERENCES `institutes`(`id`)
);

CREATE TABLE employers (
    `user_id` INTEGER,
    `company_id` INTEGER,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `title` TEXT,
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);
