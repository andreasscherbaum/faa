
-- Column: depdel15
-- Column: arrdel15
-- Column: cancelled
-- Column: diverted
-- Column: divreacheddest


DROP TABLE IF EXISTS l_yesno_resp;


CREATE TABLE l_yesno_resp (
    yesno_resp                BOOLEAN
	                      PRIMARY KEY,
    description               TEXT
);
