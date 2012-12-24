
-- Column: originwac
-- Column: destwac


-- World Area Code


DROP TABLE IF EXISTS l_world_area_codes;


CREATE TABLE l_world_area_codes (
    world_area_code           SMALLINT
	                      PRIMARY KEY,
    description               TEXT
);
