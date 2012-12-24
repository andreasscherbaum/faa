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




License:

I hereby place the content of this repository under the

PostgreSQL License

You can obtain a copy of the license here:

http://www.postgresql.org/about/licence/




If you have questions or improvements, please contact me:
Andreas 'ads' Scherbaum <ads@pgug.de>
