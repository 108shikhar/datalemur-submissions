SELECT t2.category, t2.product, t2.total_spend FROM
(SELECT t1.category, t1.product, t1.total_spend,
RANK() OVER(PARTITION BY t1.category ORDER BY t1.total_spend DESC) AS 'rank' FROM
(SELECT *, SUM(spend) AS 'total_spend'FROM product_spend
WHERE transaction_date >= '2022-01-01' AND transaction_date <= '2022-12-31'
GROUP BY product ORDER BY category ASC, total_spend DESC) t1) t2
WHERE t2.rank<=2;
