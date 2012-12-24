
-- Column: departuredelaygroups
-- Column: arrivaldelaygroups


DROP TABLE IF EXISTS l_ontime_delay_groups;


CREATE TABLE l_ontime_delay_groups (
    delay_group_id            SMALLINT
	                      PRIMARY KEY,
    description               TEXT
);
