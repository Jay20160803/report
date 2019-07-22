

USE access_controll;

GO
CREATE PROCEDURE dbo.dailyRepo
AS

	DECLARE @day datetime
	SET @day = GETDATE()
	BEGIN
		
		SELECT 
		sc.staff_no,
		sc.staff_name,
		d.dept_code,
		d.dept_name,
		CONVERT(VARCHAR(10),@day,120) checkInTime,
		case   datepart(dw,@day) 
		when   1   then   '日 ' 
		when   2   then   '一 ' 
		when   3   then   '二 ' 
		when   4   then   '三 ' 
		when   5   then   '四 ' 
		when   6   then   '五 ' 
		when   7   then   '六 ' 
		end weekDay,
		sc.start_time,
		sc.end_time,
		sc.start_entry_time,
		sc.end_entry_time,
		sc.entry_times,
		sc.should_work_time,
		DATEDIFF(mi,sc.start_entry_time,sc.end_entry_time)actual_work_time

		FROM att_schedule_class  sc
		LEFT JOIN sys_department d ON d.id = sc.dept_id
		WHERE 
		datediff(day,sc.start_time,@day) = 0
		AND d.is_enable = 1

	END
GO

exec dbo.dailyRepo;


CREATE TABLE att_schedule_class(
id nvarchar(50) primary key,
unit_type nvarchar(1)NOT NULL,
class_type nvarchar(1)NOT NULL,
staff_id nvarchar(20)NOT NULL,
staff_no nvarchar(20)NOT NULL,
staff_name nvarchar(50)NOT NULL,
dept_id nvarchar(50)NOT NULL,
start_entry_time datetime NULL,
end_entry_time datetime NULL,
entry_times tinyint default 0 NOT NULL,
should_work_time smallint default 0 NOT NULL,
start_time datetime NOT NULL,
end_time datetime NOT NULL,
create_time datetime NULL,
update_time datetime NULL

)

ALTER table att_schedule_class add dept_id nvarchar(50)NOT NULL