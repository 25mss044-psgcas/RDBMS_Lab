CREATE TABLE student_marks (
    rollno NUMBER PRIMARY KEY,
    name VARCHAR2(20),
    english NUMBER,
    maths NUMBER,
    science NUMBER,
    social NUMBER,
    computer NUMBER,
    total NUMBER,
    average NUMBER(5,2),
    result VARCHAR2(10)
);

INSERT INTO student_marks
VALUES (1, 'Ravi', 82, 90, 80, 95, 88, NULL, NULL, NULL);

INSERT INTO student_marks
VALUES (2, 'Kumar', 75, 68, 72, 80, 85, NULL, NULL, NULL);

INSERT INTO student_marks
VALUES (3, 'Priya', 95, 98, 90, 92, 96, NULL, NULL, NULL);

COMMIT;

UPDATE student_marks
SET total = english + maths + science + social + computer;

UPDATE student_marks
SET average = total / 5;

UPDATE student_marks
SET result = 'Pass'
WHERE average >= 40;

UPDATE student_marks
SET result = 'Fail'
WHERE average < 40;

COMMIT;

SELECT *
FROM student_marks;

SELECT
    MAX(english) AS high_english,
    MAX(maths) AS high_maths,
    MAX(science) AS high_science,
    MAX(social) AS high_social,
    MAX(computer) AS high_computer
FROM student_marks;

SELECT
    MIN(english) AS low_english,
    MIN(maths) AS low_maths,
    MIN(science) AS low_science,
    MIN(social) AS low_social,
    MIN(computer) AS low_computer
FROM student_marks;

CREATE TABLE employee_details (
    empid NUMBER PRIMARY KEY,
    empname VARCHAR2(20),
    department VARCHAR2(20),
    salary NUMBER
);

INSERT INTO employee_details
VALUES (101, 'Ravi', 'HR', 30000);

INSERT INTO employee_details
VALUES (102, 'Kumar', 'HR', 35000);

INSERT INTO employee_details
VALUES (103, 'Priya', 'IT', 45000);

INSERT INTO employee_details
VALUES (104, 'Anitha', 'IT', 50000);

INSERT INTO employee_details
VALUES (105, 'Suresh', 'Sales', 28000);

COMMIT;

SELECT
    department,
    MIN(salary) AS minimum_salary
FROM employee_details
GROUP BY department;

SELECT
    department,
    MAX(salary) AS maximum_salary
FROM employee_details
GROUP BY department;

CREATE TABLE customer_details (
    customerid NUMBER PRIMARY KEY,
    customername VARCHAR2(20),
    country VARCHAR2(20),
    city VARCHAR2(20)
);

INSERT INTO customer_details
VALUES (1, 'Arun', 'India', 'Chennai');

INSERT INTO customer_details
VALUES (2, 'Meena', 'India', 'Madurai');

INSERT INTO customer_details
VALUES (3, 'John', 'USA', 'New York');

INSERT INTO customer_details
VALUES (4, 'David', 'USA', 'Boston');

INSERT INTO customer_details
VALUES (5, 'Asha', 'India', 'Coimbatore');

INSERT INTO customer_details
VALUES (6, 'Rani', 'Canada', 'Toronto');

INSERT INTO customer_details
VALUES (7, 'Kevin', 'Canada', 'Ottawa');

INSERT INTO customer_details
VALUES (8, 'Maria', 'USA', 'Chicago');

COMMIT;

SELECT
    country,
    COUNT(*) AS total_customers
FROM customer_details
GROUP BY country;

SELECT
    country,
    COUNT(*) AS total_customers
FROM customer_details
GROUP BY country
ORDER BY total_customers DESC;

SELECT
    country,
    COUNT(*) AS total_customers
FROM customer_details
GROUP BY country
ORDER BY total_customers ASC;

SELECT
    country,
    COUNT(*) AS total_customers
FROM customer_details
GROUP BY country
HAVING COUNT(*) >
(
    SELECT AVG(customer_count)
    FROM
    (
        SELECT COUNT(*) customer_count
        FROM customer_details
        GROUP BY country
    )
);

SELECT
    country,
    COUNT(customerid) AS total_customers
FROM customer_details
GROUP BY country
HAVING COUNT(customerid) > 2
ORDER BY total_customers DESC;

SELECT
    country,
    city,
    COUNT(customerid) AS total_customers
FROM customer_details
GROUP BY country, city
ORDER BY country ASC, city ASC;

SELECT
    customerid,
    customername,
    country,
    city
FROM customer_details
ORDER BY country ASC, city DESC;

SELECT
    customerid,
    customername,
    country,
    city
FROM customer_details
ORDER BY country DESC, city DESC;