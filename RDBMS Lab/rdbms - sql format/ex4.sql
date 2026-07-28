SET SERVEROUTPUT ON;

CREATE TABLE student_plsql (
    rollno NUMBER PRIMARY KEY,
    studentname VARCHAR2(20),
    average NUMBER(5,2),
    result VARCHAR2(10),
    grade VARCHAR2(20)
);

INSERT INTO student_plsql VALUES (1, 'Ravi', 95, 'Pass', NULL);
INSERT INTO student_plsql VALUES (2, 'Kumar', 84, 'Pass', NULL);
INSERT INTO student_plsql VALUES (3, 'Priya', 76, 'Pass', NULL);
INSERT INTO student_plsql VALUES (4, 'Anitha', 68, 'Pass', NULL);
INSERT INTO student_plsql VALUES (5, 'Suresh', 35, 'Fail', NULL);

COMMIT;

DECLARE
    v_count NUMBER;
BEGIN
    UPDATE student_plsql
    SET grade =
        CASE
            WHEN result = 'Pass' AND average >= 90 THEN 'A'
            WHEN result = 'Pass' AND average >= 80 THEN 'B'
            WHEN result = 'Pass' AND average >= 70 THEN 'C'
            WHEN result = 'Pass' AND average >= 60 THEN 'D'
            ELSE 'Better Luck Next Time'
        END;

    v_count := SQL%ROWCOUNT;

    DBMS_OUTPUT.PUT_LINE('Rows Updated : ' || v_count);
END;
/

SELECT *
FROM student_plsql;

CREATE TABLE employee_plsql (
    empno NUMBER PRIMARY KEY,
    ename VARCHAR2(20),
    job VARCHAR2(20),
    sal NUMBER
);

INSERT INTO employee_plsql VALUES (101, 'John', 'MANAGER', 5000);
INSERT INTO employee_plsql VALUES (102, 'Priya', 'CLERK', 3500);
INSERT INTO employee_plsql VALUES (103, 'Aravind', 'MANAGER', 5200);
INSERT INTO employee_plsql VALUES (104, 'Kumar', 'ANALYST', 4500);

COMMIT;

DECLARE
    var_row NUMBER;
BEGIN
    UPDATE employee_plsql
    SET sal = sal + 100;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees were updated.');
    ELSIF SQL%FOUND THEN
        var_row := SQL%ROWCOUNT;
        DBMS_OUTPUT.PUT_LINE('Salary updated for ' || var_row || ' employees.');
    END IF;
END;
/

SELECT *
FROM employee_plsql;

DECLARE
    CURSOR emp_cur IS
        SELECT *
        FROM employee_plsql;

    emp_rec employee_plsql%ROWTYPE;
BEGIN
    OPEN emp_cur;

    LOOP
        FETCH emp_cur
        INTO emp_rec;

        EXIT WHEN emp_cur%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            emp_rec.empno || '  ' ||
            emp_rec.ename || '  ' ||
            emp_rec.sal
        );
    END LOOP;

    CLOSE emp_cur;
END;
/

DECLARE
    CURSOR c1 IS
        SELECT ename, sal
        FROM employee_plsql;
BEGIN
    FOR i IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE(i.ename || '  ' || i.sal);
    END LOOP;
END;
/

DECLARE
    CURSOR all_emp IS
        SELECT empno, ename
        FROM employee_plsql
        ORDER BY empno;

    emp1 all_emp%ROWTYPE;
BEGIN
    OPEN all_emp;

    LOOP
        FETCH all_emp
        INTO emp1;

        EXIT WHEN all_emp%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            emp1.empno || '  ' || emp1.ename
        );
    END LOOP;

    CLOSE all_emp;
END;
/

DECLARE
    CURSOR c(job_name VARCHAR2) IS
        SELECT ename
        FROM employee_plsql
        WHERE job = job_name;

    v_emp employee_plsql.ename%TYPE;
BEGIN
    OPEN c('MANAGER');

    DBMS_OUTPUT.PUT_LINE('Employees Working as MANAGER');

    LOOP
        FETCH c
        INTO v_emp;

        EXIT WHEN c%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_emp);
    END LOOP;

    CLOSE c;
END;
/

DECLARE
    CURSOR c_emp IS
        SELECT sal, ename
        FROM employee_plsql
        WHERE sal = 5300;

    v_empdata c_emp%ROWTYPE;
BEGIN
    OPEN c_emp;

    FETCH c_emp
    INTO v_empdata;

    WHILE c_emp%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(
            v_empdata.ename || '  ' || v_empdata.sal
        );

        FETCH c_emp
        INTO v_empdata;
    END LOOP;

    CLOSE c_emp;
END;
/