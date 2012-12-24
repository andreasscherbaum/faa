
-- Column: originstatefips
-- Column: deststatefips


-- State Fips


DROP TABLE IF EXISTS l_state_fips;


CREATE TABLE l_state_fips (
    state_fips_id             SMALLINT
	                      PRIMARY KEY,
    description               TEXT
);
