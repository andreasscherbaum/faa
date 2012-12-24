
-- Column: cancellationcode


-- Specifies The Reason For Cancellation

DROP TABLE IF EXISTS l_cancellation;


CREATE TABLE l_cancellation (
    cancellation_code         CHAR(1)
	                      PRIMARY KEY,
    description               TEXT
);
