
-- Column: carrier


-- Code assigned by IATA and commonly used to identify a carrier. As the same
-- code may have been assigned to different carriers over time, the code is
-- not always unique. For analysis, use the Unique Carrier Code.


DROP TABLE IF EXISTS l_carrier_history;


CREATE TABLE l_carrier_history (
    carrier_code              TEXT, -- this field is *not* unique
    description               TEXT
)
DISTRIBUTED BY (carrier_code);

-- todo: parse description and extract years
