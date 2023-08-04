# Unveiling Pathways: Analyzing Cyclistic's Bike Rental Data to Convert Casual Riders into Annual Member
_A Google Data Analytics Case Study_
## Introduction
Cyclistic, a fictitious bike-share company, aims to increase its number of annual memberships, which offer greater financial benefits compared to casual users who opt for single-rides or day passes.

To address this objective, the marketing team, under the guidance of the director, has taken on the task of analyzing the previous year's bicycle ride data to identify opportunities for converting casual riders into annual members.

As a member of the marketing team, my role involves conducting a thorough examination of the available bike-sharing data to uncover distinct usage patterns and behaviors among annual members and casual riders.

This case study follows a comprehensive six-stage data analysis method (__Ask, Prepare, Process, Analyze, Share, and Act__) to provide actionable insights and strategic recommendations that inform decision-making and drive the conversion of casual riders into loyal annual members.
## Phase I: Ask
### Business Task
Conduct a comprehensive analysis of Cyclistic's bike rental data in order to discern the behaviors and usage patterns of casual riders in contrast with the annual members. This analysis aims to uncover key insights need to convert casual riders to annual members.

From these insights, devise an effective marketing strategy that caters to the identified preferences of casual riders. Finally, present the results of the data analysis and the proposed marketing strategy to Cyclistic's executive team, using professional and insightful data visualizations, to secure buy-in and approval of the recommended course of action.
## Phase II: Prepare
### Data Source
To conduct the analysis, we utilized Cyclistic's historical trip data, which encompasses the data from the previous 12 months. The datasets were obtained [here](https://divvy-tripdata.s3.amazonaws.com/index.html) and are suitable for addressing the business questions at hand.

It's worth noting that the datasets are given different names since Cyclistic is a fictional company. However, the data is publicly available and has been made accessible under the provided [license](https://www.divvybikes.com/data-license-agreement) by Motivate International Inc.

Listed below are all specific data source used:
| File Name                   | Description                      |
|-----------------------------|----------------------------------|
| 202207-divvy-tripdata       | July 2022 Cyclistic Trip Data    |
| 202208-divvy-tripdata       | August 2022 Cyclistic Trip Data  |
| 202209-divvy-publictripdata | September 2022 Cyclistic Trip Data|
| 202210-divvy-tripdata       | October 2022 Cyclistic Trip Data |
| 202211-divvy-tripdata       | November 2022 Cyclistic Trip Data|
| 202212-divvy-tripdata       | December 2022 Cyclistic Trip Data|
| 202301-divvy-tripdata       | January 2023 Cyclistic Trip Data |
| 202302-divvy-tripdata       | February 2023 Cyclistic Trip Data|
| 202303-divvy-tripdata       | March 2023 Cyclistic Trip Data   |
| 202304-divvy-tripdata       | April 2023 Cyclistic Trip Data   |
| 202305-divvy-tripdata       | May 2023 Cyclistic Trip Data     |
| 202306-divvy-tripdata       | June 2023 Cyclistic Trip Data    |
### ROCCC
__Reliable:__ The trip data used for analysis is sourced from Cyclistic, a reputable and established bike-sharing company.

__Original:__ The data is directly obtained from Cyclistic's historical trip records, ensuring its authenticity and originality.

__Comprehensive:__ The dataset includes trip data from the previous 12 months, providing a comprehensive overview of customer behavior and usage patterns.

__Current:__ The data used is up-to-date, enabling analysis of recent trends and reflecting the most recent customer preferences.

__Cited:__ The dataset has been provided by Motivate International Inc. under a specific license, ensuring proper citation and adherence to data usage guidelines.
## Phase III: Process
### Tools
SQL was used for comprehensive data integration, cleansing, transformation, validation, exploration, and analysis. Additionally, Looker was used for further analysis, and for the presentation of findings using interactive charts.
### Data Integration
Data Integration was done through SQL - [Data Integration](https://github.com/low-boat/cyclistic-da-case-study/blob/main/Data%20Integration.sql)

This step gave us a dataset of 5,779,444 rows and 14 columns. 
| column_name       | data_type  |
|-------------------|------------|
| ride_id           | STRING     |
| rideable_type     | STRING     |
| started_at        | TIMESTAMP  |
| ended_at          | TIMESTAMP  |
| start_station_name| STRING     |
| start_station_id  | STRING     |
| end_station_name  | STRING     |
| end_station_id    | STRING     |
| start_lat         | FLOAT64    |
| start_lng         | FLOAT64    |
| end_lat           | FLOAT64    |
| end_lng           | FLOAT64    |
| member_casual     | STRING     |
### Data Transformation
To enhance the data analysis, two additional columns were added. Here's the SQL code for this [data transformation](https://github.com/low-boat/cyclistic-da-case-study/blob/main/Data%20Transformation.sql)

`ride_length` - This column calculates for the trip duration by finding the difference between the `ended_at` and `started_at columns`.

`day_of_week` - This column extracts the day of the week from the `started_at` column to identify the specific day when each trip occurred (e.g., Monday, Tuesday, etc.).

| column_name       | data_type  |
|-------------------|------------|
| ride_length       | FLOAT64    |
| day_of_week       | STRING     |

### Data Validation

With all the necessary columns complete, several scenarios were tried to validate data completeness, consistency, and accuracy. For a detailed list of validations and findings, refer to the [Data Validation](https://github.com/low-boat/cyclistic-da-case-study/blob/main/Data%20Validation.sql) SQL Code.

Here's a summary of noteworthy findings:

1. Records with Negative `ride_length`:
During data cleansing, I found multiple rows with negative `ride_length`. To ensure data accuracy, I will remove these records. This is the primary issue requiring attention in data cleansing. While there are other findings, they won't significantly impact the overall data analysis. In practice, I would consult with clients to clarify any uncertainties in the data. For this case study, I'll proceed by eliminating the negative `ride_length` records while retaining the rest.

2. Records with Very Long or Very Short `ride_length`:
Some ride_length values are shorter than a minute or longer than 10 hours.

3. Records with Missing Data:
Certain columns, such as `start_station_name`, have missing records. As these columns are not used in the analysis, the missing records were retained as is.

4. Duplicate `ride_id`:
Although there are some duplicate `ride_id` values, further examination reveals that the other details differ. Consequently, these records were retained.

### Data Cleansing
As stated above, negative `ride_length` records need to be removed. Here's the [Data Cleansing](https://github.com/low-boat/cyclistic-da-case-study/blob/main/Data%20Cleansing.sql) SQL code for that.

This left us a dataset of 5,720,686 rows and 16 columns. 

### Data Exploration

With the dataset complete and ready for analysis, I ran some [SQL codes](https://github.com/low-boat/cyclistic-da-case-study/blob/main/Data%20Exploration.sql) to further explore the data.

## Phase IV: Analyze




