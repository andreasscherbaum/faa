CREATE TABLE otp (
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
    "crsdeptime"                       TIME,               -- CRS Departure Time (local time: hhmm) -> hh:mm
    "deptime"                          TIME,               -- Actual Departure Time (local time: hhmm) -> hh:mm
    "depdelay"                         INTEGER,            -- Difference in minutes between scheduled and actual departure time. Early departures show negative numbers.
    "depdelayminutes"                  INTEGER,            -- Difference in minutes between scheduled and actual departure time. Early departures set to 0.
    "depdel15"                         BOOLEAN             -- Departure Delay Indicator, 15 Minutes or More (1=Yes) -> true/false
                                       NOT NULL
                                       REFERENCES l_yesno_resp(yesno_resp),
    "departuredelaygroups"             SMALLINT            -- Departure Delay intervals, every (15 minutes from <-15 to >180)
                                       NOT NULL
                                       REFERENCES l_ontime_delay_groups(delay_group_id),
    "deptimeblk"                       TEXT                -- CRS Departure Time Block, Hourly Intervals
                                       NOT NULL
                                       REFERENCES l_deparrblk(time_block_code),
    "taxiout"                          SMALLINT,           -- Out Time, in Minutes
    "wheelsoff"                        TIME,               -- Wheels Off Time (local time: hhmm) -> hh:mm


    -- Arrival Performance
    "wheelson"                         TIME,               -- Wheels On Time (local time: hhmm) -> hh:mm
    "taxiin"                           SMALLINT,           -- Taxi In Time, in Minutes
    "crsarrtime"                       TIME,               -- CRS Arrival Time (local time: hhmm) -> hh:mm
    "arrtime"                          TIME,               -- Actual Arrival Time (local time: hhmm) -> hh:mm
    "arrdelay"                         INTEGER,            -- Difference in minutes between scheduled and actual arrival time. Early arrivals show negative numbers.
    "arrdelayminutes"                  INTEGER,            -- Difference in minutes between scheduled and actual arrival time. Early arrivals set to 0.
    "arrdel15"                         BOOLEAN             -- Arrival Delay Indicator, 15 Minutes or More (1=Yes) -> true/false
                                       NOT NULL
                                       REFERENCES l_yesno_resp(yesno_resp),
    "arrivaldelaygroups"               SMALLINT            -- Arrival Delay intervals, every (15-minutes from <-15 to >180)
                                       NOT NULL
                                       REFERENCES l_ontime_delay_groups(delay_group_id),
    "arrtimeblk"                       TEXT                -- CRS Arrival Time Block, Hourly Intervals
                                       NOT NULL
                                       REFERENCES l_deparrblk(time_block_code),


    -- Cancellations and Diversions
    "cancelled"                        BOOLEAN             -- Cancelled Flight Indicator (1=Yes) -> true/false
                                       NOT NULL
                                       REFERENCES l_yesno_resp(yesno_resp),
    "cancellationcode"                 CHAR(1)             -- Specifies The Reason For Cancellation
                                       REFERENCES l_cancellation(cancellation_code),
    "diverted"                         BOOLEAN             -- Diverted Flight Indicator (1=Yes) -> true/false
                                       NOT NULL
                                       REFERENCES l_yesno_resp(yesno_resp),


    -- Flight Summaries
    "crselapsedtime"                   INTEGER,            -- CRS Elapsed Time of Flight, in Minutes
    "actualelapsedtime"                INTEGER,            -- Elapsed Time of Flight, in Minutes
    "airtime"                          INTEGER,            -- Flight Time, in Minutes
    "flights"                          SMALLINT,           -- Number of Flights
    "distance"                         INTEGER,            -- Distance between airports (miles)
    "distancegroup"                    SMALLINT            -- Distance Intervals, every 250 Miles, for Flight Segment
                                       NOT NULL
                                       REFERENCES l_distance_group_250(distance_group_250_id),


    -- Cause of Delay (Data starts 6/2003)
    "carrierdelay"                     SMALLINT,           -- Carrier Delay, in Minutes
    "weatherdelay"                     SMALLINT,           -- Weather Delay, in Minutes
    "nasdelay"                         SMALLINT,           -- National Air System Delay, in Minutes
    "securitydelay"                    SMALLINT,           -- Security Delay, in Minutes
    "lateaircraftdelay"                SMALLINT,           -- Late Aircraft Delay, in Minutes


    -- Gate Return Information at Origin Airport (Data starts 10/2008)
    "firstdeptime"                     TIME,               -- First Gate Departure Time at Origin Airport
    "totaladdgtime"                    SMALLINT,           -- Total Ground Time Away from Gate for Gate Return or Cancelled Flight
    "longestaddgtime"                  SMALLINT,           -- Longest Time Away from Gate for Gate Return or Cancelled Flight


    -- Diverted Airport Information (Data starts 10/2008)
    "divairportlandings"               SMALLINT            -- Number of Diverted Airport Landings
                                       REFERENCES l_diversions(diversion_id),
    "divreacheddest"                   BOOLEAN             -- Diverted Flight Reaching Scheduled Destination Indicator (1=Yes) -> true/false
                                       NOT NULL
                                       REFERENCES l_yesno_resp(yesno_resp),
    "divactualelapsedtime"             INTEGER,            -- Elapsed Time of Diverted Flight Reaching Scheduled Destination, in Minutes. The ActualElapsedTime column remains NULL for all diverted flights.
    "divarrdelay"                      INTEGER,            -- Difference in minutes between scheduled and actual arrival time for a diverted flight reaching scheduled destination. The ArrDelay column remains NULL for all diverted flights.
    "divdistance"                      INTEGER,            -- Distance between scheduled destination and final diverted airport (miles). Value will be 0 for diverted flight reaching scheduled destination.
    "div1airport"                      TEXT,               -- Diverted Airport Code1
    "div1airportid"                    INTEGER             -- Airport ID of Diverted Airport 1. Airport ID is a Unique Key for an Airport
                                       REFERENCES l_airport_id(airport_id),
    "div1airportseqid"                 INTEGER             -- Airport Sequence ID of Diverted Airport 1. Unique Key for Time Specific Information for an Airport
                                       REFERENCES l_airport_seq_id(airport_seq_id),
    "div1wheelson"                     TIME,               -- Wheels On Time (local time: hhmm) at Diverted Airport Code1 -> hh:mm
    "div1totalgtime"                   INTEGER,            -- Total Ground Time Away from Gate at Diverted Airport Code1
    "div1longestgtime"                 INTEGER,            -- Longest Ground Time Away from Gate at Diverted Airport Code1
    "div1wheelsoff"                    TIME,               -- Wheels Off Time (local time: hhmm) at Diverted Airport Code1 -> hh:mm
    "div1tailnum"                      TEXT,               -- Aircraft Tail Number for Diverted Airport Code1
    "div2airport"                      TEXT,               -- Diverted Airport Code2
    "div2airportid"                    INTEGER             -- Airport ID of Diverted Airport 2. Airport ID is a Unique Key for an Airport
                                       REFERENCES l_airport_id(airport_id),
    "div2airportseqid"                 INTEGER             -- Airport Sequence ID of Diverted Airport 2. Unique Key for Time Specific Information for an Airport
                                       REFERENCES l_airport_seq_id(airport_seq_id),
    "div2wheelson"                     TIME,               -- Wheels On Time (local time: hhmm) at Diverted Airport Code2
    "div2totalgtime"                   INTEGER,            -- Total Ground Time Away from Gate at Diverted Airport Code2
    "div2longestgtime"                 INTEGER,            -- Longest Ground Time Away from Gate at Diverted Airport Code2
    "div2wheelsoff"                    TIME,               -- Wheels Off Time (local time: hhmm) at Diverted Airport Code2
    "div2tailnum"                      TEXT,               -- Aircraft Tail Number for Diverted Airport Code2
    "div3airport"                      TEXT,               -- Diverted Airport Code3
    "div3airportid"                    INTEGER             -- Airport ID of Diverted Airport 3. Airport ID is a Unique Key for an Airport
                                       REFERENCES l_airport_id(airport_id),
    "div3airportseqid"                 INTEGER             -- Airport Sequence ID of Diverted Airport 3. Unique Key for Time Specific Information for an Airport
                                       REFERENCES l_airport_seq_id(airport_seq_id),
    "div3wheelson"                     TIME,               -- Wheels On Time (local time: hhmm) at Diverted Airport Code3
    "div3totalgtime"                   INTEGER,            -- Total Ground Time Away from Gate at Diverted Airport Code3
    "div3longestgtime"                 INTEGER,            -- Longest Ground Time Away from Gate at Diverted Airport Code3
    "div3wheelsoff"                    TIME,               -- Wheels Off Time (local time: hhmm) at Diverted Airport Code3
    "div3tailnum"                      TEXT,               -- Aircraft Tail Number for Diverted Airport Code3
    "div4airport"                      TEXT,               -- Diverted Airport Code4
    "div4airportid"                    INTEGER             -- Airport ID of Diverted Airport 4. Airport ID is a Unique Key for an Airport       
                                       REFERENCES l_airport_id(airport_id),
    "div4airportseqid"                 INTEGER             -- Airport Sequence ID of Diverted Airport 4. Unique Key for Time Specific Information for an Airport
                                       REFERENCES l_airport_seq_id(airport_seq_id),
    "div4wheelson"                     TIME,               -- Wheels On Time (local time: hhmm) at Diverted Airport Code4
    "div4totalgtime"                   INTEGER,            -- Total Ground Time Away from Gate at Diverted Airport Code4
    "div4longestgtime"                 INTEGER,            -- Longest Ground Time Away from Gate at Diverted Airport Code4
    "div4wheelsoff"                    TIME,               -- Wheels Off Time (local time: hhmm) at Diverted Airport Code4
    "div4tailnum"                      TEXT,               -- Aircraft Tail Number for Diverted Airport Code4
    "div5airport"                      TEXT,               -- Diverted Airport Code5
    "div5airportid"                    INTEGER             -- Airport ID of Diverted Airport 5. Airport ID is a Unique Key for an Airport
                                       REFERENCES l_airport_id(airport_id),
    "div5airportseqid"                 INTEGER             -- Airport Sequence ID of Diverted Airport 5. Unique Key for Time Specific Information for an Airport
                                       REFERENCES l_airport_seq_id(airport_seq_id),
    "div5wheelson"                     TIME,               -- Wheels On Time (local time: hhmm) at Diverted Airport Code5
    "div5totalgtime"                   INTEGER,            -- Total Ground Time Away from Gate at Diverted Airport Code5
    "div5longestgtime"                 INTEGER,            -- Longest Ground Time Away from Gate at Diverted Airport Code5
    "div5wheelsoff"                    TIME,               -- Wheels Off Time (local time: hhmm) at Diverted Airport Code5
    "div5tailnum"                      TEXT                -- Aircraft Tail Number for Diverted Airport Code5
);
