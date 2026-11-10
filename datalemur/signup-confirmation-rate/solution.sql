--SELECT ROUND((1.0*SUM(IF(T.signup_action='Confirmed',1,0))/COUNT(*)),2) FROM
--(SELECT t1.user_id, t1.email_id, t2.signup_action FROM 
--emails t1 LEFT JOIN (SELECT * FROM texts WHERE signup_action='Confirmed') t2 
--ON t1.email_id=t2.email_id ORDER BY t1.user_id ASC) T;

SELECT
ROUND(1.0*SUM(CASE WHEN T.signup_action = 'Confirmed' THEN 1 ELSE 0 END)/COUNT(*),2)
FROM 
(SELECT t1.user_id, t1.email_id, t2.signup_action
FROM emails t1 LEFT JOIN (SELECT * FROM texts WHERE signup_action='Confirmed') t2 
ON t1.email_id = t2.email_id ORDER BY t1.user_id ASC) T;
