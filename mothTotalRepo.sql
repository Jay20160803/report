


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
SUM(should_work_time)should_work_time_total,	--����Ӧ��(ʱ)
SUM(actual_work_time)actual_work_time_totlal,	--����ʵ��(ʱ)
CEILING(SUM(should_work_time)/8)should_work_day_total,	--����Ӧ��(��)
CEILING(SUM(actual_work_time)/8)actual_work_day_totlal,	--����ʵ��(��)
SUM(lateTime)lateTime_total,					--�ٵ�ʱ�����֣�
SUM(lateTimes)lateTimes_total,					--�ٵ���������
SUM(leaveEarlyTime)leaveEarlyTime_total,		--����ʱ�����֣�
SUM(leaveEarlyTimes)leaveEarlyTimes_total,		--���ˣ�������
SUM(work_day_overtime) work_day_overtime_total,			--ƽʱ�Ӱ�
SUM(day_off_overtime) day_off_overtime_total,				--��Ϣ�ռӰ�
SUM(holiday_overtime) holiday_overtime_total,			--���ռӰ�
(SUM(work_day_overtime)+SUM(day_off_overtime)+SUM(holiday_overtime))  total_overtime,					--�Ӱ�ϼ�
SUM(leaveTime)leaveTime_total,					--��٣�ʱ��
SUM(businessTime)businessTime_total,			--���ʱ��
SUM(outTime)outTime_total,						--�����ʱ��
CEILING(SUM(leaveTime)/8) leave_day,				--��٣��գ�
CEILING(SUM(businessTime)/8) business_day,			--����գ�
CEILING(SUM(outTime)/8) out_day 					--������գ�
FROM
att_schedule_class_daily sd

GROUP BY sd.staff_id

) tmp ON tmp.staff_id = md.staff_id




