###
### 1) Create a table with a new unique id
### 2) Insert the data into the new table with the unique ID
### 3) Create a column that counts instances of the transaction_unique_id
###      - For each duplicate, add 1, ie. 1st duplicate value : 1, second value : 2
### 4) remove all instances of the duplicates by unique id number that have a value of
### more than 1.
###


BEGIN;

create table data_store_api.references_location2(
  id bigint IDENTITY(1,1),
  location_id varchar(max),
  state_code varchar(max),
  city_name varchar(max),
  county_name varchar(max),
  county_code varchar(max),
  transaction_unique_id varchar(max));

insert into data_store_api.references_location2 (
  location_id,
  state_code,
  city_name,
  county_name,
  county_code,
  transaction_unique_id)
  SELECT
  location_id,
  state_code,
  city_name,
  county_name,
  county_code,
  transaction_unique_id
  FROM data_store_api.references_location;

create table data_store_api.locationdupes as
  SELECT * from (select row_number() over (partition by transaction_unique_id),
    Id,
    transaction_unique_id
  FROM data_store_api.references_location2) t
  where t.row_number > 1;

delete from data_store_api.references_location2
USING data_store_api.locationdupes
WHERE references_location2.id = locationdupes.id;

COMMIT;
