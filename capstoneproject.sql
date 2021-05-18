-- -----------------------------------------------------
-- Schema full-stack-resteasy
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `full-stack-resteasy`;

CREATE SCHEMA `full-stack-resteasy`;
USE `full-stack-resteasy` ;

-- -----------------------------------------------------
-- Table `full-stack-resteasy`.`product_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-resteasy`.`product_category` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `full-stack-resteasy`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-resteasy`.`product` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sku` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `unit_price` DECIMAL(13,2) DEFAULT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  `active` BIT DEFAULT 1,
  `units_in_stock` INT(11) DEFAULT NULL,
   `date_created` DATETIME(6) DEFAULT NULL,
  `last_updated` DATETIME(6) DEFAULT NULL,
  `category_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Restaurant
-- -----------------------------------------------------

INSERT INTO product_category(category_name)VALUES ('AdiGas');

INSERT INTO product_category(category_name)VALUES ('RotiGhar');
INSERT INTO product_category(category_name)VALUES ('PunjabiRasoi');
INSERT INTO product_category(category_name)VALUES ('Udupi');
INSERT INTO product_category(category_name)VALUES ('Vishubhavan');
INSERT INTO product_category(category_name)VALUES ('GEEK Resort');

-- -----------------------------------------------------
-- Add sample data --- (sku --> stock keeping unit)
-- item lists
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Restaurant AdiGas
-- -----------------------------------------------------

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Adigas-1000', 'Roti', 'contains 297 calories per 100 gram',
'assets/images/products/adiGas/roti.png'
,1,100,10,1, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Adigas-1001', 'Chole Chawal', 'contains 500 calories per 100 gram',
'assets/images/products/adiGas/choleChawal.png'
,1,100,100,1, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Adigas-1002', 'Rajma Chawal', 'contains 510 calories per 100 gram',
'assets/images/products/adiGas/rajmaChawal.png'
,1,100,110,1, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Adigas-1003', 'Dal Fry', 'contains 245 calories per 100 gram',
'assets/images/products/adiGas/dalFry.png'
,1,100,70,1, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Adigas-1003', 'Cake', 'contains 245 calories per 100 gram',
'assets/images/products/adiGas/CAKE.png'
,1,100,70,1, NOW());


delete from product where name ="roti";
-- -----------------------------------------------------
-- Restaurant Punjabi Rasoi
-- -----------------------------------------------------



INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('PunjabiRasoi-1000', 'Burger', 'contains 70 calories per 100 gram',
'assets/images/products/punjabiRasoi/Burger.png'
,1,100,150,2, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('PunjabiRasoi-1000', 'IndianThalli', 'contains 85 calories per 100 gram',
'assets/images/products/punjabiRasoi/Indianthalli.png'
,1,100,60,2, NOW());



INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('PunjabiRasoi-1002', 'Gajar Halwa', 'contains 700 calories per 100 gram',
'assets/images/products/punjabiRasoi/gajarHalwa.png'
,1,100,90,2, NOW());



-- -----------------------------------------------------
-- Restaurant Roti Ghar 
-- -----------------------------------------------------
INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('RotiGhar-1000', 'NAAN', 'contains 500 calories per 100 gram',
'assets/images/products/rotiGhar/naan.png'
,1,100,70,3, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('RotiGhar-1000', 'KULFI', 'contains 500 calories per 100 gram',
'assets/images/products/rotiGhar/kulfi.png'
,1,100,70,3, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('RotiGhar-1000', 'DOSA', 'contains 10 calories per 100 gram',
'assets/images/products/rotiGhar/dosa.png'
,1,100,35,3, NOW());


-- -----------------------------------------------------
-- Restaurant Udupi
-- -----------------------------------------------------
INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Udupi-1004', 'IDLY', 'contains 30 calories per 150 gram',
'assets/images/products/udupi/idly.png'
,1,100,98,4, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Udupi-1004', 'SAMOSA', 'contains 60 calories per 40 gram',
'assets/images/products/udupi/samosa.png'
,1,100,55,4, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Udupi-1004', 'MIXEDDESERT', 'contains 60 calories per 40 gram',
'assets/images/products/udupi/mixeddesert.png'
,1,100,55,4, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Udupi-1001', 'GulabJamun', 'contains 97 calories per 100 gram',
'assets/images/products/udupi/gulabJamun.png'
,1,100,25,4, NOW());





USE `full-stack-resteasy`;

SET foreign_key_checks = 0;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `id` smallint unsigned NOT NULL,
  `code` varchar(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

--
-- Data for table `country`
--

INSERT INTO `country` VALUES 

(1,'IN','India');

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;

CREATE TABLE `state` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `country_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country` (`country_id`),
  CONSTRAINT `fk_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

select*from state;
--
-- Dumping data for table `state`
--

INSERT INTO `state` VALUES 



(1,'AndhraPradesh',1),
(2,'karnataka',1),
(3,'Bay Of  Bengal',1),
(4,'Maharastra',1),
(5,'pune',1);

SET foreign_key_checks = 1;




-- -----------------------------------------------------
-- Schema full-stack-resteasy`
-- -----------------------------------------------------

USE `full-stack-resteasy`;

--
-- Prep work
--
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `order_item`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `customer`;
DROP TABLE IF EXISTS `address`;
SET FOREIGN_KEY_CHECKS=1;

--
-- Table structure for table `address`
--
CREATE TABLE `address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select*from address;
--
-- Table structure for table `customer`
--
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `orders`
--
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_tracking_number` varchar(255) DEFAULT NULL,
  `total_price` decimal(19,2) DEFAULT NULL,
  `total_quantity` int DEFAULT NULL,
  `billing_address_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `shipping_address_id` bigint DEFAULT NULL,
  `status` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_billing_address_id` (`billing_address_id`),
  UNIQUE KEY `UK_shipping_address_id` (`shipping_address_id`),
  KEY `K_customer_id` (`customer_id`),
  CONSTRAINT `FK_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_billing_address_id` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FK_shipping_address_id` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select *from orders;
--
-- Table structure for table `order_items`
--
CREATE TABLE `order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `K_order_id` (`order_id`),
  CONSTRAINT `FK_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * from order_item;





