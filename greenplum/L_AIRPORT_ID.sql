
-- Column: originairportid
-- Column: destairportid
-- Column: div1airportid
-- Column: div2airportid
-- Column: div3airportid
-- Column: div4airportid
-- Column: div5airportid


-- An identification number assigned by US DOT to identify a unique airport.
-- Use this field for airport analysis across a range of years because an
-- airport can change its airport code and airport codes can be reused.


DROP TABLE IF EXISTS l_airport_id;


CREATE TABLE l_airport_id (
    airport_id                INTEGER
	                      PRIMARY KEY,
    description               TEXT
);
