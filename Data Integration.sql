--Data Integration

DROP TABLE IF EXISTS `cyclistic-da-case-study.divvy_tripdata.tripdata_integrated`;

--Combine 12 months of data into 1 table
CREATE TABLE IF NOT EXISTS `cyclistic-da-case-study.divvy_tripdata.tripdata_integrated` AS (
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202207-1`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202207-2`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202208-1`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202208-2`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202209-1`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202209-2`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202210-1`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202210-2`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202211`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202212`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202301`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202302`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202303`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202304`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202305-1`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202305-2`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202306-1`
  UNION ALL
  SELECT * FROM `cyclistic-da-case-study.divvy_tripdata.202306-2`
);

--Check for data count
SELECT COUNT(*)
FROM `cyclistic-da-case-study.divvy_tripdata.tripdata_integrated`;
