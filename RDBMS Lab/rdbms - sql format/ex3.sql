CREATE TABLE employee_functions (
    empid NUMBER PRIMARY KEY,
    ename VARCHAR2(20),
    sal NUMBER,
    doj DATE,
    dept VARCHAR2(20)
);

INSERT INTO employee_functions
VALUES (101, ' John Smith ', 45000,
        TO_DATE('15-01-2020', 'DD-MM-YYYY'),
        'IT');

INSERT INTO employee_functions
VALUES (102, 'PRIYA', 62000,
        TO_DATE('10-03-2018', 'DD-MM-YYYY'),
        'HR');

INSERT INTO employee_functions
VALUES (103, 'Aravind', -5000,
        TO_DATE('28-02-2021', 'DD-MM-YYYY'),
        'Sales');

COMMIT;

SELECT LTRIM(ename)
FROM employee_functions
WHERE empid = 101;

SELECT RTRIM(ename)
FROM employee_functions
WHERE empid = 101;

SELECT TRIM(ename)
FROM employee_functions
WHERE empid = 101;

SELECT LPAD(ename, 15, '*')
FROM employee_functions
WHERE empid = 102;

SELECT RPAD(ename, 15, '*')
FROM employee_functions
WHERE empid = 102;

SELECT CONCAT(ename, dept)
FROM employee_functions
WHERE empid = 102;

SELECT LOWER(dept)
FROM employee_functions
WHERE empid = 102;

SELECT UPPER(dept)
FROM employee_functions
WHERE empid = 103;

SELECT LENGTH(TRIM(ename))
FROM employee_functions
WHERE empid = 101;

SELECT SUBSTR(TRIM(ename), 1, 4)
FROM employee_functions
WHERE empid = 101;

SELECT INSTR(TRIM(ename), 'S')
FROM employee_functions
WHERE empid = 101;

SELECT SYSDATE
FROM dual;

SELECT NEXT_DAY(doj, 'MONDAY')
FROM employee_functions
WHERE empid = 101;

SELECT ADD_MONTHS(doj, 6)
FROM employee_functions
WHERE empid = 101;

SELECT LAST_DAY(doj)
FROM employee_functions
WHERE empid = 101;

SELECT MONTHS_BETWEEN(SYSDATE, doj)
FROM employee_functions
WHERE empid = 102;

SELECT LEAST(45000, 62000, -5000)
FROM dual;

SELECT GREATEST(sal, 50000)
FROM employee_functions
WHERE empid = 101;

SELECT TRUNC(1234.5678, 2)
FROM dual;

SELECT ROUND(1234.5678, 2)
FROM dual;

SELECT MOD(sal, 1000)
FROM employee_functions
WHERE empid = 101;

SELECT POWER(2, 5)
FROM dual;

SELECT ABS(sal)
FROM employee_functions
WHERE empid = 103;

SELECT SIGN(sal)
FROM employee_functions
WHERE empid = 103;

SELECT CEIL(45.23)
FROM dual;

SELECT FLOOR(45.89)
FROM dual;

SELECT EXP(1)
FROM dual;

SELECT
    SIN(0),
    COS(0),
    TAN(0)
FROM dual;

SELECT
    LOG(10, 100) AS log_base10,
    LN(2.71828) AS natural_log
FROM dual;

SELECT TO_CHAR(sal, '99,999')
FROM employee_functions
WHERE empid = 102;

SELECT TO_CHAR(doj, 'DD-MM-YYYY')
FROM employee_functions
WHERE empid = 102;

SELECT TO_NUMBER('62000') + 1000
FROM dual;

SELECT TO_DATE('25-12-2025', 'DD-MM-YYYY')
FROM dual;

CREATE TABLE dept_a_exp3 (
    empid NUMBER,
    ename VARCHAR2(20)
);

CREATE TABLE dept_b_exp3 (
    empid NUMBER,
    ename VARCHAR2(20)
);

INSERT INTO dept_a_exp3
VALUES (101, 'John');

INSERT INTO dept_a_exp3
VALUES (103, 'Aravind');

INSERT INTO dept_b_exp3
VALUES (102, 'Priya');

INSERT INTO dept_b_exp3
VALUES (104, 'Kumar');

COMMIT;

SELECT empid, ename
FROM dept_a_exp3

UNION

SELECT empid, ename
FROM dept_b_exp3;

SELECT empid, ename
FROM dept_a_exp3

INTERSECT

SELECT empid, ename
FROM dept_b_exp3;

SELECT empid, ename
FROM dept_a_exp3

MINUS

SELECT empid, ename
FROM dept_b_exp3;

SELECT empid, ename
FROM dept_b_exp3

MINUS

SELECT empid, ename
FROM dept_a_exp3;

SELECT DISTINCT ename
FROM dept_b_exp3;