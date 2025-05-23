CREATE TABLE student (
    student_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    classes INT NOT NULL,
    tuition_per_class DECIMAL(10, 2) NOT NULL,
    total_tuition AS (classes * tuition_per_class)
);

INSERT INTO student (name, classes, tuition_per_class)
VALUES 
('Alice', 5, 100.00),
('Bob', 3, 150.00),
('Charlie', 7, 120.50);

SELECT * FROM student;

INSERT INTO student (name, classes, tuition_per_class)
VALUES 
('David', 10, 80.00),
('Emma', 2, 200.00);

UPDATE student
SET classes = 6
WHERE student_id = 1;

SELECT * FROM student;

SELECT name, total_tuition
FROM student
WHERE total_tuition > 500;