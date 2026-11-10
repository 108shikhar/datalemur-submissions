SELECT T.department_name, T.name, T.salary FROM
(SELECT t2.department_name, t1.name, t1.salary,
DENSE_RANK() OVER(PARTITION BY t2.department_name ORDER BY t1.salary DESC) AS ranking
FROM employee t1 INNER JOIN department t2 ON t1.department_id=t2.department_id) T
WHERE T.ranking<=3
ORDER BY T.department_name ASC, T.salary DESC, T.name ASC;
