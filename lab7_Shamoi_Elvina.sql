create database lab7;

create table table_c (ID int primary key, NAME varchar (100));
create table table_d (ID int primary key, NAME varchar (100));

insert into table_c values (1,'Apple');
insert into table_c values (2,'Orange');
insert into table_c values (3,'Banana');
insert into table_c values (4,'Cucumber');
insert into table_c values (5,'Onion');
insert into table_c values (6,'Broccoli');
insert into table_c values (7,'Mushroom');

insert into table_d values (1,'Orange');
insert into table_d values (2,'Apple');
insert into table_d values (3,'Watermelon');
insert into table_d values (4,'Pear');
insert into table_d values (5,'Onion');
insert into table_d values (7,'Mushroom');
insert into table_d values (8,'Tomato');

SELECT * FROM table_c;
SELECT * FROM table_d;

----------  1  ----------
SELECT * FROM table_c INNER JOIN table_d ON table_c.id = table_d.id;

----------  2  ----------
SELECT * FROM table_c LEFT OUTER JOIN table_d ON table_c.name = table_d.name;

----------  3  ----------
SELECT * FROM table_c LEFT OUTER JOIN table_d ON table_c.name = table_d.name WHERE table_d.name IS NULL;

----------  4  ----------
SELECT * FROM table_c FULL OUTER JOIN table_d ON table_c.name = table_d.name;

----------  5  ----------
SELECT * FROM table_c FULL OUTER JOIN table_d ON table_c.name = table_d.name WHERE table_d.name IS NULL OR table_c.name IS NULL;

----------  6  ----------
SELECT * FROM table_c INNER JOIN table_d ON table_c.name = table_d.name;

----------  7  ----------
SELECT * FROM table_c INNER JOIN table_d ON table_c.name = table_d.name AND table_c.id = table_d.id;

----------  8  ----------
SELECT * FROM table_c CROSS JOIN table_d;

----------  9  ----------
SELECT * FROM table_c RIGHT OUTER JOIN table_d ON table_c.name = table_d.name;

