--
-- Table structure for table actor
--
--DROP TABLE actor;

CREATE TABLE actor (
  actor_id numeric NOT NULL ,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  CONSTRAINT pk_actor PRIMARY KEY  (actor_id)
);

CREATE  INDEX idx_actor_last_name ON actor(last_name);
/


--
-- Table structure for table country
--

CREATE TABLE country (
  country_id SMALLINT NOT NULL,
  country VARCHAR(50) NOT NULL,
  CONSTRAINT pk_country PRIMARY KEY (country_id)
);


--
-- Table structure for table city
--

CREATE TABLE city (
  city_id int NOT NULL,
  city VARCHAR(50) NOT NULL,
  country_id SMALLINT NOT NULL,
  CONSTRAINT pk_city PRIMARY KEY (city_id),
  CONSTRAINT fk_city_country FOREIGN KEY (country_id) REFERENCES country (country_id)
);

CREATE  INDEX idx_fk_country_id ON city(country_id);
/


--
-- Table structure for table address
--

CREATE TABLE address (
  address_id int NOT NULL,
  address VARCHAR(50) NOT NULL,
  address2 VARCHAR(50) DEFAULT NULL,
  district VARCHAR(20) NOT NULL,
  city_id INT  NOT NULL,
  postal_code VARCHAR(10) DEFAULT NULL,
  phone VARCHAR(20) NOT NULL,
  CONSTRAINT pk_address PRIMARY KEY (address_id)
);

CREATE  INDEX idx_fk_city_id ON address(city_id);
/

ALTER TABLE address ADD  CONSTRAINT fk_address_city FOREIGN KEY (city_id) REFERENCES city (city_id);
/


--
-- Table structure for table language
--

CREATE TABLE language (
  language_id SMALLINT NOT NULL ,
  name CHAR(20) NOT NULL,
  CONSTRAINT pk_language PRIMARY KEY (language_id)
);


--
-- Table structure for table category
--

CREATE TABLE category (
  category_id SMALLINT NOT NULL,
  name VARCHAR(25) NOT NULL,
  CONSTRAINT pk_category PRIMARY KEY  (category_id)
);


--
-- Table structure for table customer
--

CREATE TABLE customer (
  customer_id INT NOT NULL,
  store_id INT NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(50) DEFAULT NULL,
  address_id INT NOT NULL,
  active CHAR(1) DEFAULT 'Y' NOT NULL,
  CONSTRAINT pk_customer PRIMARY KEY  (customer_id),
  CONSTRAINT fk_customer_address FOREIGN KEY (address_id) REFERENCES address(address_id)
);

CREATE  INDEX idx_customer_fk_store_id ON customer(store_id);
/
CREATE  INDEX idx_customer_fk_address_id ON customer(address_id);
/
CREATE  INDEX idx_customer_last_name ON customer(last_name);
/

--
-- Table structure for table film
--

CREATE TABLE film (
  film_id int NOT NULL,
  title VARCHAR(255) NOT NULL,
  description CLOB DEFAULT NULL,
  release_year VARCHAR(4) DEFAULT NULL,
  language_id SMALLINT NOT NULL,
  original_language_id SMALLINT DEFAULT NULL,
  rental_duration SMALLINT  DEFAULT 3 NOT NULL,
  rental_rate DECIMAL(4,2) DEFAULT 4.99 NOT NULL,
  length SMALLINT DEFAULT NULL,
  replacement_cost DECIMAL(5,2) DEFAULT 19.99 NOT NULL,
  rating VARCHAR(10) DEFAULT 'G',
  special_features VARCHAR(100) DEFAULT NULL,
  CONSTRAINT pk_film PRIMARY KEY  (film_id),
  CONSTRAINT fk_film_language FOREIGN KEY (language_id) REFERENCES language (language_id) ,
  CONSTRAINT fk_film_language_original FOREIGN KEY (original_language_id) REFERENCES language (language_id)
);



--
-- Table structure for table film_actor
--

CREATE TABLE film_actor (
  actor_id INT NOT NULL,
  film_id  INT NOT NULL,
  CONSTRAINT pk_film_actor PRIMARY KEY  (actor_id,film_id),
  CONSTRAINT fk_film_actor_actor FOREIGN KEY (actor_id) REFERENCES actor (actor_id),
  CONSTRAINT fk_film_actor_film FOREIGN KEY (film_id) REFERENCES film (film_id)
);


--
-- Table structure for table film_category
--

CREATE TABLE film_category (
  film_id INT NOT NULL,
  category_id SMALLINT  NOT NULL
  CONSTRAINT pk_film_category PRIMARY KEY (film_id, category_id),
  CONSTRAINT fk_film_category_film FOREIGN KEY (film_id) REFERENCES film (film_id),
  CONSTRAINT fk_film_category_category FOREIGN KEY (category_id) REFERENCES category (category_id)
);

CREATE  INDEX idx_fk_film_category_film ON film_category(film_id);
/
CREATE  INDEX idx_fk_film_category_category ON film_category(category_id);
/


--
-- Table structure for table film_text
--

CREATE TABLE film_text (
  film_id SMALLINT NOT NULL,
  title VARCHAR(255) NOT NULL,
  description CLOB,
  CONSTRAINT pk_film_text PRIMARY KEY  (film_id)
);

--
-- Table structure for table inventory
--

CREATE TABLE inventory (
  inventory_id INT NOT NULL,
  film_id INT NOT NULL,
  store_id INT NOT NULL,
  CONSTRAINT pk_inventory PRIMARY KEY  (inventory_id),
  CONSTRAINT fk_inventory_film FOREIGN KEY (film_id) REFERENCES film (film_id)
);

