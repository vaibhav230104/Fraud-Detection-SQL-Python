table card_holder;
table credit_card;
table merchant;
DROP TABLE IF EXISTS merchant_category;
CREATE TABLE merchant_category (
id INT NOT NULL,
name VARCHAR(20),
PRIMARY KEY (id)
);
DROP TABLE IF EXISTS merchant;
CREATE TABLE merchant (
id INT NOT NULL,
name VARCHAR(50),
id_merchant_category INT NOT NULL,
FOREIGN KEY (id_merchant_category) REFERENCES merchant_category (id),
PRIMARY KEY (id)
);
DROP TABLE IF EXISTS card_holder;
CREATE TABLE card_holder (
id INT NOT NULL,
name VARCHAR(50),
PRIMARY KEY (id)
);
DROP TABLE IF EXISTS credit_card;
CREATE TABLE credit_card (
card VARCHAR(20) NOT NULL,
id_card_holder INT,
PRIMARY KEY (card)
);
DROP TABLE IF EXISTS transaction;
CREATE TABLE transaction (
id INT NOT NULL,
date timestamp NOT NULL,
amount float,
card VARCHAR(30),
id_merchant INT,
FOREIGN KEY (card) REFERENCES credit_card (card),
FOREIGN KEY (id_merchant) REFERENCES merchant (id),
PRIMARY KEY (id)
);