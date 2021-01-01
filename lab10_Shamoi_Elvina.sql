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

---------- 1 ------------

create or replace function bestRating()
returns integer
as $$
    begin
        return min(rating) from universities;
    end;$$
language plpgsql;

drop function bestRating();

select * from bestRating();
select name, bestRating() from universities where rating = bestRating();


---------- 2 ------------

create or replace function showCompanies()
returns text
as $$
    begin
        return upper(name) from companies where char_length(name) <= 4;
    end;$$
language plpgsql;

drop function showCompanies();

select * from showCompanies();

---------- 3 -------------

create or replace function showInfo(in newCredits integer)
returns table(name varchar, creds integer)
as $$
    begin
        return query select subjects.name, credits + newCredits from subjects;
    end;$$
language plpgsql;

drop function showInfo(integer);

select * from showInfo(2);

---------- 4 -------------

create or replace function addSubject(name varchar, credits int, important boolean, prerequisite varchar)
returns void as $$
    begin
        insert into subjects values (name, credits, important, prerequisite);
    end;$$
language plpgsql;

select * from addSubject('Android dev', 3, true, 'OOP');

select * from subjects;


--------- 5 ----------

create or replace function showCompanyInfo(in newApplications integer)
returns table(name varchar, applications int, international boolean, employees int)
as $$
    begin
        return query select companies.name, companies.applications + newApplications, companies.international,
                            companies.employees from companies;
    end;$$
language plpgsql;

drop function showCompanyInfo(integer);

select * from showCompanyInfo(800);

---------- 6 ----------

create or replace function getAvgAndReverse
    (txt varchar, variadic nums integer[],
     out average integer, out txtRev varchar)
as $$
    begin
        select into average avg(nums[i])
        from generate_subscripts(nums, 1) f(i);

        txtRev = reverse(txt);
    end;$$
language plpgsql;

drop function getAvgAndReverse(txt varchar, nums NUMERIC[]);

select * from getAvgAndReverse('hello', 10, 20, 30, 40, 50, 1090, 1, 1231);


----------- 7 ----------
create function NthPowerOf2(
  inout pow numeric
) as $$
begin
  pow := power(2, pow);
end ;
$$ language plpgsql;

SELECT NthPowerOf2(3);


create or replace function getSquareRoot(
  inout num numeric
) as $$
begin
  num := power(num, 0.5);
end ;
$$ language plpgsql;

SELECT getSquareRoot(16);
