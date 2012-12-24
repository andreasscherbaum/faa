
-- Column: originairportseqid
-- Column: destairportseqid
-- Column: div1airportseqid
-- Column: div2airportseqid
-- Column: div3airportseqid
-- Column: div4airportseqid
-- Column: div5airportseqid


-- An identification number assigned by US DOT to identify a unique airport
-- at a given point of time. Airport attributes, such as airport name or
-- coordinates, may change over time.


DROP TABLE IF EXISTS l_airport_seq_id;


CREATE TABLE l_airport_seq_id (
    airport_seq_id            INTEGER
	                      PRIMARY KEY,
    description               TEXT
);
