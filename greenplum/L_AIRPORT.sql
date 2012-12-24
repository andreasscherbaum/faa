
-- Column: origin
-- Column: dest


-- Airport


DROP TABLE IF EXISTS l_airport;


CREATE TABLE l_airport (
    airport_code              TEXT
	                      PRIMARY KEY,
    description               TEXT
);
