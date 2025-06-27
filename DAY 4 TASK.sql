USE LIBRARY;
SHOW TABLES;
SELECT * FROM takes_help_from;

USE LIBRARY;

SELECT * FROM book;
SELECT * FROM employee;

USE LIBRARY;

INSERT INTO BOOK (book_id, book_name, author_name, edition)        
VALUES
(101, 'eco', 'rs', 2021),
(102, 'history', 'rds', 2021),
(103, 'geo', 'gaur', 2021),
(104, 'socio', 'n sangwan', 2021),
(105, 'polity', 'laxmikanth', 2021);

ALTER TABLE employee                                     /*modifications*/
MODIFY emp_email_id varchar(20);

INSERT INTO EMPLOYEE (Emp_id, emp_name, designation, emp_phone_no, emp_email_id)
VALUES
(2121, 'Harish', 'clerk', 7757212154, 'abc@gmail.com'),
(2122, 'Manish', 'dean', 1254545252, 'asd@gmail.com'),
(2123, 'Mehul', 'principal', 2022154851, 'qwe@gmail.com'),
(2124, 'Vishal', 'prof.', 2254536021, 'azc@gmail.com'),
(2125, 'Viraj', 'prof.', 2054821621, 'tyu@gmail.com');

 /*just below varchar size incresed to 30 from 20 as thrown error while updating designation*/
ALTER TABLE EMPLOYEE                                  
MODIFY designation VARCHAR(30);

UPDATE EMPLOYEE                                /*use of where command along with update*/
SET designation = 'vice principal'
WHERE Emp_id = 2123;



set sql_safe_updates=0;  /*safe mode off in sql*/

DELETE FROM EMPLOYEE                  /*use of delete command*/
WHERE emp_name = 'Viraj';

UPDATE EMPLOYEE                            /*null handling*/
SET emp_email_id = NULL
WHERE Emp_id = 2121;


/*INSERTING VALUES IN SOME OTHER TABLES AS WELL IN LIBRARY DATABASE*/

USE LIBRARY;

INSERT INTO STUDENT (prn_no, student_name, roll_no, department, librarycard_no)
VALUES 
(1011, 'Amit Sharma', 1, 'Computer Science', 1001),
(1022, 'Sneha Patil', 2, 'Information Technology', 1002),
(1033, 'Raj Verma', 3, 'Electronics', 1003),
(1044, 'Pooja Desai', 4, 'Mechanical', 1004),
(1055, 'Nikhil Joshi', 5, 'Civil', 1005);


ALTER TABLE STUDENT                                     /*ABOVE DEPARTMENT COLUMN SIZE IS 20 INCREASING TO 50*/
MODIFY DEPARTMENT varchar(50);

SELECT * FROM ISSUED_BY;

INSERT INTO ISSUED_BY (issue_date, return_date, issue_time, book_id, prn_no)
VALUES
('2025-06-20', '2025-06-25', '10:30:00',101,1011),
('2025-06-21', '2025-06-26', '11:00:00',102,1022),
('2025-06-22', '2025-06-27', '09:45:00',103,1033),
('2025-06-23', '2025-06-28', '13:15:00',104,1044),
('2025-06-24', '2025-06-29', '15:00:00',105,1055);


SELECT * FROM EMPLOYEE;

ALTER TABLE EMPLOYEE      
ADD salary DECIMAL(10, 2);  /*DECIMAL(10, 2) means:

							Up to 10 digits total
                            2 digits after the decimal point
                            Suitable for salaries like 50000.00, 123456.78, etc*/


UPDATE EMPLOYEE
SET salary = CASE Emp_id
    WHEN 2121 THEN 50000
    WHEN 2122 THEN 45000
    WHEN 2123 THEN 60000
    WHEN 2124 THEN 55000
  END
WHERE Emp_id IN (2121, 2122, 2123, 2124);

INSERT INTO EMPLOYEE(EMP_ID,EMP_NAME,DESIGNATION,Emp_phone_no,Emp_email_id,salary)
values 
(2125,"amir","ceo",7758585652,"abm@gmail.com",20000000);

/*DAY 4 TASK*/
USE LIBRARY;
/*Apply aggregate functions on numeric columns*/
SELECT SUM(salary) AS Total_Salary FROM EMPLOYEE;

SELECT AVG(salary) AS Average_Salary FROM EMPLOYEE;

SELECT MAX(salary) AS Highest_Salary FROM EMPLOYEE;

SELECT COUNT(*) AS Total_Employees FROM EMPLOYEE;

/*Use GROUP BY to categorize*/

SELECT designation, AVG(salary) AS Avg_Salary
FROM EMPLOYEE
GROUP BY designation;

SELECT designation, COUNT(*) AS No_of_Employees
FROM EMPLOYEE
GROUP BY designation;

/*Filter groups using HAVING*/

SELECT designation, AVG(salary) AS Avg_Salary
FROM EMPLOYEE
GROUP BY designation
HAVING AVG(salary) < 50000;

SELECT designation, MIN(salary) AS MIN_SALARY
FROM EMPLOYEE
GROUP BY designation
HAVING MIN(salary) > 50000;


