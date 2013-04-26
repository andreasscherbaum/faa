CREATE TABLE otp_staging (
    -- Time Period
    "year"                             SMALLINT            -- Year
                                       NOT NULL,
    "quarter"                          SMALLINT            -- Quarter (1-4)
                                       NOT NULL
                                       REFERENCES l_quarters(quarter_number),
    "month"                            SMALLINT            -- Month
                                       NOT NULL
                                       REFERENCES l_months(month_number),
    "dayofmonth"                       SMALLINT            -- Day of Month
                                       NOT NULL,
    "dayofweek"                        SMALLINT            -- Day of Week
                                       NOT NULL
                                       REFERENCES l_weekdays(weekday_number),
    "flightdate"                       DATE,               -- Flight Date (yyyymmdd)


    -- Airline
    "uniquecarrier"                    TEXT                -- Unique Carrier Code. When the same code has been used by multiple carriers, a numeric suffix is used for earlier users, for example, PA, PA(1), PA(2). Use this field for analysis across a range of years.
                                       NOT NULL
                                       REFERENCES l_unique_carriers(unique_carrier_code),
    "airlineid"                        INTEGER             -- An identification number assigned by US DOT to identify a unique airline (carrier). A unique airline (carrier) is defined as one holding and reporting under the same DOT certificate regardless of its Code, Name, or holding company/corporation. Analysis Carrier Code assigned by IATA and commonly used to identify a carrier. As the same code may have been assigned to different carriers over time, the code is not always unique. For analysis, use the Unique Carrier Code.
                                       REFERENCES l_airline_id(airline_id),
    "carrier"                          TEXT
                                       NOT NULL,
                                       -- REFERENCES l_carrier_history(carrier_code), -- not enforced, not unique
    "tailnum"                          TEXT,               -- Tail Number
    "flightnum"                        INTEGER,            -- Flight Number


    -- Origin
    "originairportid"                  INTEGER             -- Origin Airport, Airport ID. An identification number assigned by US DOT to identify a unique airport. Use this field for airport analysis across a range of years because an airport can change its airport code and airport codes can be reused.
                                       NOT NULL
                                       REFERENCES l_airport_id(airport_id),
    "originairportseqid"               INTEGER             -- Origin Airport, Airport Sequence ID. An identification number assigned by US DOT to identify a unique airport at a given point of time. Airport attributes, such as airport name or coordinates, may change over time.
                                       NOT NULL
                                       REFERENCES l_airport_seq_id(airport_seq_id),
    "origincitymarketid"               INTEGER             -- Origin Airport, City Market ID. City Market ID is an identification number assigned by US DOT to identify a city market. Use this field to consolidate airports serving the same city market.
                                       NOT NULL
                                       REFERENCES l_city_market_id(city_market_id),
    "origin"                           TEXT                -- Origin Airport
                                       NOT NULL
                                       REFERENCES l_airport(airport_code),
    "origincityname"                   TEXT,               -- Origin Airport, City Name
    "originstate"                      CHAR(2)             -- Origin Airport, State Code
                                       REFERENCES l_state_abr_aviation(state_abr_aviation_code),
    "originstatefips"                  SMALLINT            -- Origin Airport, State Fips
                                       REFERENCES l_state_fips(state_fips_id),
    "originstatename"                  TEXT,               -- Origin Airport, State Name
    "originwac"                        SMALLINT            -- Origin Airport, World Area Code
                                       REFERENCES l_world_area_codes(world_area_code),


    -- Destination
    "destairportid"                    INTEGER             -- Destination Airport, Airport ID. An identification number assigned by US DOT to identify a unique airport. Use this field for airport analysis across a range of years because an airport can change its airport code and airport codes can be reused.
                                       NOT NULL
                                       REFERENCES l_airport_id(airport_id),
    "destairportseqid"                 INTEGER             -- Destination Airport, Airport Sequence ID. An identification number assigned by US DOT to identify a unique airport at a given point of time. Airport attributes, such as airport name or coordinates, may change over time.
                                       NOT NULL
                                       REFERENCES l_airport_seq_id(airport_seq_id),
    "destcitymarketid"                 INTEGER             -- Destination Airport, City Market ID. City Market ID is an identification number assigned by US DOT to identify a city market. Use this field to consolidate airports serving the same city market.
                                       NOT NULL
                                       REFERENCES l_city_market_id(city_market_id),
    "dest"                             TEXT                -- Destination Airport
                                       NOT NULL
                                       REFERENCES l_airport(airport_code),
    "destcityname"                     TEXT,               -- Destination Airport, City Name
    "deststate"                        CHAR(2)             -- Destination Airport, State Code
                                       REFERENCES l_state_abr_aviation(state_abr_aviation_code),
    "deststatefips"                    SMALLINT            -- Destination Airport, State Fips
                                       REFERENCES l_state_fips(state_fips_id),
    "deststatename"                    TEXT,               -- Destination Airport, State Name
    "destwac"                          SMALLINT            -- Destination Airport, World Area Code
                                       REFERENCES l_world_area_codes(world_area_code),


    -- Departure Performance
    "crsdeptime"                       TEXT,               -- CRS Departure Time (local time: hhmm) -> hh:mm
    "deptime"                          TEXT,               -- Actual Departure Time (local time: hhmm) -> hh:mm
    "depdelay"                         NUMERIC(10,2),      -- Difference in minutes between scheduled and actual departure time. Early departures show negative numbers.
    "depdelayminutes"                  NUMERIC(10,2),      -- Difference in minutes between scheduled and actual departure time. Early departures set to 0.
    "depdel15"                         NUMERIC(10,2),      -- Departure Delay Indicator, 15 Minutes or More (1=Yes) -> true/false
    "departuredelaygroups"             TEXT,               -- Departure Delay intervals, every (15 minutes from <-15 to >180)
    "deptimeblk"                       TEXT                -- CRS Departure Time Block, Hourly Intervals
                                       NOT NULL
                                       REFERENCES l_deparrblk(time_block_code),
    "taxiout"                          NUMERIC(10,2),      -- Out Time, in Minutes
    "wheelsoff"                        TEXT,               -- Wheels Off Time (local time: hhmm) -> hh:mm


    -- Arrival Performance
    "wheelson"                         TEXT,               -- Wheels On Time (local time: hhmm) -> hh:mm
    "taxiin"                           NUMERIC(10,2),      -- Taxi In Time, in Minutes
    "crsarrtime"                       TEXT,               -- CRS Arrival Time (local time: hhmm) -> hh:mm
    "arrtime"                          TEXT,               -- Actual Arrival Time (local time: hhmm) -> hh:mm
    "arrdelay"                         NUMERIC(10,2),      -- Difference in minutes between scheduled and actual arrival time. Early arrivals show negative numbers.
    "arrdelayminutes"                  NUMERIC(10,2),      -- Difference in minutes between scheduled and actual arrival time. Early arrivals set to 0.
    "arrdel15"                         NUMERIC(10,2),      -- Arrival Delay Indicator, 15 Minutes or More (1=Yes) -> true/false
    "arrivaldelaygroups"               TEXT,               -- Arrival Delay intervals, every (15-minutes from <-15 to >180)
    "arrtimeblk"                       TEXT                -- CRS Arrival Time Block, Hourly Intervals
                                       NOT NULL
                                       REFERENCES l_deparrblk(time_block_code),


    -- Cancellations and Diversions
    "cancelled"                        NUMERIC(10,2)       -- Cancelled Flight Indicator (1=Yes) -> true/false
                                       NOT NULL,
    "cancellationcode"                 CHAR(1),            -- Specifies The Reason For Cancellation
    "diverted"                         NUMERIC(10,2)       -- Diverted Flight Indicator (1=Yes) -> true/false
                                       NOT NULL,


    -- Flight Summaries
    "crselapsedtime"                   NUMERIC(10,2),      -- CRS Elapsed Time of Flight, in Minutes
    "actualelapsedtime"                NUMERIC(10,2),      -- Elapsed Time of Flight, in Minutes
    "airtime"                          NUMERIC(10,2),      -- Flight Time, in Minutes
    "flights"                          NUMERIC(10,2),      -- Number of Flights
    "distance"                         NUMERIC(10,2),      -- Distance between airports (miles)
    "distancegroup"                    SMALLINT            -- Distance Intervals, every 250 Miles, for Flight Segment
                                       NOT NULL
                                       REFERENCES l_distance_group_250(distance_group_250_id),


    -- Cause of Delay (Data starts 6/2003)
    "carrierdelay"                     NUMERIC(10,2),      -- Carrier Delay, in Minutes
    "weatherdelay"                     NUMERIC(10,2),      -- Weather Delay, in Minutes
    "nasdelay"                         NUMERIC(10,2),      -- National Air System Delay, in Minutes
    "securitydelay"                    NUMERIC(10,2),      -- Security Delay, in Minutes
    "lateaircraftdelay"                NUMERIC(10,2),      -- Late Aircraft Delay, in Minutes


    -- Gate Return Information at Origin Airport (Data starts 10/2008)
    "firstdeptime"                     TEXT,               -- First Gate Departure Time at Origin Airport
    "totaladdgtime"                    NUMERIC(10,2),      -- Total Ground Time Away from Gate for Gate Return or Cancelled Flight
    "longestaddgtime"                  NUMERIC(10,2),      -- Longest Time Away from Gate for Gate Return or Cancelled Flight


    -- Diverted Airport Information (Data starts 10/2008)
    "divairportlandings"               SMALLINT            -- Number of Diverted Airport Landings
                                       REFERENCES l_diversions(diversion_id),
    "divreacheddest"                   TEXT,               -- Diverted Flight Reaching Scheduled Destination Indicator (1=Yes) -> true/false
    "divactualelapsedtime"             NUMERIC(10,2),      -- Elapsed Time of Diverted Flight Reaching Scheduled Destination, in Minutes. The ActualElapsedTime column remains NULL for all diverted flights.
    "divarrdelay"                      NUMERIC(10,2),      -- Difference in minutes between scheduled and actual arrival time for a diverted flight reaching scheduled destination. The ArrDelay column remains NULL for all diverted flights.
    "divdistance"                      NUMERIC(10,2),      -- Distance between scheduled destination and final diverted airport (miles). Value will be 0 for diverted flight reaching scheduled destination.
    "div1airport"                      TEXT,               -- Diverted Airport Code1
    "div1airportid"                    INTEGER             -- Airport ID of Diverted Airport 1. Airport ID is a Unique Key for an Airport
                                       REFERENCES l_airport_id(airport_id),
    "div1airportseqid"                 INTEGER             -- Airport Sequence ID of Diverted Airport 1. Unique Key for Time Specific Information for an Airport
                                       REFERENCES l_airport_seq_id(airport_seq_id),
    "div1wheelson"                     TEXT,               -- Wheels On Time (local time: hhmm) at Diverted Airport Code1 -> hh:mm
    "div1totalgtime"                   NUMERIC(10,2),      -- Total Ground Time Away from Gate at Diverted Airport Code1
    "div1longestgtime"                 NUMERIC(10,2),      -- Longest Ground Time Away from Gate at Diverted Airport Code1
    "div1wheelsoff"                    TEXT,               -- Wheels Off Time (local time: hhmm) at Diverted Airport Code1 -> hh:mm
    "div1tailnum"                      TEXT,               -- Aircraft Tail Number for Diverted Airport Code1
    "div2airport"                      TEXT,               -- Diverted Airport Code2
    "div2airportid"                    INTEGER             -- Airport ID of Diverted Airport 2. Airport ID is a Unique Key for an Airport
                                       REFERENCES l_airport_id(airport_id),
    "div2airportseqid"                 INTEGER             -- Airport Sequence ID of Diverted Airport 2. Unique Key for Time Specific Information for an Airport
                                       REFERENCES l_airport_seq_id(airport_seq_id),
    "div2wheelson"                     TEXT,               -- Wheels On Time (local time: hhmm) at Diverted Airport Code2
    "div2totalgtime"                   NUMERIC(10,2),      -- Total Ground Time Away from Gate at Diverted Airport Code2
    "div2longestgtime"                 NUMERIC(10,2),      -- Longest Ground Time Away from Gate at Diverted Airport Code2
    "div2wheelsoff"                    TEXT,               -- Wheels Off Time (local time: hhmm) at Diverted Airport Code2
    "div2tailnum"                      TEXT,               -- Aircraft Tail Number for Diverted Airport Code2
    "div3airport"                      TEXT,               -- Diverted Airport Code3
    "div3airportid"                    INTEGER             -- Airport ID of Diverted Airport 3. Airport ID is a Unique Key for an Airport
                                       REFERENCES l_airport_id(airport_id),
    "div3airportseqid"                 INTEGER             -- Airport Sequence ID of Diverted Airport 3. Unique Key for Time Specific Information for an Airport
                                       REFERENCES l_airport_seq_id(airport_seq_id),
    "div3wheelson"                     TEXT,               -- Wheels On Time (local time: hhmm) at Diverted Airport Code3
    "div3totalgtime"                   NUMERIC(10,2),      -- Total Ground Time Away from Gate at Diverted Airport Code3
    "div3longestgtime"                 NUMERIC(10,2),      -- Longest Ground Time Away from Gate at Diverted Airport Code3
    "div3wheelsoff"                    TEXT,               -- Wheels Off Time (local time: hhmm) at Diverted Airport Code3
    "div3tailnum"                      TEXT,               -- Aircraft Tail Number for Diverted Airport Code3
    "div4airport"                      TEXT,               -- Diverted Airport Code4
    "div4airportid"                    INTEGER             -- Airport ID of Diverted Airport 4. Airport ID is a Unique Key for an Airport       
                                       REFERENCES l_airport_id(airport_id),
    "div4airportseqid"                 INTEGER             -- Airport Sequence ID of Diverted Airport 4. Unique Key for Time Specific Information for an Airport
                                       REFERENCES l_airport_seq_id(airport_seq_id),
    "div4wheelson"                     TEXT,               -- Wheels On Time (local time: hhmm) at Diverted Airport Code4
    "div4totalgtime"                   NUMERIC(10,2),      -- Total Ground Time Away from Gate at Diverted Airport Code4
    "div4longestgtime"                 NUMERIC(10,2),      -- Longest Ground Time Away from Gate at Diverted Airport Code4
    "div4wheelsoff"                    TEXT,               -- Wheels Off Time (local time: hhmm) at Diverted Airport Code4
    "div4tailnum"                      TEXT,               -- Aircraft Tail Number for Diverted Airport Code4
    "div5airport"                      TEXT,               -- Diverted Airport Code5
    "div5airportid"                    INTEGER             -- Airport ID of Diverted Airport 5. Airport ID is a Unique Key for an Airport
                                       REFERENCES l_airport_id(airport_id),
    "div5airportseqid"                 INTEGER             -- Airport Sequence ID of Diverted Airport 5. Unique Key for Time Specific Information for an Airport
                                       REFERENCES l_airport_seq_id(airport_seq_id),
    "div5wheelson"                     TEXT,               -- Wheels On Time (local time: hhmm) at Diverted Airport Code5
    "div5totalgtime"                   NUMERIC(10,2),      -- Total Ground Time Away from Gate at Diverted Airport Code5
    "div5longestgtime"                 NUMERIC(10,2),      -- Longest Ground Time Away from Gate at Diverted Airport Code5
    "div5wheelsoff"                    TEXT,               -- Wheels Off Time (local time: hhmm) at Diverted Airport Code5
    "div5tailnum"                      TEXT,               -- Aircraft Tail Number for Diverted Airport Code5
    "extra"                            TEXT
)
WITH (appendonly=true, orientation=column, compresstype=zlib, compresslevel=5)
DISTRIBUTED BY (uniquecarrier, flightnum)
PARTITION BY RANGE (flightdate)
(
    PARTITION p_year START ('1995-01-01'::DATE) END ('2014-12-31'::DATE)
        EVERY ('1 year'::INTERVAL)
);
