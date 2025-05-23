USE homeworks_db; -- Ensure you're working in the correct database

CREATE TABLE photos (
    id INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incrementing primary key
    image_data VARBINARY(MAX)          -- Column to store binary image data
);

EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;

D:\Программирование\sql-homeworks\lesson-2\homework\image1.png