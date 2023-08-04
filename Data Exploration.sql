-- Count records
SELECT COUNT(ride_id) FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_cleansed`;

-- Bike types
SELECT DISTINCT (rideable_type) FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_cleansed`;

-- Station Count
SELECT COUNT(DISTINCT station_names) AS count_distinct_stations
FROM (
  SELECT start_station_name AS station_names
  FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_cleansed`
  UNION DISTINCT
  SELECT end_station_name AS station_names
  FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_cleansed`
) AS combined_station_names;

-- Total Ride Length
SELECT ROUND(SUM(ride_length) / 60.0) FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_cleansed`;
