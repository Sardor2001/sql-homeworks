CREATE TABLE worker (
    id INT PRIMARY KEY,   -- Worker ID (must be unique)
    name NVARCHAR(100)    -- Name of the worker
);

EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;

BULK INSERT worker
FROM 'D:\Программирование\sql-homeworks\lesson-2\homework\workers.csv'
WITH (
    FIRSTROW = 2,             -- Skip the header row
    FIELDTERMINATOR = ',',    -- Fields are separated by commas
    ROWTERMINATOR = '\n',     -- Rows are terminated by newlines
    DATAFILETYPE = 'char'     -- Data is in plain text format
);

SELECT * FROM worker;