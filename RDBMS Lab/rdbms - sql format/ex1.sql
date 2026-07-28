CREATE TABLE department (
    deptid NUMBER PRIMARY KEY,
    deptname VARCHAR2(20)
);

INSERT INTO department VALUES (1, 'Computer Science');
INSERT INTO department VALUES (&a, '&b');

COMMIT;

CREATE TABLE student (
    studentid NUMBER PRIMARY KEY,
    courseid NUMBER,
    studentname VARCHAR2(20),
    age NUMBER,
    marks NUMBER,
    deptid NUMBER
);

INSERT INTO student VALUES (101, 201, 'Arun', 19, 85, 1);
INSERT INTO student VALUES (102, 202, 'Ajay', 20, 90, 3);
INSERT INTO student VALUES (103, 203, 'Karthik', 21, 75, 5);
INSERT INTO student VALUES (104, 204, 'Bala', 20, 80, 2);
INSERT INTO student VALUES (105, 205, 'Anitha', 19, 95, 1);

COMMIT;

CREATE TABLE course (
    courseid NUMBER,
    coursename VARCHAR2(20),
    deptid NUMBER
);

ALTER TABLE course
ADD credits NUMBER;

ALTER TABLE course
DROP COLUMN credits;

ALTER TABLE course
ADD PRIMARY KEY (courseid);

INSERT INTO course VALUES (201, 'Java', 1);
INSERT INTO course VALUES (202, 'Python', 3);
INSERT INTO course VALUES (203, 'DBMS', 5);
INSERT INTO course VALUES (204, 'Networks', 2);
INSERT INTO course VALUES (205, 'AI', 1);

COMMIT;

CREATE TABLE enrollment (
    studentid NUMBER,
    courseid NUMBER,
    enrolldate DATE,
    PRIMARY KEY (studentid, courseid)
);

INSERT INTO enrollment VALUES (101, 201, DATE '2026-01-10');
INSERT INTO enrollment VALUES (102, 202, DATE '2026-01-12');
INSERT INTO enrollment VALUES (103, 203, DATE '2026-01-15');

COMMIT;

CREATE TABLE newdept (
    deptid NUMBER PRIMARY KEY,
    deptname VARCHAR2(15) NOT NULL UNIQUE
);

CREATE TABLE newdept2 (
    deptid NUMBER PRIMARY KEY,
    deptname VARCHAR2(15) NOT NULL UNIQUE,
    hodname VARCHAR2(20),
    totalstudent NUMBER,
    CHECK (totalstudent >= 0)
);

CREATE TABLE newstudent (
    studentid NUMBER,
    studentname VARCHAR2(20),
    age NUMBER,
    marks NUMBER
);

ALTER TABLE newstudent
ADD PRIMARY KEY (studentid);

CREATE TABLE newcourse (
    courseid NUMBER,
    coursename VARCHAR2(20),
    deptid NUMBER
);

ALTER TABLE newcourse
ADD CONSTRAINT pk_newcourse PRIMARY KEY (courseid);

ALTER TABLE newcourse
DROP PRIMARY KEY;

CREATE TABLE student2 (
    studentid NUMBER PRIMARY KEY,
    studentname VARCHAR2(20),
    age NUMBER,
    deptid NUMBER,
    FOREIGN KEY (deptid)
        REFERENCES department(deptid)
);

INSERT INTO student2 VALUES (201, 'Ravi', 19, 1);
INSERT INTO student2 VALUES (202, 'Divya', 20, 1);

COMMIT;

CREATE TABLE checkstudent (
    studentid NUMBER PRIMARY KEY,
    studentname VARCHAR2(20),
    age NUMBER CHECK (age BETWEEN 18 AND 21),
    marks NUMBER
);

INSERT INTO checkstudent VALUES (301, 'Hari', 19, 88);

COMMIT;

CREATE TABLE checkstudent2 (
    studentid NUMBER PRIMARY KEY,
    studentname VARCHAR2(20),
    age NUMBER CHECK (age NOT BETWEEN 18 AND 21)
);

INSERT INTO checkstudent2 VALUES (401, 'Vijay', 23);

COMMIT;

SELECT *
FROM student
WHERE studentname LIKE 'A%';

SELECT *
FROM student
WHERE deptid IN (1, 3, 5);

SELECT *
FROM student
WHERE deptid NOT IN (1, 3, 5);

SELECT *
FROM student
WHERE deptid = 1
   OR deptid = 3
   OR deptid = 5;