-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/bnv0fA
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE `Card_holder` (
    `holder_id` INT  NOT NULL ,
    `name` VARCHAR(250)  NOT NULL 
);

CREATE TABLE `Credit_card` (
    `card` VARCHAR(20)  NOT NULL ,
    `id_card_holder` INT  NOT NULL 
);

CREATE TABLE `Merchant` (
    `merchant_id` INT  NOT NULL ,
    `name` VARCHAR(250)  NOT NULL ,
    `id_merchant_categoty` INT  NOT NULL 
);

CREATE TABLE `Merchant_category` (
    `merchant_id` INT  NOT NULL ,
    `name` VARCHAR(250)  NOT NULL 
);

CREATE TABLE `Transaction` (
    `transaction_id` INT  NOT NULL ,
    `date` Timestamp  NOT NULL ,
    `amount` money  NOT NULL ,
    `card` VARCHAR(250)  NOT NULL ,
    `id_merchant` INT  NOT NULL 
);

ALTER TABLE `Credit_card` ADD CONSTRAINT `fk_Credit_card_card` FOREIGN KEY(`card`)
REFERENCES `Transaction` (`card`);

ALTER TABLE `Credit_card` ADD CONSTRAINT `fk_Credit_card_id_card_holder` FOREIGN KEY(`id_card_holder`)
REFERENCES `Card_holder` (`holder_id`);

ALTER TABLE `Merchant` ADD CONSTRAINT `fk_Merchant_id_merchant_categoty` FOREIGN KEY(`id_merchant_categoty`)
REFERENCES `Merchant_category` (`merchant_id`);

ALTER TABLE `Transaction` ADD CONSTRAINT `fk_Transaction_id_merchant` FOREIGN KEY(`id_merchant`)
REFERENCES `Merchant` (`merchant_id`);

