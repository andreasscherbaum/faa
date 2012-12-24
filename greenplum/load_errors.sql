CREATE TABLE load_errors (
    cmdtime                   TIMESTAMPTZ,
    relname                   TEXT,
    filename                  TEXT,
    linenum                   INTEGER,
    bytenum                   INTEGER,
    errmsg                    TEXT,
    rawdata                   TEXT,
    rawbytes                  BYTEA
)
DISTRIBUTED BY (cmdtime);
