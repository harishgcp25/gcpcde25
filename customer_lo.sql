CREATE DATABASE IF NOT EXISTS raw_db
LOCATION'gs://usecasesravsb25/raw.db';

use raw_db;

CREATE OR REPLACE TEMPORARY VIEW customer_lo_v
USING JSON
OPTIONS(path='gs://usecasesravsb25/source/customer_lo.json');

CREATE TABLE IF NOT EXISTS raw_db.customer_lo_table
USING PARQUET
SELECT * FROM customer_lo_v;