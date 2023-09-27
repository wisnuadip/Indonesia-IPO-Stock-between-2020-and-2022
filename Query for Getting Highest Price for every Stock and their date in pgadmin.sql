WITH first_step AS(
SELECT a.code,a.date,a.high
FROM stock a
JOIN (
SELECT code,MAX(high) AS high
FROM stock GROUP BY code)
AS b
ON a.code = b.code AND a.high = b.high)
--Getting Clean Series--
SELECT code, MIN(date) min_date,high max_high
FROM first_step
GROUP BY code,high