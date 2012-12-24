
-- Column: uniquecarrier


-- Unique Carrier Code. When the same code has been used by multiple carriers,
-- a numeric suffix is used for earlier users, for example, PA, PA(1), PA(2).
-- Use this field for analysis across a range of years.


DROP TABLE IF EXISTS l_unique_carriers;


CREATE TABLE l_unique_carriers (
    unique_carrier_code       TEXT
	                      PRIMARY KEY,
    description               TEXT
);
