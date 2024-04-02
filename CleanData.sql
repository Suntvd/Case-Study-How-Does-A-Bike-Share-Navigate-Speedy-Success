-- 
SELECT * FROM DIVVY_TRIPDATA_2023
LIMIT 100;

-- Getting the ride length
SELECT *, (ended_at - started_at) as RIDE_LENGTH
FROM DIVVY_TRIPDATA_2023
LIMIT 100;

ALTER TABLE DIVVY_TRIPDATA_2023
ADD ride_length interval;

UPDATE DIVVY_TRIPDATA_2023
SET ride_length = ended_at - started_at;

-- Calculate the day of week that each ride started
SELECT *, TO_CHAR(started_at, 'Day') AS day_of_week
FROM DIVVY_TRIPDATA_2023
LIMIT 100;

ALTER TABLE DIVVY_TRIPDATA_2023
ADD day_of_week TEXT;

UPDATE DIVVY_TRIPDATA_2023
SET day_of_week = TO_CHAR(started_at, 'Day');

-- Delete rides that last less than 1 minute
SELECT *
FROM DIVVY_TRIPDATA_2023
WHERE EXTRACT(MINUTE FROM RIDE_LENGTH) < 1
LIMIT 1000;

DELETE FROM DIVVY_TRIPDATA_2023
WHERE EXTRACT(MINUTE FROM RIDE_LENGTH) < 1;

-- Delete rides without ending stations for classic and docked bikes
SELECT *
FROM DIVVY_TRIPDATA_2023
WHERE rideable_type IN ('classic_bike', 'docked_bike') AND end_station_name IS NULL

DELETE FROM DIVVY_TRIPDATA_2023
WHERE rideable_type IN ('classic_bike', 'docked_bike') AND end_station_name IS NULL;
