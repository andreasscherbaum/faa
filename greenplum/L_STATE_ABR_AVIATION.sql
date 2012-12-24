
-- Column: originstate
-- Column: deststate


-- State Code


DROP TABLE IF EXISTS l_state_abr_aviation;


CREATE TABLE l_state_abr_aviation (
    state_abr_aviation_code   CHAR(2)
	                      PRIMARY KEY,
    description               TEXT
);
