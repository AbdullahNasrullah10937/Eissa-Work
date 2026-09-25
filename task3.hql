-- Clean up old tables
DROP TABLE IF EXISTS fact_medical_procedure;
DROP TABLE IF EXISTS dim_patient;
DROP TABLE IF EXISTS dim_doctor;
DROP TABLE IF EXISTS dim_operation_theater;
DROP TABLE IF EXISTS dim_time;

-- 1. Dimension Tables (Internal Tables)
CREATE TABLE dim_patient (
    patient_key INT,
    insurance_number STRING,
    first_name STRING,
    last_name STRING,
    date_of_birth STRING,
    weight DOUBLE,
    height DOUBLE
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

CREATE TABLE dim_doctor (
    doctor_key INT,
    employee_number STRING,
    first_name STRING,
    last_name STRING,
    specialization STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

CREATE TABLE dim_operation_theater (
    theater_key INT,
    room_number STRING,
    building_number STRING,
    building_level STRING,
    type STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

CREATE TABLE dim_time (
    time_key INT,
    day_number INT,
    month_name STRING,
    year_number INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

-- 2. Central Fact Table (Internal Table)
CREATE TABLE fact_medical_procedure (
    procedure_key INT,
    patient_key INT,
    doctor_key INT,
    theater_key INT,
    start_time_key INT,
    end_time_key INT,
    blood_pressure STRING,
    temperature DOUBLE
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

-- 3. Load Sample Data from Local Files
LOAD DATA LOCAL INPATH '/tmp/task3_data/dim_patient.csv' OVERWRITE INTO TABLE dim_patient;
LOAD DATA LOCAL INPATH '/tmp/task3_data/dim_doctor.csv' OVERWRITE INTO TABLE dim_doctor;
LOAD DATA LOCAL INPATH '/tmp/task3_data/dim_operation_theater.csv' OVERWRITE INTO TABLE dim_operation_theater;
LOAD DATA LOCAL INPATH '/tmp/task3_data/dim_time.csv' OVERWRITE INTO TABLE dim_time;
LOAD DATA LOCAL INPATH '/tmp/task3_data/fact_medical_procedure.csv' OVERWRITE INTO TABLE fact_medical_procedure;

-- 4. List Contents of All Tables
SELECT * FROM dim_patient;
SELECT * FROM dim_doctor;
SELECT * FROM dim_operation_theater;
SELECT * FROM dim_time;
SELECT * FROM fact_medical_procedure;
