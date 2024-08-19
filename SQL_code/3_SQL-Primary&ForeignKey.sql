/* 

1: Primary Key Concepts
Define the term "Primary Key" in the context of a relational database.
A Primary Key is a unique identifier for each record in a database table. It ensures that each record can be uniquely identified and that no duplicate values exist in the Primary Key column(s). A table can have only one Primary Key, which can consist of single or multiple columns.

List at least two benefits of having a Primary Key in a table.
1. Uniqueness: Ensures that each record in the table is unique, preventing duplicate entries.
2. Indexing: Automatically creates a unique index, which improves the performance of queries involving the Primary Key.

2: Creating Primary Keys
Write a SQL query to create a table named "Students" with a Primary Key constraint on the "student_id" column.
*/

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    birthdate DATE
);

/* 
3: Foreign Key Concepts
Define the term "Foreign Key" in the context of a relational database.
A Foreign Key is a column or a set of columns in one table that references the Primary Key columns of another table. 
It establishes a relationship between the two tables and enforces referential integrity.

Explain the primary purpose and significance of using Foreign Keys in database tables.
The primary purpose of a Foreign Key is to maintain referential integrity between related tables. 
It ensures that the values in the Foreign Key column(s) correspond to valid values in the referenced Primary Key column(s), 
thus maintaining the consistency and accuracy of the data.
*/

/* 
4: Creating Foreign Keys
Create a new table named "Courses" with a Primary Key on the "course_id" column.
*/

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

/* 
Write a SQL query to create a Foreign Key constraint in the "Enrollments" table that references the "Students" and "Courses" tables.
*/

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

/* 
Explain the concept of referential integrity and how Foreign Keys help maintain it.
Referential Integrity ensures that relationships between tables remain consistent. 
Specifically, it means that any Foreign Key value in one table must match an existing Primary Key value in the referenced table. 
Foreign Keys enforce referential integrity by ensuring that records cannot be inserted into the child table (e.g., Enrollments) unless there is a corresponding record in the parent table (e.g., Students or Courses). This helps prevent orphaned records and maintains the logical relationships between tables.

Note: Please populate the tables (created above) with sample data.
*/

-- Inserting Sample Data into Students Table
INSERT INTO Students (student_id, name, birthdate) VALUES (1, 'Alice Johnson', '2000-01-15');
INSERT INTO Students (student_id, name, birthdate) VALUES (2, 'Bob Smith', '1999-05-22');
INSERT INTO Students (student_id, name, birthdate) VALUES (3, 'Charlie Brown', '2001-03-10');

-- Inserting Sample Data into Courses Table 
INSERT INTO Courses (course_id, course_name) VALUES (101, 'Mathematics');
INSERT INTO Courses (course_id, course_name) VALUES (102, 'History');
INSERT INTO Courses (course_id, course_name) VALUES (103, 'Computer Science');

-- Inserting Sample Data into Enrollments Table 
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES (1, 1, 101, '2024-09-01');
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES (2, 2, 102, '2024-09-01');
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES (3, 3, 103, '2024-09-01');
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES (4, 1, 103, '2024-09-02');