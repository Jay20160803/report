
CREATE PROCEDURE createMonthDetailRepo
@DateParam DATE	--时间

AS

DECLARE 
@SDate DATE, --月第一天
@EDate DATE, --月最后一天
@sql NVARCHAR(1000),
@backsql NVARCHAR(1000)

BEGIN
	IF (@DateParam IS NULL)
	BEGIN
		SET @DateParam=  GETDATE()
	END

	SET @SDate = (SELECT CONVERT(char(8),@DateParam,120)+'1')  
	SET @EDate = (SELECT DATEADD(Day,-1,CONVERT(char(8),DATEADD(Month,1,@DateParam),120)+'1'))
	WHILE @SDate <= @EDate
	BEGIN

		SET @sql= ISNULL(@sql,'')+'''       '''+'  as '''+CONVERT(VARCHAR(100),@SDate, 23)+''''+','
		SET @SDate=DATEADD(DAY, 1, @SDate)
	
	END
	SET @sql = SUBSTRING(@sql,1,LEN(@sql)-1)
	SET @sql = 'SELECT DISTINCT staff_no,staff_name,dept_code,dept_name,'+ @sql + 'INTO att_month_detail_repo FROM att_schedule_class_daily'

	--备份月数据
	SET @backsql = 'SELECT * INTO '+ 'att_month_detail_repo_' + CONVERT(char(7),@DateParam,120)+ 'FROM att_month_detail_repo'
	EXECUTE(@backsql)
	
	--删除月明细表
	drop table att_month_detail_repo 

	--生成最新的月数据表
	EXECUTE(@Sql)
END

exec createMonthDetailRepo null
select * from att_month_detail_repo



