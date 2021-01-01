
CREATE TABLE student (
  id SERIAL,
  name CHAR(255),
  gpa NUMERIC
);

DROP TABLE student;

ALTER TABLE student
    ADD COLUMN phone VARCHAR(15);

ALTER TABLE student
    DROP COLUMN phone RESTRICT;

ALTER TABLE student
    ALTER COLUMN name TYPE VARCHAR(500);



-- INSERT INTO student (id, name, gpa)
--     VALUES (1, 'Student 1', 3.8);
--
-- INSERT INTO student (id, name, gpa)
--     VALUES (2, 'Student 2', 4.0);
--
-- INSERT INTO student VALUES (3, 'Student 3', 3.5);


INSERT INTO student
    VALUES (DEFAULT, 'Student 1', 3.8);

INSERT INTO student
    VALUES (DEFAULT, 'Student 2', 4.0);

INSERT INTO student
  VALUES (DEFAULT, 'Student 3', 3.5);

UPDATE student SET name='Student 11' WHERE id=1;

DELETE FROM student WHERE id=3;

INSERT INTO student
  VALUES (DEFAULT, 'Student 4', 3.6);

SELECT * FROM student;


-- DDL - Data definition language

--   CREATE
--   ALTER
--   DROP

-- DML - Data manipulation language

--   select 
--   insert
--   update
--   delete

-- DCL -  Data control language

--   grant
--   deny

-- TCL - Transaction control language

--   begin transaction
--   rollback transaction
--   commit transaction
--   save transaction





