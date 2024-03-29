USE [access_controll]
GO
/****** Object:  StoredProcedure [dbo].[createMonthDetailRepo]    Script Date: 2019/7/25 0:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[createMonthDetailRepo]
@DateParam DATE	--时间

AS

DECLARE 
@SDate DATE, --月第一天
@EDate DATE, --月最后一天
@sql NVARCHAR(1000),
@backsql NVARCHAR(1000),
@deleteBackTable NVARCHAR(50)

IF (@DateParam IS NULL)
BEGIN
	SET @DateParam=  GETDATE()
END

SET @SDate = (SELECT CONVERT(char(8),@DateParam,120)+'1')  
SET @EDate = (SELECT DATEADD(Day,-1,CONVERT(char(8),DATEADD(Month,1,@DateParam),120)+'1'))
SET @backsql = 'SELECT * INTO '+ 'att_month_detail_repo_' + REPLACE(CONVERT(char(7),@DateParam,120),'-','_')+ ' FROM att_month_detail_repo'
SET @deleteBackTable = 'DROP TABLE  att_month_detail_repo_' + REPLACE(CONVERT(char(7),@DateParam,120),'-','_')
BEGIN
	
	WHILE @SDate <= @EDate
	BEGIN

		SET @sql= ISNULL(@sql,'')+'''       '''+'  as '''+CONVERT(VARCHAR(100),@SDate, 23)+''''+','
		SET @SDate=DATEADD(DAY, 1, @SDate)
	
	END
	SET @sql = SUBSTRING(@sql,1,LEN(@sql)-1)
	SET @sql = 'SELECT DISTINCT staff_id,staff_no,staff_name,dept_code,dept_name,'+ @sql + 'INTO att_month_detail_repo FROM att_schedule_class_daily'

	--删除月备份表
	IF OBJECT_ID(N'att_month_detail_repo_' + REPLACE(CONVERT(char(7),@DateParam,120),'-','_'),N'U') is not null
	BEGIN
		EXECUTE(@deleteBackTable)
	END
	

	--备份月数据
	IF OBJECT_ID(N'att_month_detail_repo',N'U') is not null
	BEGIN
		EXECUTE(@backsql)
	END

	--删除月明细表
	IF OBJECT_ID(N'att_month_detail_repo',N'U') is not null
	BEGIN
		drop table att_month_detail_repo 
	END

	--生成最新的月数据表
	EXECUTE(@Sql)

	--更新月明细数据
	exec [monthDetailRepoSetValue] @DateParam
END



