DROP TABLE IF EXISTS driver_0nf;

CREATE TABLE driver_0nf (
    first_name STRING,
    last_name STRING,
    licence INT,
    address STRUCT<
        street: STRING,
        bldg: INT,
        city: STRING,
        country: STRING
    >,
    trips ARRAY<
        STRUCT<
            trip_number: INT,
            destination: STRING
        >
    >,
    cities_visited ARRAY<STRING>,
    co_drivers ARRAY<STRING>
)
STORED AS TEXTFILE;

-- Insert 1: James Bond
INSERT INTO TABLE driver_0nf VALUES (
    'James',
    'Bond',
    7,
    named_struct('street', 'Northfields Ave', 'bldg', 3, 'city', 'Wollongong', 'country', 'Australia'),
    array(
        named_struct('trip_number', 5, 'destination', 'Melbourne'),
        named_struct('trip_number', 2, 'destination', 'Sydney')
    ),
    array('Canberra', 'Wagga Wagga', 'Mildura'),
    array('Robin Hood', 'Harry Potter')
);

-- Insert 2: Sarah Connor
INSERT INTO TABLE driver_0nf VALUES (
    'Sarah',
    'Connor',
    101,
    named_struct('street', 'Bourke St', 'bldg', 42, 'city', 'Melbourne', 'country', 'Australia'),
    array(
        named_struct('trip_number', 1, 'destination', 'Geelong'),
        named_struct('trip_number', 3, 'destination', 'Ballarat')
    ),
    array('Adelaide', 'Perth'),
    array('John Connor', 'Kyle Reese')
);

-- Insert 3: Bruce Wayne
INSERT INTO TABLE driver_0nf VALUES (
    'Bruce',
    'Wayne',
    999,
    named_struct('street', 'George St', 'bldg', 10, 'city', 'Sydney', 'country', 'Australia'),
    array(
        named_struct('trip_number', 8, 'destination', 'Brisbane'),
        named_struct('trip_number', 4, 'destination', 'Newcastle')
    ),
    array('Cairns', 'Darwin', 'Hobart'),
    array('Dick Grayson', 'Alfred Pennyworth')
);

SELECT * FROM driver_0nf;
