CREATE TABLE data_types_demo (
    id INT IDENTITY(1,1) PRIMARY KEY,     -- Integer data type with auto-increment
    int_example INT,                      -- Integer example
    smallint_example SMALLINT,            -- Small integer example
    bigint_example BIGINT,                -- Large integer example
    decimal_example DECIMAL(10, 2),       -- Fixed-point number
    float_example FLOAT,                  -- Floating-point number
    char_example CHAR(10),                -- Fixed-length character string
    varchar_example VARCHAR(50),          -- Variable-length character string
    text_example TEXT,                    -- Text data
    date_example DATE,                    -- Date only
    datetime_example DATETIME,            -- Date and time
    time_example TIME,                    -- Time only
    boolean_example BIT                   -- Boolean value (0 or 1)
);

INSERT INTO data_types_demo (
    int_example, 
    smallint_example, 
    bigint_example, 
    decimal_example, 
    float_example, 
    char_example, 
    varchar_example, 
    text_example, 
    date_example, 
    datetime_example, 
    time_example, 
    boolean_example
) 
VALUES
(42,                -- INT example
 32000,             -- SMALLINT example
 9223372036854775807, -- BIGINT example (max value)
 1234.56,           -- DECIMAL example
 9876.54321,        -- FLOAT example
 'FixedChar',       -- CHAR example
 'VariableChar!',   -- VARCHAR example
 'This is a sample text.', -- TEXT example
 '2023-10-01',      -- DATE example
 '2023-10-01 15:45:00', -- DATETIME example
 '15:45:00',        -- TIME example
 1                  -- BIT example (TRUE)
);

SELECT * FROM data_types_demo;