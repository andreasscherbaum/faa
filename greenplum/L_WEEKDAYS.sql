
-- Column: dayofweek


-- Weekdays


DROP TABLE IF EXISTS l_weekdays;


CREATE TABLE l_weekdays (
    weekday_number            SMALLINT
	                      PRIMARY KEY,
    description               TEXT
);
