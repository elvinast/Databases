------------ 1 ----------------

CREATE TABLE universities(
    name varchar(255) NOT NULL PRIMARY KEY,
    rating int,
    scholarships boolean CHECK (scholarships is true) ,
    location varchar(255)
);

CREATE TABLE subjects(
    name varchar(255) NOT NULL PRIMARY KEY,
    credits int CHECK (credits <= 7),
    important boolean,
    prerequisite varchar(255)
);

CREATE TABLE companies(
    name varchar(255) NOT NULL PRIMARY KEY,
    applications int CHECK (applications >= 1000),
    international boolean,
    employees int NOT NULL
);


INSERT INTO universities VALUES ('MIT', 1, true, 'USA');
INSERT INTO universities VALUES ('Stanford', 2, true, 'USA');
INSERT INTO universities VALUES ('Harvard', 3, true, 'USA');
INSERT INTO universities VALUES ('KBTU', 500, true, 'KZ');
INSERT INTO universities VALUES ('KAIST', 39, true, 'South Korea');
INSERT INTO universities VALUES ('UM', 60, true, 'Malaysia');
INSERT INTO universities VALUES ('LMSU', 80, true, 'Russia');
INSERT INTO universities VALUES ('TU', 90, true, 'Japan');
INSERT INTO universities VALUES ('SU', 110, true, 'France');


INSERT INTO subjects VALUES ('DB', 3, true, 'DS');
INSERT INTO subjects VALUES ('ADS', 3, true, 'PP1');
INSERT INTO subjects VALUES ('OOP', 3, true, 'PP2');
INSERT INTO subjects VALUES ('ICT', 3, true, NULL);
INSERT INTO subjects VALUES ('Globalisation', 3, false, NULL);
INSERT INTO subjects VALUES ('IOS dev', 3, true, 'OOP');
INSERT INTO subjects VALUES ('Web dev', 4, true, 'DB');
INSERT INTO subjects VALUES ('Psychology', 2, false, NULL);
INSERT INTO subjects VALUES ('Statistics', 3, true, 'DS');


INSERT INTO companies VALUES ('Apple', 500000, true, 50000);
INSERT INTO companies VALUES ('Google', 950000, true, 145000);
INSERT INTO companies VALUES ('Amazon', 3000000, true, 1000000);
INSERT INTO companies VALUES ('Netflix', 455000, true, 15000);
INSERT INTO companies VALUES ('Facebook', 180000, true, 65000);
INSERT INTO companies VALUES ('Twiter', 20000, true, 7000);
INSERT INTO companies VALUES ('Kaspi', 3700, false, 5000);
INSERT INTO companies VALUES ('Kolesa', 1850, false, 1500);
INSERT INTO companies VALUES ('EPAM', 8000, true, 1000);

SELECT * FROM universities;
SELECT * FROM subjects;
SELECT * FROM companies;

------------ 2 ----------------

CREATE VIEW viewTotal0 AS SELECT DISTINCT
 universities.name, universities.scholarships,
 subjects.credits, subjects.important,
 companies.international, companies.applications FROM subjects, universities
 INNER JOIN companies
 ON universities.rating <= 5
 AND companies.applications >= 1000000;
  
  
SELECT * FROM viewTotal0;

------------ 3 ----------------

CREATE TEMP VIEW viewUniv
 AS SELECT name, rating from universities
   WHERE rating <= 10;

SELECT * FROM viewUniv;


CREATE TEMP VIEW viewSubjects
 AS SELECT name, important from subjects
   WHERE credits = 3 AND prerequisite IS NULL;

SELECT * FROM viewSubjects;


CREATE TEMP VIEW viewCompanies
 AS SELECT name, applications from companies
   WHERE international IS TRUE;

SELECT * FROM viewCompanies;

-------------- 4 -----------------

CREATE VIEW viewUniversities
 AS SELECT name, scholarships, location FROM universities
   WHERE scholarships IS TRUE;

INSERT INTO viewUniversities VALUES('NU', true,'KZ');
UPDATE viewUniversities 
 SET name = 'ITMO'
   WHERE location = 'Russia';

SELECT * FROM viewUniversities;

-------------- 5 -----------------

CREATE VIEW viewCompanies5
 AS SELECT name, international, employees FROM companies
   WHERE employees >= 3
     LIMIT 5;
    
INSERT INTO viewCompanies5 VALUES('Bloomberg', true, 4800);
error because we have limit => impossible to update

ALTER VIEW viewCompanies5 RENAME TO viewCompaniesAll;
    
SELECT * FROM viewCompaniesAll;



CREATE VIEW viewUnivs5
   AS SELECT name, rating, scholarships FROM universities
       WHERE rating >= 3 AND rating <= 100
         OFFSET 3;
      
UPDATE viewUnivs5 
 SET rating = 1000
   WHERE name = 'KBTU';

--error because we have offset => impossible to update - unupdatable view

SELECT * FROM viewUnivs5;


CREATE VIEW viewSubjects5
   AS SELECT name, credits, prerequisite FROM subjects
       WHERE credits = 3;
      
UPDATE viewSubjects5 
 SET name = 'Globalisation and Politics'
   WHERE name = 'Globalisation';

SELECT * FROM viewSubjects5;

-------------- 6 -----------------

CREATE VIEW viewUniv2
 AS SELECT name, scholarships FROM universities
   WHERE location = 'USA';

INSERT INTO viewUniv2 VALUES('Yale', true);

UPDATE viewUniv2
   SET name = 'bad'
     WHERE scholarships IS false;

SELECT * FROM viewUniv2;


CREATE VIEW viewSubjects2
 AS SELECT name, prerequisite FROM subjects
   WHERE important IS true;
    
INSERT INTO viewSubjects2 VALUES('Computer vision', NULL);

UPDATE viewSubjects2
 SET prerequisite = 'PP2'
   WHERE name = 'Computer vision';
    
SELECT * FROM viewSubjects2;


CREATE VIEW viewCompanies2
 AS SELECT name, applications, international FROM companies
   WHERE international IS false;
    
INSERT INTO viewCompanies2 VALUES('Rakhmet', 12300, false);
-- employees in null then error because we have constraint
UPDATE viewCompanies2
 SET applications = 9000
   WHERE name = 'Rakhmet';
    
SELECT * FROM viewCompanies2;


