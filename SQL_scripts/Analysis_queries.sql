-- Climate_change database views
USE climate_change;

-- Displaying the average changing of global surface temperature by country (subregions) and by year ranges

SELECT * FROM climate_change.temperature_changes;

SELECT country, AVG(Temperature) AS mean_degrees_change FROM climate_change.temperature_changes
GROUP BY country
ORDER BY AVG(Temperature);

-- Displaying the average changing of global surface temperature by year ranges and subregions

SELECT country, years, AVG(Temperature) AS mean_degrees_change FROM climate_change.temperature_changes
GROUP BY country, years
ORDER BY AVG(Temperature) DESC; 

-- Displaying the average changing of animal products prices by year ranges and subregions
CREATE TEMPORARY TABLE climate_change.prices_temp;
SELECT subregions, years, AVG(animal_price) FROM climate_change.animal_prices
GROUP BY subregions, years
ORDER BY AVG(animal_price) DESC;  -- Eastern Europe 1992-1997 may be an OUTLIER (very very high price compared to the other subregions and year ranges) == could be conseguqence of fall of Soviet Union(?)


-- Displaying the average changing of animal products prices togehter with global surface temperature change by year ranges and subregions

DROP TABLE IF EXISTS climate_change.prices_temp;  -- Had to use a temporary table because animal_prices is very big and so SQL is very low or fails to do the query because it needs too much time
CREATE TEMPORARY TABLE climate_change.prices_temp AS
SELECT a.subregions, a.years, AVG(a.animal_price) AS avg_animal_price, t.mean_degrees_change
FROM climate_change.animal_prices AS a
JOIN (
    SELECT country, years, AVG(Temperature) AS mean_degrees_change 
    FROM climate_change.temperature_changes 
    GROUP BY country, years
) AS t ON a.subregions = t.country AND a.years = t.years
GROUP BY a.subregions, a.years, t.mean_degrees_change;

SELECT * FROM climate_change.prices_temp;

-- Display the max temperature change by subregion and years ranges and the consequent potential environmental policy 
-- that should have been (if in the past) or should be (if recent) adopted in each european subregion, if the temperature change is more than 2 degrees

SELECT s.subregion_name, e.policy_description, t.years, MAX(t.Temperature) FROM climate_change.env_policies AS e
  JOIN climate_change.temperature_changes AS t
  ON e.subregion_id = t.subregion_id
    JOIN climate_change.subregions AS s
    ON e.subregion_id = s.subregion_id
GROUP BY s.subregion_name, e.policy_description, t.years
 HAVING MAX(t.Temperature) > 2
 ORDER BY t.years DESC;



