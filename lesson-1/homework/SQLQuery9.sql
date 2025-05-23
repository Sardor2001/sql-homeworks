-- Step 1: Create tables
CREATE TABLE Book (
    book_id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    author NVARCHAR(255) NOT NULL,
    published_year INT
);

CREATE TABLE Member (
    member_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL UNIQUE,
    phone_number NVARCHAR(20)
);

CREATE TABLE Loan (
    loan_id INT IDENTITY(1,1) PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE NULL,
    CONSTRAINT FK_Loan_Book FOREIGN KEY (book_id) REFERENCES Book(book_id),
    CONSTRAINT FK_Loan_Member FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

-- Step 2: Insert sample data
INSERT INTO Book (title, author, published_year) 
VALUES 
('To Kill a Mockingbird', 'Harper Lee', 1960),
('1984', 'George Orwell', 1949),
('The Great Gatsby', 'F. Scott Fitzgerald', 1925);

INSERT INTO Member (name, email, phone_number)
VALUES 
('Alice Johnson', 'alice@example.com', '123-456-7890'),
('Bob Smith', 'bob@example.com', '987-654-3210'),
('Charlie Brown', 'charlie@example.com', '555-123-4567');

INSERT INTO Loan (book_id, member_id, loan_date, return_date) 
VALUES 
(1, 1, '2023-01-10', '2023-01-20'),
(2, 2, '2023-01-15', NULL),
(3, 1, '2023-01-18', NULL);

-- Step 3: Test relationships with queries
SELECT b.title, b.author, l.loan_date, l.return_date
FROM Loan l
JOIN Book b ON l.book_id = b.book_id
JOIN Member m ON l.member_id = m.member_id
WHERE m.name = 'Alice Johnson';

SELECT m.name, m.email, l.loan_date, l.return_date
FROM Loan l
JOIN Member m ON l.member_id = m.member_id
JOIN Book b ON l.book_id = b.book_id
WHERE b.title = '1984';

SELECT l.loan_id, b.title AS Book_Title, m.name AS Borrower, l.loan_date, l.return_date
FROM Loan l
JOIN Book b ON l.book_id = b.book_id
JOIN Member m ON l.member_id = m.member_id;