--Data Tranformation
-- Add 2 columns necessary for data analysis

DROP TABLE IF EXISTS `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`;

-- Added 2 columns
-- ride_length - calculates the trip duration by subtracting end time and start time
-- day_of_week - identifies what day of week (Sunday, Monday, etc.) a trip falls into
CREATE TABLE `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed` AS
SELECT *,
  ROUND((TIMESTAMP_DIFF(`ended_at`, `started_at`, SECOND)/60.0), 2) AS `ride_length`,
  FORMAT_TIMESTAMP('%A', `started_at`) AS `day_of_week`
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_integrated`
ORDER BY `started_at`;

-- Select random rows for spot checking
SELECT *
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`
ORDER BY RAND()
LIMIT 5;
