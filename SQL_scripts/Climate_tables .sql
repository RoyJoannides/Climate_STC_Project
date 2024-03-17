CREATE DATABASE IF NOT EXISTS climate_change;
USE climate_change;

DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
  country_id INT AUTO_INCREMENT PRIMARY KEY,
  country_name VARCHAR(255)
);

DROP TABLE IF EXISTS subregions;
CREATE TABLE subregions (
    subregion_id INT AUTO_INCREMENT PRIMARY KEY,
    subregion_name VARCHAR(100)
);


DROP TABLE IF EXISTS years;
CREATE TABLE years (
  year_id INT AUTO_INCREMENT PRIMARY KEY,
  year_category VARCHAR(255)
);

DROP TABLE IF EXISTS temperature_changes;
CREATE TABLE temperature_changes (
  temperature_id INT AUTO_INCREMENT PRIMARY KEY,
  country VARCHAR(150),
  years VARCHAR(100),
  Temperature FLOAT,
  year_id INT,
  subregion_id INT,
  FOREIGN KEY (year_id) REFERENCES years(year_id),
  FOREIGN KEY (subregion_id) REFERENCES subregions(subregion_id)
);

DROP TABLE IF EXISTS animal_prices;
CREATE TABLE animal_prices (
  price_id INT AUTO_INCREMENT PRIMARY KEY,
  subregions VARCHAR(150),
  years VARCHAR(100),
  animal_price FLOAT,
  year_id INT,
  subregion_id INT,
  FOREIGN KEY (year_id) REFERENCES years(year_id),
  FOREIGN KEY (subregion_id) REFERENCES subregions(subregion_id)
);

DROP TABLE IF EXISTS env_policies;
CREATE TABLE env_policies (
  policy_ID INT AUTO_INCREMENT PRIMARY KEY,
  policy_description VARCHAR(250),
  subregion_id INT,
  FOREIGN KEY (subregion_id) REFERENCES subregions(subregion_id)
);



