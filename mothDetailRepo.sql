
SELECT md.* ,tmp*
FROM 
att_month_detail_repo md
LEFT JOIN
(
SELECT
staff_id,
SUM(should_work_time)should_work_time_total,	--应该(时)
SUM(actual_work_time)actual_work_time_totlal,	--实际(时)
SUM(lateTimes)lateTimes_total,					--迟到（次数）
SUM(leaveEarlyTimes)leaveEarlyTimes_total,		--早退（次数）
SUM(leaveTime)leaveTime_total,					--请假（时）
SUM(businessTime)businessTime_total,			--出差（时）
SUM(outTime)outTime_total,						--外出（时）
CEILING(SUM(should_work_time)/8) should_work_day,  --应该（日）
CEILING(SUM(actual_work_time)/8) actual_work_day,  --实际（日）
CEILING(SUM(leaveTime)/8) leave_day,				--请假（日）
CEILING(SUM(businessTime)/8) business_day,			--出差（日）
CEILING(SUM(outTime)/8) out_day 					--外出（日）
FROM
att_schedule_class_daily 
GROUP BY staff_id
)as tmp ON md.staff_id = tmp.staff_id
	

SELECT * FROM att_schedule_class_daily

SELECT * FROM att_month_detail_repo

select ceiling(0.1)