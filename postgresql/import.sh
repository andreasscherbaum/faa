#!/bin/bash

set -e



PSQL=/usr/bin/psql
DB=faa
DB_USER=ads
DB_HOST=
DB_PORT=

CONNECT=""
if [ -n "${DB}" ]; then
	CONNECT="${CONNECT} -d ${DB}"
fi
if [ -n "${DB_USER}" ]; then
	CONNECT="${CONNECT} -U ${DB_USER}"
fi
if [ -n "${DB_HOST}" ]; then
	CONNECT="${CONNECT} -h ${DB_HOST}"
fi
if [ -n "${DB_PORT}" ]; then
	CONNECT="${CONNECT} -p ${DB_PORT}"
fi




${PSQL} ${CONNECT} -f drop-OTP.sql


${PSQL} ${CONNECT} -f L_AIRLINE_ID.sql
${PSQL} ${CONNECT} -f L_AIRPORT_ID.sql
${PSQL} ${CONNECT} -f L_AIRPORT_SEQ_ID.sql
${PSQL} ${CONNECT} -f L_AIRPORT.sql                                                                                                               
${PSQL} ${CONNECT} -f L_CANCELLATION.sql                                                                                                          
${PSQL} ${CONNECT} -f L_CARRIER_HISTORY.sql                                                                                                       
${PSQL} ${CONNECT} -f L_CITY_MARKET_ID.sql                                                                                                        
${PSQL} ${CONNECT} -f L_DEPARRBLK.sql                                                                                                             
${PSQL} ${CONNECT} -f L_DISTANCE_GROUP_250.sql                                                                                                    
${PSQL} ${CONNECT} -f L_DIVERSIONS.sql                                                                                                            
${PSQL} ${CONNECT} -f L_MONTHS.sql                                                                                                                
${PSQL} ${CONNECT} -f L_ONTIME_DELAY_GROUPS.sql                                                                                                   
${PSQL} ${CONNECT} -f L_QUARTERS.sql                                                                                                              
${PSQL} ${CONNECT} -f L_STATE_ABR_AVIATION.sql                                                                                                    
${PSQL} ${CONNECT} -f L_STATE_FIPS.sql                                                                                                            
${PSQL} ${CONNECT} -f L_UNIQUE_CARRIERS.sql
${PSQL} ${CONNECT} -f L_WEEKDAYS.sql
${PSQL} ${CONNECT} -f L_WORLD_AREA_CODES.sql
${PSQL} ${CONNECT} -f L_YESNO_RESP.sql

${PSQL} ${CONNECT} -f OTP.sql
${PSQL} ${CONNECT} -f OTP_staging.sql



${PSQL} ${CONNECT} -c "\\copy L_AIRLINE_ID FROM 'L_AIRLINE_ID.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_AIRPORT FROM 'L_AIRPORT.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_AIRPORT_ID FROM 'L_AIRPORT_ID.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_AIRPORT_SEQ_ID FROM 'L_AIRPORT_SEQ_ID.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_CANCELLATION FROM 'L_CANCELLATION.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_CARRIER_HISTORY FROM 'L_CARRIER_HISTORY.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_CITY_MARKET_ID FROM 'L_CITY_MARKET_ID.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_DEPARRBLK FROM 'L_DEPARRBLK.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_DISTANCE_GROUP_250 FROM 'L_DISTANCE_GROUP_250.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_DIVERSIONS FROM 'L_DIVERSIONS.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_MONTHS FROM 'L_MONTHS.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_ONTIME_DELAY_GROUPS FROM 'L_ONTIME_DELAY_GROUPS.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_QUARTERS FROM 'L_QUARTERS.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_STATE_ABR_AVIATION FROM 'L_STATE_ABR_AVIATION.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_STATE_FIPS FROM 'L_STATE_FIPS.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_UNIQUE_CARRIERS FROM 'L_UNIQUE_CARRIERS.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_WEEKDAYS FROM 'L_WEEKDAYS.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_WORLD_AREA_CODES FROM 'L_WORLD_AREA_CODES.csv' DELIMITER AS ',' CSV HEADER"
${PSQL} ${CONNECT} -c "\\copy L_YESNO_RESP FROM 'L_YESNO_RESP.csv' DELIMITER AS ',' CSV HEADER"



