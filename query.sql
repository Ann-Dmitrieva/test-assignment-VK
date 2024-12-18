WITH t1 AS (
SELECT
	userId, YEAR(time) year, WEEK(time) week,
	IF(eventName = 'register', 1, 0) registration,
	IF(eventName = 'download', 1, 0) downloads
FROM 
	table
),

t2 AS (
SELECT 
	t1.year, t1.week,
	t1.userId, SUM(t1.registration) registration,
	SUM(t1.downloads) totalDownloads
FROM
	t1
GROUP BY 
	t1.year, t1.week, t1.userId
)

SELECT 
	CONCAT(t2.year, 'год, ', t2.week, ' неделя') week,
	SUM(t2.registration) users,
	CASE 
		WHEN SUM(t2.registration) = 0 THEN 0
		ELSE ROUND((SUM(t2.totalDownloads) / SUM(t2.registration)), 2)
	END AS CR
FROM 
	t2
WHERE
	t2.registration = 1 AND t2.totalDownloads > 0
GROUP BY 
	t2.year, t2.week