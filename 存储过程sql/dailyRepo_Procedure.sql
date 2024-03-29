USE [access_controll]
GO
/****** Object:  StoredProcedure [dbo].[dailyRepo]    Script Date: 2019/9/21 11:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[dailyRepo]  
(@day datetime )

AS

	IF (@day IS NULL)
	BEGIN
		SELECT @day = GETDATE()
	END

	BEGIN
	INSERT INTO att_schedule_class_daily 
	
	SELECT 
	tem.*,

	CASE
	WHEN tem.leaveTime > 0 THEN  '请假'
	WHEN tem.outTime > 0 THEN  '外出'
	WHEN tem.businessTime > 0 THEN  '出差'
	WHEN tem.lateTime > 0 THEN '迟到'
	WHEN tem.leaveEarlyTime > 0 THEN '早退'
	WHEN tem.abnormalTime > 0 THEN '异常'
	WHEN tem.start_entry_time IS NULL AND tem.end_entry_time IS NULL THEN  '未-未'
	WHEN tem.start_entry_time IS NULL  THEN  '上未'
	WHEN tem.end_entry_time IS NULL THEN  '下未'
	ELSE '正常' END
	scheduleStatus	
	
	FROM
	(
	SELECT 
	sc.id,
	sc.staff_id,
	sc.staff_no,
	sc.staff_name,
	d.dept_code,
	d.dept_name,
	CONVERT(VARCHAR(10),@day,120) checkInTime,

	CASE DATEPART(dw,@day) 
	WHEN   1   THEN   '日 ' 
	WHEN   2   THEN   '一 ' 
	WHEN   3   THEN   '二 ' 
	WHEN   4   THEN   '三 ' 
	WHEN   5   THEN   '四 ' 
	WHEN   6   THEN   '五 ' 
	WHEN   7   THEN   '六 ' 
	END weekDay,

	sc.start_time,
	sc.end_time,
	sc.start_entry_time,
	sc.end_entry_time,
	sc.entry_times,
	sc.should_work_time,
	
	CASE
	WHEN sc.start_entry_time IS NULL OR sc.end_entry_time IS NULL THEN 0
	ELSE DATEDIFF(mi,sc.start_entry_time,sc.end_entry_time) - 60 END actual_work_time,

	CASE
	WHEN ab.start_time IS NOT NULL AND ab.end_time IS NOT NULL 
	THEN 
		CASE 
		WHEN ab.overtime_type = '0'
		THEN DATEDIFF(mi,ab.start_time,ab.end_time)
		ELSE 0 END
	ELSE 0 END work_day_overtime,

	CASE
	WHEN ab.start_time IS NOT NULL AND ab.end_time IS NOT NULL 
	THEN 
		CASE 
		WHEN ab.overtime_type = '1'
		THEN DATEDIFF(mi,ab.start_time,ab.end_time)
		ELSE 0 END
	ELSE 0 END day_off_overtime,

	CASE
	WHEN ab.start_time IS NOT NULL AND ab.end_time IS NOT NULL 
	THEN 
		CASE 
		WHEN ab.overtime_type = '2'
		THEN DATEDIFF(mi,ab.start_time,ab.end_time)
		ELSE 0 END
	ELSE 0 END holiday_overtime,
		
  /**
	迟到计算:
	班次类型,= 1，(弹性班次)，结果为0
	班次类型 = 0，（规律班次） 根据上班时间和打卡时间计算
	*/
	CASE
	WHEN  sc.class_type = 1 OR  sc.start_time IS NULL OR sc.start_entry_time IS NULL THEN 0
	WHEN DATEDIFF(mi,sc.start_time,sc.start_entry_time) > 0 THEN 1
	ELSE 0 END lateTimes,

	CASE
	WHEN  sc.class_type = 1 OR sc.start_time IS NULL OR sc.start_entry_time IS NULL THEN 0
	WHEN DATEDIFF(mi,sc.start_time,sc.start_entry_time) > 0 THEN DATEDIFF(mi,sc.start_time,sc.start_entry_time)
	ELSE 0 END lateTime,

	/**
	早退计算：
		与迟到计算一样
	*/
	CASE
	WHEN sc.class_type = 1 OR sc.end_entry_time IS NULL OR sc.end_time IS NULL THEN 0
	WHEN DATEDIFF(mi,sc.end_entry_time,sc.end_time) > 0 THEN 1
	ELSE 0 END leaveEarlyTimes,

	CASE
	WHEN sc.class_type = 1 OR sc.end_entry_time IS NULL OR sc.end_time IS NULL THEN 0
	WHEN DATEDIFF(mi,sc.end_entry_time,sc.end_time) > 0 THEN DATEDIFF(mi,sc.end_entry_time,sc.end_time)
	ELSE 0 END leaveEarlyTime,

	/**
	 异常计算（弹性班次下，未满应该上班的时间为异常）：
	 abnormalTimes: 异常次数（因为此处统计的是一天的数据，值为1或0）
	 abnormalTime: 异常时间(应该上班时间大于实际上班时间部分,扣除中午60分钟)
	*/
	CASE
	WHEN sc.class_type = 0 OR sc.end_entry_time IS NULL OR sc.start_entry_time IS NULL THEN 0
	WHEN (sc.should_work_time - DATEDIFF(mi,sc.start_entry_time,sc.end_entry_time) + 60 ) > 0 THEN 1
	ELSE 0 END abnormalTimes,

	CASE
	WHEN sc.class_type = 0 OR sc.end_entry_time IS NULL OR sc.start_entry_time IS NULL THEN 0
	WHEN (sc.should_work_time - DATEDIFF(mi,sc.start_entry_time,sc.end_entry_time) + 60) > 0 
		THEN (sc.should_work_time - DATEDIFF(mi,sc.start_entry_time,sc.end_entry_time) + 60)
	ELSE 0 END abnormalTime,

	CASE
	WHEN lb.start_time IS NULL OR lb.end_time IS NULL THEN 0
	ELSE 
		CASE 
		WHEN DATEDIFF(mi,sc.start_time,lb.end_time)   > 8 THEN 8
		ELSE DATEDIFF(mi,sc.start_time,lb.end_time)  END
	END leaveTime,
		
	CASE 
	WHEN bb.start_time IS NULL OR bb.end_time IS NULL THEN 0
	ELSE 
		CASE 
		WHEN DATEDIFF(mi,sc.start_time,bb.end_time)  > 8 THEN 8
		ELSE DATEDIFF(mi,sc.start_time,bb.end_time) END
	END outTime,
		
	CASE
	WHEN ob.start_time IS NULL OR ob.end_time IS NULL THEN 0
	ELSE 
		CASE 
		WHEN DATEDIFF(mi,sc.start_time,ob.end_time)  > 8 THEN 8
		ELSE DATEDIFF(mi,sc.start_time,ob.end_time) END
	END businessTime,
	sc.class_no,
	sc.class_name
		
	FROM att_schedule_class  sc
	LEFT JOIN sys_department d ON d.id = sc.dept_id
	LEFT JOIN att_overtime_bill ab ON sc.staff_id = ab.staff_id AND	(@day BETWEEN CONVERT(VARCHAR(10),ab.start_time,120)  AND  CONVERT(VARCHAR(10),ab.end_time,120) )
	LEFT JOIN att_leave_bill lb ON sc.staff_id = lb.staff_id AND (@day BETWEEN CONVERT(VARCHAR(10),lb.start_time,120) AND  CONVERT(VARCHAR(10),lb.end_time,120))
	LEFT JOIN att_business_bill bb ON sc.staff_id = bb.staff_id AND (@day BETWEEN CONVERT(VARCHAR(10),bb.start_time,120) AND  CONVERT(VARCHAR(10),bb.end_time,120))
	LEFT JOIN att_out_bill ob ON sc.staff_id = ob.staff_id  AND  (@day BETWEEN CONVERT(VARCHAR(10),ob.start_time,120) AND  CONVERT(VARCHAR(10),ob.end_time,120) )
	WHERE 
	datediff(day,sc.start_time,@day) = 0
	AND d.is_enable = 1
	) tem
		

	END

