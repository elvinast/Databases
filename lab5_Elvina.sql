CREATE TABLE warehouses (
  id INTEGER PRIMARY KEY,
  location VARCHAR(255) NOT NULL ,
  capacity INTEGER,
  address VARCHAR(400),
  contact_info VARCHAR(400)
);

CREATE TABLE boxes (
  code CHAR(4) not null,
  contents VARCHAR(255) NOT NULL ,
  value decimal not null,
  warehouse_id INTEGER NOT NULL,
  FOREIGN KEY (warehouse_id) REFERENCES warehouses(id)
);


INSERT INTO warehouses VALUES(1,'Chicago',3, '5th Avenue', '+1(945)11-11-11');
INSERT INTO warehouses VALUES(2,'Chicago',4, '5th Avenue', '');
INSERT INTO warehouses VALUES(3,'New York',7, '', '');
INSERT INTO warehouses VALUES(4,'Los Angeles',2, '1st street', '+1(900)00-00-00');
INSERT INTO warehouses VALUES(5,'San Franciso',8, 'Olympic stadium', '');
INSERT INTO warehouses VALUES(6,'California',10, '', '+1(900)00-00-00');
INSERT INTO warehouses VALUES(7,'Washington',4, '1st street', '+1(900)00-00-00');
INSERT INTO warehouses VALUES(8,'Miami',0, '', '');




INSERT INTO boxes VALUES('0MN7','Rocks',180, 3);
INSERT INTO boxes VALUES('4H8P','Rocks',250, 1);
INSERT INTO boxes VALUES('4RT3','Scissors',190, 4);
INSERT INTO boxes VALUES('7G3H','Rocks',200, 1);
INSERT INTO boxes VALUES('8JN6','Papers',75, 1);
INSERT INTO boxes VALUES('8Y6U','Papers',50, 3);
INSERT INTO boxes VALUES('9J6F','Papers',175, 2);
INSERT INTO boxes VALUES('LL08','Rocks',140, 4);
INSERT INTO boxes VALUES('P0H6','Scissors',125, 1);
INSERT INTO boxes VALUES('P2T6','Scissors',150, 2);
INSERT INTO boxes VALUES('TU55','Papers',90, 5);

---------- 2 -----------
SELECT UPPER(location), LOWER(location), char_length(location) FROM warehouses;

---------- 3 -----------
SELECT min(value), max(value), avg(value) FROM boxes
 WHERE contents = 'Rocks' or contents = 'Papers';

---------- 4 -----------
SELECT location from warehouses
 WHERE location LIKE '%ca%';
  
---------- 5 -----------
update warehouses set address= null where address = '';
update warehouses set contact_info= null where contact_info = '';

SELECT location , CASE
  WHEN address IS NULL  THEN contact_info
  ELSE address
    END AS "address"
    FROM warehouses;

---------- 6 -----------

SELECT location , CASE
  WHEN contact_info IS NULL AND address IS NULL  THEN 'there is neither address nor contact_info'
  WHEN address IS NULL THEN contact_info
  ELSE address
    END AS "address"
    FROM warehouses;


