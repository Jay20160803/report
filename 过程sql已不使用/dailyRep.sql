

/**人员排班*/
SELECT s.id staff_id,s.staff_name ,d.id dept_id,d.dept_name,sc.start_time,sc.end_time,c.class_name,c.start_work_time
,c.end_work_time,
CONCAT(
	CASE
		WHEN  (SELECT MIN(entry_time) startTime FROM ag_entry_record WHERE staff_id = 1 AND entry_time >  CONVERT(VARCHAR(10),sc.start_time,111)  and entry_time < CONVERT(VARCHAR(10),DATEADD(day,1,sc.start_time),111)) <=sc.start_time THEN '上午'
		ELSE CONVERT(VARCHAR(5),(SELECT MIN(entry_time) startTime FROM ag_entry_record WHERE staff_id = 1 AND entry_time > CONVERT(VARCHAR(10),sc.start_time,111)  and entry_time < CONVERT(VARCHAR(10),DATEADD(day,1,sc.start_time),111)),108) END
,
'-'
,
CASE
		WHEN  (SELECT MAX(entry_time) startTime FROM ag_entry_record WHERE staff_id = 1 AND entry_time >  CONVERT(VARCHAR(10),sc.start_time,111)  and entry_time < CONVERT(VARCHAR(10),DATEADD(day,1,sc.start_time),111)) >=sc.end_time THEN '下午'
		ELSE CONVERT(VARCHAR(5),(SELECT MAX(entry_time) startTime FROM ag_entry_record WHERE staff_id = 1 AND entry_time > CONVERT(VARCHAR(10),sc.start_time,111)  and entry_time < CONVERT(VARCHAR(10),DATEADD(day,1,sc.start_time),111)),108) END

)打卡数据,
(SELECT COUNT(1) FROM ag_entry_record WHERE staff_id = s.id AND entry_time > CONVERT(VARCHAR(10),sc.start_time,111)  and entry_time < CONVERT(VARCHAR(10),DATEADD(day,1,sc.start_time),111)) 打卡次数,

c.should_work_time  应该出勤,
DATEDIFF
(mi,
(SELECT MIN(entry_time) startTime FROM ag_entry_record WHERE staff_id = 1 AND entry_time >  CONVERT(VARCHAR(10),sc.start_time,111)  and entry_time < CONVERT(VARCHAR(10),DATEADD(day,1,sc.start_time),111)),
(SELECT MAX(entry_time) startTime FROM ag_entry_record WHERE staff_id = 1 AND entry_time >  CONVERT(VARCHAR(10),sc.start_time,111)  and entry_time < CONVERT(VARCHAR(10),DATEADD(day,1,sc.start_time),111))
) - 60 实际出勤,
CASE
WHEN(
DATEDIFF
(mi,
sc.end_time,
(SELECT MAX(entry_time) startTime FROM ag_entry_record WHERE staff_id = 1 AND entry_time >  CONVERT(VARCHAR(10),sc.start_time,111)  and entry_time < CONVERT(VARCHAR(10),DATEADD(day,1,sc.start_time),111))
)) > 0
THEN
(
DATEDIFF
(mi,
sc.end_time,
(SELECT MAX(entry_time) startTime FROM ag_entry_record WHERE staff_id = 1 AND entry_time >  CONVERT(VARCHAR(10),sc.start_time,111)  and entry_time < CONVERT(VARCHAR(10),DATEADD(day,1,sc.start_time),111))
))
ELSE 0 END
加班,
DATEDIFF
(mi,
sc.start_time,
(SELECT MIN(entry_time) startTime FROM ag_entry_record WHERE staff_id = 1 AND entry_time >  CONVERT(VARCHAR(10),sc.start_time,111)  and entry_time < CONVERT(VARCHAR(10),DATEADD(day,1,sc.start_time),111))
) 迟到,

CASE
WHEN(
DATEDIFF
(mi,
(SELECT MAX(entry_time) startTime FROM ag_entry_record WHERE staff_id = 1 AND entry_time >  CONVERT(VARCHAR(10),sc.start_time,111)  and entry_time < CONVERT(VARCHAR(10),DATEADD(day,1,sc.start_time),111)),
sc.end_time
)) > 0 
THEN
(
DATEDIFF
(mi,
(SELECT MAX(entry_time) startTime FROM ag_entry_record WHERE staff_id = 1 AND entry_time >  CONVERT(VARCHAR(10),sc.start_time,111)  and entry_time < CONVERT(VARCHAR(10),DATEADD(day,1,sc.start_time),111)),
sc.end_time
)) 
ELSE 0 END 早退
FROM
	sys_staff s
	LEFT JOIN sys_department d ON d.id = s.dept_id
	LEFT JOIN att_staff_class sc ON s.id = sc.staff_id
	LEFT JOIN att_class c ON sc.class_id = c.id
WHERE
	s.is_enable = 1 and d.is_enable = 1
	and  s.id = 1;

	


