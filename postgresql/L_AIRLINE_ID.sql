
-- Column: airlineid


-- An identification number assigned by US DOT to identify a unique airline
-- (carrier). A unique airline (carrier) is defined as one holding and reporting
-- under the same DOT certificate regardless of its Code, Name, or holding
-- company/corporation.


DROP TABLE IF EXISTS l_airline_id;


CREATE TABLE l_airline_id (
    airline_id                INTEGER
	                      PRIMARY KEY,
    description               TEXT
);
