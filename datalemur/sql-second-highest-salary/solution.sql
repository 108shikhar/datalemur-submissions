SELECT DISTINCT(t1.salary) AS 'second_highest_salary' FROM
(SELECT *, DENSE_RANK() OVER(ORDER BY salary DESC) AS 'rank' FROM employee)t1
WHERE t1.rank=2;
