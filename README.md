# MySQL_Library-Management-System
MySQL Comprehensive Assignment - Library Management System

_Please check the link below:_
https://docs.google.com/document/d/1pdP366Yf56wINTYIUODGqyj_v-U3brAgR5uFPfXV1KM/edit#heading=h.p5g9ra8kwgru

**MYSQL Comprehensive Assessment	**	

Topic : Library Management System
You are going to build a project based on the Library Management System. It keeps track of all information about books in the library, their cost, status and total number of books available in the library.

Create a database named library and following TABLES in the database: 

1. Branch 
2. Employee 
3. Books
4. Customer
5. IssueStatus
6. ReturnStatus 

Attributes for the tables: 

1. Branch
Branch_no - Set as PRIMARY KEY  
Manager_Id  
Branch_address  
Contact_no 
2. Employee  
Emp_Id – Set as PRIMARY KEY  
Emp_name  
Position  
Salary
Branch_no - Set as FOREIGN KEY and it refer Branch_no in Branch table  
3. Books  
ISBN - Set as PRIMARY KEY  
Book_title  
Category  
Rental_Price  
Status [Give yes if book available and no if book not available]  
Author  
Publisher


4. Customer  
Customer_Id - Set as PRIMARY KEY  
Customer_name  
Customer_address  
Reg_date 
5. IssueStatus  
Issue_Id - Set as PRIMARY KEY  
Issued_cust – Set as FOREIGN KEY and it refer customer_id in CUSTOMER table  Issued_book_name 
Issue_date 
Isbn_book – Set as FOREIGN KEY and it should refer isbn in BOOKS table 
6. ReturnStatus  
Return_Id - Set as PRIMARY KEY  
Return_cust  
Return_book_name  
Return_date  
Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in BOOKS table 


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

Insights: 
These SQL queries will create the database "library" along with the specified tables and their attributes. The necessary foreign key constraints have been added to maintain referential integrity between related tables. And inserted 5 rows of sample data into each of the tables.

Display all the tables and Write the queries for the following :

1. Retrieve the book title, category, and rental price of all available books. 

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

Insights:
This query selects the specified columns from the "Books" table and filters the results to only include books where the status is 'yes', indicating that the book is available for rental.

2. List the employee names and their respective salaries in descending order of salary. 

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

Insights:
This query selects the employee names and their salaries from the "Employee" table and orders the results by the "Salary" column in descending order.

3. Retrieve the book titles and the corresponding customers who have issued those books. 

SELECT Books.Book_title, Customer.Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN;

Insights:
This query joins the "IssueStatus" table with the "Customer" table based on the customer ID who issued the books and then joins the "Books" table based on the ISBN of the issued books. It retrieves the book titles from the "Books" table and the corresponding customer names from the "Customer" table.

4. Display the total count of books in each category. 

SELECT Category, COUNT(*) AS Total_Count
FROM Books
GROUP BY Category;

Insights:
This query selects the "Category" column from the "Books" table and counts the number of occurrences of each category using the COUNT(*) function. It groups the results by the "Category" column.

5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

Insights:
This query selects the employee names and their positions from the "Employee" table where the salary is greater than Rs. 50,000.

6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 

SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (
    SELECT Issued_cust
    FROM IssueStatus
);

Insights:
This query retrieves the names of customers from the "Customer" table where the registration date is before January 1, 2022, and their customer IDs do not appear in the "Issued_cust" column of the "IssueStatus" table, indicating that they have not issued any books yet.

7. Display the branch numbers and the total count of employees in each branch. 

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

Insights:
This query selects the "Branch_no" column from the "Employee" table and counts the number of employees in each branch using the COUNT(*) function. It groups the results by the "Branch_no" column.

8. Display the names of customers who have issued books in the month of June 2023.

SELECT DISTINCT Customer.Customer_name
FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
WHERE MONTH(IssueStatus.Issue_date) = 6 AND YEAR(IssueStatus.Issue_date) = 2023;

Insights:
This query joins the "Customer" table with the "IssueStatus" table based on the customer ID who issued the books. It retrieves the distinct customer names from the "Customer" table where the issue date is in June 2023.

9. Retrieve book_title from the book table containing history. 

SELECT Book_title
FROM Books
WHERE Category = 'History';

Insights:
This query selects the "Book_title" from the "Books" table where the category is 'History'. It retrieves all book titles that fall under the category of History.

10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

Insights:
This query selects the branch numbers from the "Employee" table and counts the number of employees in each branch using the COUNT(*) function. It groups the results by the "Branch_no" column and includes only those branches that have more than 5 employees using the HAVING clause.

11. Retrieve the names of employees who manage branches and their respective branch addresses.

SELECT Employee.Emp_name, Branch.Branch_address
FROM Employee
JOIN Branch ON Employee.Branch_no = Branch.Branch_no
WHERE Employee.Position = 'Manager';

Insights:
This query joins the "Employee" table with the "Branch" table based on the branch number. It retrieves the employee names and branch addresses where the employee's position is 'Manager'.

12.  Display the names of customers who have issued books with a rental price higher than Rs. 25.

SELECT DISTINCT Customer.Customer_name
FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
WHERE Books.Rental_Price > 25;

Insights:
This query joins the "Customer" table with the "IssueStatus" table based on the customer ID who issued the books and then joins the "Books" table based on the ISBN of the issued books. It retrieves the distinct customer names from the "Customer" table where the rental price of the issued books is higher than Rs. 25.


