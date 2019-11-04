DROP DATABASE ltucook_db;
CREATE DATABASE ltucook_db;
USE ltucook_db;
DROP TABLE IF EXISTS Tag, Category, Pic, Recipe, User;

CREATE TABLE User (
	id INT AUTO_INCREMENT,
	email VARCHAR(45) UNIQUE NOT NULL,
	username VARCHAR(15) UNIQUE NOT NULL,
    is_admin BOOLEAN DEFAULT 0,
	password VARCHAR(25) NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE Recipe (
	id INT AUTO_INCREMENT,
	user_id INT,
	title VARCHAR(50) NOT NULL,
    cost_per_serving DECIMAL(4,2) UNSIGNED,
	num_servings TINYINT UNSIGNED,
	when_posted TIMESTAMP,
    short_desc VARCHAR(250),
    ingredients JSON,
    instructions JSON,
	PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES User (id)
) ENGINE=InnoDB;

CREATE TABLE Pic (
	id INT AUTO_INCREMENT,
	url VARCHAR(200) NOT NULL,
	recipe_id INT,
	PRIMARY KEY (id),
    FOREIGN KEY (recipe_id) REFERENCES Recipe (id)
) ENGINE=InnoDB;

CREATE TABLE Category (
	id INT AUTO_INCREMENT,
	name VARCHAR(25) NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE Tag (
	id INT AUTO_INCREMENT,
	cat_id INT NOT NULL,
	recipe_id INT NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (cat_id) REFERENCES Category (id),
    FOREIGN KEY (recipe_id) REFERENCES Recipe (id)
) ENGINE=InnoDB;
