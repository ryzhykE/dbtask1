CREATE TABLE `Book` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(100),
	`price` real,
	`description` TEXT,
	`discount` real NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
);

CREATE TABLE `Author` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(15) NOT NULL,
	`surname` varchar(15) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `BookAuthor` (
	`book_id` int NOT NULL,
	`author_id` int NOT NULL
);

CREATE TABLE `Ganre` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(15) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `BookGanre` (
	`book_id` int NOT NULL,
	`ganre_id` int NOT NULL
);

CREATE TABLE `Client` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(15),
	`surname` varchar(15),
	`phone` varchar(13),
	`email` varchar(50),
	`login` varchar(20) NOT NULL UNIQUE,
	`password` varchar(20) NOT NULL,
	`discount` real NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
);

CREATE TABLE `Payment` (
	`id` tinyint NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `StatusOrder` (
	`id` tinyint NOT NULL AUTO_INCREMENT,
	`name` enum,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Bin` (
	`id` int NOT NULL AUTO_INCREMENT,
	`client_id` int NOT NULL,
	`book_id` int NOT NULL,
	`count` smallint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Order` (
	`id` int NOT NULL AUTO_INCREMENT,
	`client_id` int NOT NULL,
	`payment_id` tinyint NOT NULL,
	`status_id` enum NOT NULL,
	`skidka_client` FLOAT NOT NULL DEFAULT '0',
	`date_order_create` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`total_price` real NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `FullInfoOrder` (
	`order_id` int NOT NULL,
	`book_price` real NOT NULL,
	`book_id` int NOT NULL,
	`count` smallint NOT NULL,
	`discount_book` real NOT NULL
);

CREATE TABLE `HistoryBook` (
	`book_id` int NOT NULL
);

CREATE TABLE `HistoryBook` (
	`book_id` int NOT NULL,
	`book_name` varchar(100) NOT NULL,
	`price` real NOT NULL,
	`authors` TEXT NOT NULL
);

ALTER TABLE `BookAuthor` ADD CONSTRAINT `BookAuthor_fk0` FOREIGN KEY (`book_id`) REFERENCES `Book`(`id`);

ALTER TABLE `BookAuthor` ADD CONSTRAINT `BookAuthor_fk1` FOREIGN KEY (`author_id`) REFERENCES `Author`(`id`);

ALTER TABLE `BookGanre` ADD CONSTRAINT `BookGanre_fk0` FOREIGN KEY (`book_id`) REFERENCES `Book`(`id`);

ALTER TABLE `BookGanre` ADD CONSTRAINT `BookGanre_fk1` FOREIGN KEY (`ganre_id`) REFERENCES `Ganre`(`id`);

ALTER TABLE `Bin` ADD CONSTRAINT `Bin_fk0` FOREIGN KEY (`client_id`) REFERENCES `Client`(`id`);

ALTER TABLE `Bin` ADD CONSTRAINT `Bin_fk1` FOREIGN KEY (`book_id`) REFERENCES `Book`(`id`);

ALTER TABLE `Order` ADD CONSTRAINT `Order_fk0` FOREIGN KEY (`client_id`) REFERENCES `Client`(`id`);

ALTER TABLE `Order` ADD CONSTRAINT `Order_fk1` FOREIGN KEY (`payment_id`) REFERENCES `Payment`(`id`);

ALTER TABLE `Order` ADD CONSTRAINT `Order_fk2` FOREIGN KEY (`status_id`) REFERENCES `StatusOrder`(`id`);

ALTER TABLE `FullInfoOrder` ADD CONSTRAINT `FullInfoOrder_fk0` FOREIGN KEY (`order_id`) REFERENCES `Order`(`id`);

ALTER TABLE `FullInfoOrder` ADD CONSTRAINT `FullInfoOrder_fk1` FOREIGN KEY (`book_id`) REFERENCES `Book`(`id`);

