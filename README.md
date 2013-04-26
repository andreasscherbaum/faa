The US Federal Aviation Administration (FAA) provides data about on-time
performance (OTP) of airlines. This data is provided in monthly format.

This repository contains the table structure which is required to import
this data into a PostgreSQL or Greenplum database. It does *not* provide
the data itself, please visit the following website:

http://www.transtats.bts.gov/DataIndex.asp



Installation:

Edit and run the "import.sh" script in the according directory.
The script expects that you already downloaded the support tables,
they all start with "L_" and end with ".csv". The script will not
load any OTP data, that's something your ETL should do.

The Greenplum directory also contains a "load_errors.sql" file
which you can use to create the errors table for external tables.
See the AdminGuide for further information.



Load data (PostgreSQL):

For testing you can use the table "otp_staging" to load the data
into the database. Use psql to load the OTP CSV files into the
staging table:

\copy otp_staging from 'On_Time_On_Time_Performance_2012_12.csv' with delimiter as ',' csv header quote '"' null ''

Then use the provided "etl.sql" to copy the data from the staging
table into the "otp" table.



Load data (Greenplum):

For testing you can use gpfdist to load data into the "otp_staging"
table:

CREATE EXTERNAL TABLE otp_staging_load (LIKE otp_staging)
             LOCATION ('gpfdist://127.0.0.1:5000/On_Time_On_Time_Performance*.csv')
               FORMAT 'CSV' (HEADER DELIMITER AS ',' QUOTE AS '"' NULL AS '')
           LOG ERRORS INTO load_errors SEGMENT REJECT LIMIT 10 PERCENT;

Start gpfdist in the directory with the unpacked data files:

gpfdist -d . -v -p 5000

(Change ip address, TCP port and directory according to your environment)

Load the data using gpfdist into the staging table:

INSERT INTO otp_staging SELECT * FROM otp_staging_load;

Then use the provided "etl.sql" to copy the data from the staging
table into the "otp" table.




License:

I hereby place the content of this repository under the

PostgreSQL License

You can obtain a copy of the license here:

http://www.postgresql.org/about/licence/




If you have questions or improvements, please contact me:
Andreas 'ads' Scherbaum <ads@pgug.de>
