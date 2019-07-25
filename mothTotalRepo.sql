


SELECT 
md.staff_id,
md.staff_no,
md.staff_name,
md.dept_code,
md.dept_name,
tmp.*
FROM 
att_month_detail_repo md

LEFT JOIN
(
SELECT
sd.staff_id,
SUM(should_work_time)should_work_time_total,	--出勤应该(时)
SUM(actual_work_time)actual_work_time_totlal,	--出勤实际(时)
CEILING(SUM(should_work_time)/8)should_work_day_total,	--出勤应该(日)
CEILING(SUM(actual_work_time)/8)actual_work_day_totlal,	--出清实际(日)
SUM(lateTime)lateTime_total,					--迟到时长（分）
SUM(lateTimes)lateTimes_total,					--迟到（次数）
SUM(leaveEarlyTime)leaveEarlyTime_total,		--早退时长（分）
SUM(leaveEarlyTimes)leaveEarlyTimes_total,		--早退（次数）
SUM(work_day_overtime) work_day_overtime_total,			--平时加班
SUM(day_off_overtime) day_off_overtime_total,				--休息日加班
SUM(holiday_overtime) holiday_overtime_total,			--假日加班
(SUM(work_day_overtime)+SUM(day_off_overtime)+SUM(holiday_overtime))  total_overtime,					--加班合计
SUM(leaveTime)leaveTime_total,					--请假（时）
SUM(businessTime)businessTime_total,			--出差（时）
SUM(outTime)outTime_total,						--外出（时）
CEILING(SUM(leaveTime)/8) leave_day,				--请假（日）
CEILING(SUM(businessTime)/8) business_day,			--出差（日）
CEILING(SUM(outTime)/8) out_day 					--外出（日）
FROM
att_schedule_class_daily sd

GROUP BY sd.staff_id

) tmp ON tmp.staff_id = md.staff_id




