CREATE TABLE restaurants (
	restaurant_name VARCHAR, 
	zip_code VARCHAR(5), 
	inspection_date VARCHAR, 
	score INTEGER, 
	address VARCHAR, 
	facility_id INTEGER, 
	process_description VARCHAR
);

COPY restaurants FROM '/home/vagrant/code/mks/11-24/restaurant_inspection_scores.csv' DELIMITER ',' CSV HEADER;

//How many zipcodes are represented in this dataset?
SELECT COUNT(DISTINCT zip_code)
FROM restaurants;

//What is the breakdown of inspection count by zip code?
SELECT zip_code, COUNT(zip_code) AS zipcount
FROM restaurants
GROUP BY zip_code
ORDER BY zipcount;

//Which zipcode had the highest average score?
SELECT zip_code, AVG(score) AS average
FROM restaurants
GROUP BY zip_code
ORDER BY average DESC;

//What is the lowest possible score based on this dataset?
SELECT MIN(score)
FROM restaurants;

//Which establishments scored the lowest?
SELECT score, restaurant_name
FROM restaurants
ORDER BY score
LIMIT 5;

//Which establishments received the most visits from the inspector?
SELECT restaurant_name, facility_id, COUNT(inspection_date) AS dates 
FROM restaurants 
GROUP BY restaurant_name, facility_id 
ORDER BY dates DESC;






