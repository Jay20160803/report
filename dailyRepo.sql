

SELECT * ,CONCAT(CONVERT(VARCHAR(5),start_time,108),'-',CONVERT(VARCHAR(5),end_time,108)) start_end_worktime FROM att_schedule_class_daily;

