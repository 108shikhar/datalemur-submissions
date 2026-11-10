SELECT t1.user_id, t1.spend, t1.transaction_date FROM
(SELECT *, RANK() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS 'num' 
FROM transactions) t1
WHERE t1.num=3;
