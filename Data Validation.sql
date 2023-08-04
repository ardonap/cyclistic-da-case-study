--Data Validation
-- Creating different scenarios to validate data completeness, consistency and accuracy

-- Data Validation 1
-- Checking for missing/null values

-- Findings 1
-- 9 out of 15 columns are complete. The rest are columns pertaining to location (start_station_id, etc.) which is not relevant for this case study.
SELECT
  COUNT(`ride_id`) AS `ride_id_cnt`,
  COUNT(`rideable_type`) AS `rideable_type_cnt`,
  COUNT(`started_at`) AS `started_at_cnt`,
  COUNT(`ended_at`) AS `ended_at_cnt`,
  COUNT(`start_station_name`) AS `start_station_name_cnt`,
  COUNT(`start_station_id`) AS `start_station_id_cnt`,
  COUNT(`end_station_name`) AS `end_station_name_cnt`,
  COUNT(`end_station_id`) AS `end_station_id_cnt`,
  COUNT(`start_lat`) AS `start_lat_cnt`,
  COUNT(`start_lng`) AS `start_lng_cnt`,
  COUNT(`end_lat`) AS `end_lat_cnt`,
  COUNT(`end_lng`) AS `end_lng_cnt`,
  COUNT(`member_casual`) AS `member_casual_cnt`,
  COUNT(`ride_length`) AS `ride_length_cnt`,
  COUNT(`day_of_week`) AS `day_of_week_cnt`,
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`;

SELECT
  COUNT(`ride_id`) / COUNT(*) * 100 AS `ride_id_completeness pct`,
  COUNT(`rideable_type`) / COUNT(*) * 100 AS `rideable_type_completeness pct`,
  COUNT(`started_at`) / COUNT(*) * 100 AS `started_at_completeness pct`,
  COUNT(`ended_at`) / COUNT(*) * 100 AS `ended_at_completeness pct`,
  COUNT(`start_station_name`) / COUNT(*) * 100 AS `start_station_name_completeness pct`,
  COUNT(`start_station_id`) / COUNT(*) * 100 AS `start_station_id_completeness pct`,
  COUNT(`end_station_name`) / COUNT(*) * 100 AS `end_station_name_completeness pct`,
  COUNT(`end_station_id`) / COUNT(*) * 100 AS `end_station_id_completeness pct`,
  COUNT(`start_lat`) / COUNT(*) * 100 AS `start_lat_completeness pct`,
  COUNT(`start_lng`) / COUNT(*) * 100 AS `start_lng_completeness pct`,
  COUNT(`end_lat`) / COUNT(*) * 100 AS `end_lat_completeness pct`,
  COUNT(`end_lng`) / COUNT(*) * 100 AS `end_lng_completeness pct`,
  COUNT(`member_casual`) / COUNT(*) * 100 AS `member_casual_completeness pct`,
  COUNT(`ride_length`) / COUNT(*) * 100 AS `ride_length_completeness pct`,
  COUNT(`day_of_week`) / COUNT(*) * 100 AS `day_of_week_completeness pct`,
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`;


-- Data Validation 2
-- Check for trips where trip duration is 0 or less.

-- Findings 2
-- There are 58758 trips with 0 or less trip duration
-- These trips total to -12283.89 minutes or about -200 hours
SELECT COUNT(`ride_length`) AS `count_negative_ride_length`
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`
WHERE `ride_length` <= 0;

SELECT SUM(`ride_length`) AS `sum_negative_ride_length`
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`
WHERE `ride_length` <= 0;

SELECT *
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`
WHERE `ride_length` <= 0 
ORDER BY RAND()
LIMIT 5;

-- Data Validation 3
-- Check for trips with a very short trip duration (less than 1 minutes)

-- Findings 3
-- There are 48557 trips less than 1 minutes which is almost 19000 minutes / 312 hours in trip duration.
SELECT COUNT(`ride_length`) AS `count_short_ride_length`
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`
WHERE `ride_length` < 1 AND `ride_length` > 0;

SELECT SUM(`ride_length`) AS `sum_short_ride_length`
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`
WHERE `ride_length` < 1 AND `ride_length` > 0;

SELECT *
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`
WHERE `ride_length` < 1 AND `ride_length` > 0 
ORDER BY RAND()
LIMIT 5;


-- Data Validation 4
-- Check for trips with a very long trip duration (24 hours or more)

-- Findings 4
-- There are 5089 trips that took 24 hours and up which is over 290,000 hours worth of trip.
SELECT COUNT(`ride_length`) AS `count_short_ride_length`
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`
WHERE `ride_length` >= 1440;

SELECT SUM(`ride_length`) AS `sum_short_ride_length`
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`
WHERE `ride_length` >= 1440;

SELECT *
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`
WHERE `ride_length` >= 1440
ORDER BY RAND()
LIMIT 5;


-- Data Validation 5
-- Check for duplicates

-- Findings 5
-- There are 4 duplicate ride_id. However, other record details are different.
SELECT ride_id, COUNT(*) as duplicate_count
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`
GROUP BY ride_id
HAVING COUNT(*) > 1;

SELECT *
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`
WHERE ride_id IN (
  SELECT ride_id
  FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`
  GROUP BY ride_id
  HAVING COUNT(*) > 1
);

