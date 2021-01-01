

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

------------ 2 ----------------

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

----------- 3 ------------

CREATE INDEX rating_index ON universities (rating DESC NULLS FIRST);
CREATE INDEX credits_index on subjects(credits);
CREATE INDEX appl_index on companies(applications DESC NULLS LAST);

----------- 4 ------------

CREATE UNIQUE INDEX rating_unique_index on universities(rating);
CREATE UNIQUE INDEX employees_unique_index on companies(employees);
CREATE UNIQUE INDEX applications_unique_index on companies(applications);

----------- 5 ------------
CREATE INDEX CONCURRENTLY rating_conc_index on universities(rating);
CREATE INDEX CONCURRENTLY employees_conc_index on companies(employees);




