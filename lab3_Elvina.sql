SELECT lastname FROM employees
    WHERE department > 15;

SELECT * FROM employees
    WHERE lastname = 'Rogers' OR lastname = 'Doe';

SELECT  sum(budget) FROM departments;

SELECT department, count(*) FROM employees GROUP BY department HAVING count(*) > 2;

SELECT name FROM departments
    GROUP BY name, budget
        HAVING max(budget) < (SELECT max(budget) FROM departments)
            ORDER BY budget DESC LIMIT 1;

SELECT name FROM employees WHERE  city = 'Almaty' or city = 'Atyrau'
UNION
SELECT name FROM customers WHERE  city = 'Almaty' or city = 'Atyrau';

SELECT name FROM departments WHERE budget < 150000
    ORDER BY code DESC, budget DESC ;

UPDATE departments SET budget = budget - (budget/10)
    WHERE budget = (SELECT budget FROM departments
        GROUP BY budget HAVING budget = min(budget) ORDER BY budget ASC LIMIT 1);

UPDATE employees SET department = 14 WHERE department = 77;

DELETE FROM employees WHERE department = 14;

DELETE FROM employees WHERE department = 77 or department = 59 or department = 37 or department = 14;

