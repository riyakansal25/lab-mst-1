Create a College Course Management System using Course and Faculty tables.
Create Course and Faculty tables with suitable attributes.
Apply appropriate Primary Key and Foreign Key constraints.
Apply suitable NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
Insert at least 5 faculty records and 5 course records.
Display courses having credits between 2 and 4.
Display courses whose names start with a particular letter using LIKE.
Display courses belonging to a selected set of departments using IN.
Display unique department names using DISTINCT.
Update the faculty assigned to a particular course.
Delete a course based on a suitable condition.
Add a new column to the Course table using ALTER.
Display the final Course records.


USE college_db

CREATE TABLE faculty (
faculty_id int PRIMARY KEY,
faculty_name varchar(50) not null,
email varchar(50) unique,
department varchar(50) not null,
experience INT
);

CREATE TABLE Course (
course_id INT PRIMARY KEY,
course_name VARCHAR(50) NOT NULL,
credits INT DEFAULT 3 CHECK (credits BETWEEN 1 AND 6),
department VARCHAR(30) NOT NULL,
faculty_id INT UNIQUE,
FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);

INSERT INTO Faculty VALUES
(101, 'Ansh Sharma', 'sharma@gmail.com', 'CSE', 10),
(102, 'Aryan Mehta', 'mehta@gmail.com', 'ECE', 8),
(103, 'Maya Singh', 'singh@gmail.com', 'CSE', 12),
(104, 'Rishab Kapoor', 'kapoor@gmail.com', 'IT', 6),
(105, 'Kusha Verma', 'verma@gmail.com', 'ME', 9);

INSERT INTO Course VALUES
(201, 'Database Systems', 4, 'CSE', 101),
(202, 'Computer Graphics', 3, 'CSE', 103),
(203, 'Digital Electronics', 3, 'ECE', 102),
(204, 'Operating Systems', 4, 'IT', 104),
(205, 'Communication Skills', 2, 'ME', 105);

SELECT * from course where credits BETWEEN 2 AND 4;

SELECT * FROM course where course_name like 'C%';

SELECT * FROM course where department IN ('CSE', 'ECE');

SELECT DISTINCT department FROM Course;

UPDATE Course SET faculty_id = 102 WHERE course_id = 201;

DELETE FROM course where department='IT';

ALTER table course ADD joining_date date;

SELECT * from course;