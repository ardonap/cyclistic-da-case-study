--Data Cleansing

DROP TABLE IF EXISTS `cyclistic-da-case-study.divvy_tripdata.tripdata_cleansed`;

CREATE TABLE `cyclistic-da-case-study.divvy_tripdata.tripdata_cleansed` AS
SELECT *
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_transformed`
WHERE ride_length > 0
ORDER BY started_at;

--Check for data count
SELECT COUNT(*)
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_cleansed`;
