
SELECT md.* ,tmp*
FROM 
att_month_detail_repo md
LEFT JOIN
(
SELECT
staff_id,
SUM(should_work_time)should_work_time_total,	--Ӧ��(ʱ)
SUM(actual_work_time)actual_work_time_totlal,	--ʵ��(ʱ)
SUM(lateTimes)lateTimes_total,					--�ٵ���������
SUM(leaveEarlyTimes)leaveEarlyTimes_total,		--���ˣ�������
SUM(leaveTime)leaveTime_total,					--��٣�ʱ��
SUM(businessTime)businessTime_total,			--���ʱ��
SUM(outTime)outTime_total,						--�����ʱ��
CEILING(SUM(should_work_time)/8) should_work_day,  --Ӧ�ã��գ�
CEILING(SUM(actual_work_time)/8) actual_work_day,  --ʵ�ʣ��գ�
CEILING(SUM(leaveTime)/8) leave_day,				--��٣��գ�
CEILING(SUM(businessTime)/8) business_day,			--����գ�
CEILING(SUM(outTime)/8) out_day 					--������գ�
FROM
att_schedule_class_daily 
GROUP BY staff_id
)as tmp ON md.staff_id = tmp.staff_id
	

SELECT * FROM att_schedule_class_daily

SELECT * FROM att_month_detail_repo

select ceiling(0.1)