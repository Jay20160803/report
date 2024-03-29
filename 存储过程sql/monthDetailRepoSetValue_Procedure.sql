USE [access_controll]
GO
/****** Object:  StoredProcedure [dbo].[monthDetailRepoSetValue]    Script Date: 2019/7/25 0:27:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[monthDetailRepoSetValue]
@DateParam DATE 

AS
DECLARE 
@SSql NVARCHAR(1000),--结果
@SDate DATE, --开始日期
@EDate DATE, --结束日期
@FDate VARCHAR(100), --赋值用
@FValue VARCHAR(100), --状态
@FStaffId VARCHAR(100) --游标标量

IF (@DateParam IS NULL)
BEGIN
	SET @DateParam=  GETDATE()
END


BEGIN
	DECLARE X001 CURSOR FOR
	SELECT staff_id FROM att_month_detail_repo
	OPEN X001 

	FETCH NEXT FROM X001 INTO @FStaffId 
	WHILE @@FETCH_STATUS = 0
	BEGIN

		SET @SDate = (SELECT CONVERT(char(8),@DateParam,120)+'1') 
		SET @EDate = (SELECT DATEADD(Day,-1,CONVERT(char(8),DATEADD(Month,1,@DateParam),120)+'1'))
		SET @FValue=''
		SET @SSql=''
	
		--循环查询赋值
		WHILE @SDate<=@EDate
		BEGIN

			print @FStaffId
			print @SDate

			SELECT @FValue=scheduleStatus FROM  att_schedule_class_daily WHERE checkInTime = @SDate AND staff_id = @FStaffId
		
			SET @FDate='['+CONVERT(VARCHAR(100),@SDate, 23)+']'
			print @FDate
			SET @SSql='UPDATE att_month_detail_repo SET '+@FDate+'='+''''+@FValue+''''+' WHERE staff_id='+''''+@FStaffId+''''
			
			print @SSql
			EXECUTE(@SSql)
			SET @FValue=''
			SET @SDate=DATEADD(DAY, 1, @SDate)

		END

		FETCH NEXT FROM X001 INTO @FStaffId
	END

	CLOSE X001
	DEALLOCATE X001

END

