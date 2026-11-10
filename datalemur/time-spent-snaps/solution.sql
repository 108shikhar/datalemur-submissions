SELECT age.age_bucket,
ROUND(100.0*(SUM(IF(age.activity_type="send",age.time_spent,0))/SUM(age.time_spent)),2) AS 'send_perc',
ROUND(100.0*(SUM(IF(age.activity_type="open",age.time_spent,0))/SUM(age.time_spent)),2) AS 'open_perc'
FROM
(SELECT t1.user_id, t1.activity_type, t1.time_spent, t2.age_bucket
FROM activities t1 INNER JOIN age_breakdown t2 ON t1.user_id=t2.user_id
WHERE activity_type="open" OR activity_type="send" 
ORDER BY t2.age_bucket ASC, t2.user_id ASC) age
GROUP BY age.age_bucket;
