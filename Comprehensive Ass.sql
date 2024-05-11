CREATE DATABASE IF NOT EXISTS library;
USE library;
-- Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(20)
);

-- Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Books table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

-- Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Inserting into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) 
VALUES 
(1, 101, '123 Main St', '123-456-7890'),
(2, 102, '456 Elm St', '987-654-3210'),
(3, 103, '789 Oak St', '321-654-9870'),
(4, 104, '321 Maple St', '456-789-0123'),
(5, 105, '654 Pine St', '789-012-3456');

-- Inserting into Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) 
VALUES 
(201, 'John Doe', 'Manager', 50000.00, 1),
(202, 'Jane Smith', 'Assistant Manager', 40000.00, 2),
(203, 'Michael Johnson', 'Clerk', 30000.00, 3),
(204, 'Emily Brown', 'Clerk', 30000.00, 4),
(205, 'David Wilson', 'Clerk', 30000.00, 5);

-- Inserting into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) 
VALUES 
('978-0061120084', 'To Kill a Mockingbird', 'Fiction', 5.99, 'yes', 'Harper Lee', 'HarperCollins'),
('978-1451673319', '1984', 'Fiction', 6.99, 'yes', 'George Orwell', 'Signet Classic'),
('978-0143127550', 'The Great Gatsby', 'Fiction', 4.99, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0345342966', 'Fahrenheit 451', 'Science Fiction', 7.99, 'yes', 'Ray Bradbury', 'Del Rey'),
('978-0553212457', 'Pride and Prejudice', 'Romance', 5.99, 'yes', 'Jane Austen', 'Bantam Classics');

-- Inserting into Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) 
VALUES 
(301, 'Alice Johnson', '789 Oak St', '2024-05-01'),
(302, 'Bob Smith', '456 Elm St', '2024-05-02'),
(303, 'Charlie Brown', '123 Main St', '2024-05-03'),
(304, 'Diana Wilson', '654 Pine St', '2024-05-04'),
(305, 'Eva Parker', '321 Maple St', '2024-05-05');

-- Inserting into IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) 
VALUES 
(401, 301, 'To Kill a Mockingbird', '2024-05-05', '978-0061120084'),
(402, 302, '1984', '2024-05-06', '978-1451673319'),
(403, 303, 'The Great Gatsby', '2024-05-07', '978-0143127550'),
(404, 304, 'Fahrenheit 451', '2024-05-08', '978-0345342966'),
(405, 305, 'Pride and Prejudice', '2024-05-09', '978-0553212457');

-- Inserting into ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) 
VALUES 
(501, 301, 'To Kill a Mockingbird', '2024-05-10', '978-0061120084'),
(502, 302, '1984', '2024-05-11', '978-1451673319'),
(503, 303, 'The Great Gatsby', '2024-05-12', '978-0143127550'),
(504, 304, 'Fahrenheit 451', '2024-05-13', '978-0345342966'),
(505, 305, 'Pride and Prejudice', '2024-05-14', '978-0553212457');

SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

SELECT Books.Book_title, Customer.Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN;

SELECT Category, COUNT(*) AS Total_Count FROM Books GROUP BY Category;

SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (
    SELECT Issued_cust
    FROM IssueStatus
);

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

SELECT DISTINCT Customer.Customer_name
FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
WHERE MONTH(IssueStatus.Issue_date) = 6 AND YEAR(IssueStatus.Issue_date) = 2023;

SELECT Book_title
FROM Books
WHERE Category = 'History';

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

SELECT Employee.Emp_name, Branch.Branch_address
FROM Employee
JOIN Branch ON Employee.Branch_no = Branch.Branch_no
WHERE Employee.Position = 'Manager';

SELECT DISTINCT Customer.Customer_name
FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
WHERE Books.Rental_Price > 25;









