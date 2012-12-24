
-- Column: origincitymarketid
-- Column: destcitymarketid


-- City Market ID is an identification number assigned by US DOT to identify
-- a city market. Use this field to consolidate airports serving the same city market.


DROP TABLE IF EXISTS l_city_market_id;


CREATE TABLE l_city_market_id (
    city_market_id            INTEGER
	                      PRIMARY KEY,
    description               TEXT
);
