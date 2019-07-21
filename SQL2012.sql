/*
Navicat SQL Server Data Transfer

Source Server         : HEYUPENG-PC
Source Server Version : 105000
Source Host           : HEYUPENG-PC:1433
Source Database       : access_control
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 105000
File Encoding         : 65001

Date: 2019-05-07 18:05:07
*/


-- ----------------------------
-- Table structure for ag_alarm_event
-- ----------------------------
DROP TABLE [dbo].[ag_alarm_event]
GO
CREATE TABLE [dbo].[ag_alarm_event] (
[id] int identity(1,1)  primary key, -- 主键
[event_code] int NOT NULL unique, -- 事件编号
[event_describe] nvarchar(20) NOT NULL , -- 事件描述
[is_enable] tinyint default 0  -- 0不报警 1报警
)

-- ----------------------------
-- Records of ag_alarm_event
-- ----------------------------
--允许将显式值插入表的标识列中 ON-允许  OFF-不允许
set identity_insert [dbo].[ag_alarm_event] ON
GO
GO
INSERT INTO [dbo].[ag_alarm_event] ([id], [event_code], [event_describe], [is_enable]) VALUES (N'1', N'128', N'消防报警', N'1')
GO
GO
INSERT INTO [dbo].[ag_alarm_event] ([id], [event_code], [event_describe], [is_enable]) VALUES (N'2', N'129', N'取消消防', N'0')
GO
GO
INSERT INTO [dbo].[ag_alarm_event] ([id], [event_code], [event_describe], [is_enable]) VALUES (N'3', N'130', N'强行闯入', N'1')
GO
GO
INSERT INTO [dbo].[ag_alarm_event] ([id], [event_code], [event_describe], [is_enable]) VALUES (N'4', N'131', N'门磁超时', N'1')
GO
GO
INSERT INTO [dbo].[ag_alarm_event] ([id], [event_code], [event_describe], [is_enable]) VALUES (N'5', N'132', N'防拆报警', N'1')
GO
GO
INSERT INTO [dbo].[ag_alarm_event] ([id], [event_code], [event_describe], [is_enable]) VALUES (N'6', N'133', N'胁迫报警', N'1')
GO
GO
INSERT INTO [dbo].[ag_alarm_event] ([id], [event_code], [event_describe], [is_enable]) VALUES (N'7', N'134', N'按钮开门', N'0')
GO
GO
INSERT INTO [dbo].[ag_alarm_event] ([id], [event_code], [event_describe], [is_enable]) VALUES (N'8', N'135', N'公共密码开门', N'0')
GO
GO
INSERT INTO [dbo].[ag_alarm_event] ([id], [event_code], [event_describe], [is_enable]) VALUES (N'9', N'136', N'紧急按钮开门', N'1')
GO
GO
INSERT INTO [dbo].[ag_alarm_event] ([id], [event_code], [event_describe], [is_enable]) VALUES (N'10', N'137', N'紧急按钮恢复', N'0')
GO
GO
set identity_insert [dbo].[ag_alarm_event] OFF
GO
GO

-- ----------------------------
-- Table structure for ag_cardholder
-- ----------------------------
DROP TABLE [dbo].[ag_cardholder]
GO
CREATE TABLE [dbo].[ag_cardholder] (
[id] int identity(1,1)  primary key, --主键
[card_no] nvarchar(20) NOT NULL unique, --卡号
[staff_id] int NOT NULL , --用户ID
[card_state] tinyint NOT NULL , --卡状态
[card_type] tinyint NOT NULL , --卡类型
[pass_word] nvarchar(10) NULL , --密码
[start_date] datetime2(0) NULL , --有效起始时间
[end_date] datetime2(0) NULL , --有效截止时间
[remarks] nvarchar(255) NULL , --备注
[is_enable] tinyint default 0 --0禁用 1启用
)

-- ----------------------------
-- Records of ag_cardholder
-- ----------------------------

-- ----------------------------
-- Table structure for ag_dept_permission
-- ----------------------------
DROP TABLE [dbo].[ag_dept_permission]
GO
CREATE TABLE [dbo].[ag_dept_permission] (
[id] int identity(1,1)  primary key, --主键
[dept_id] int NOT NULL , --部门ID
[door_id] int NOT NULL , --门禁点ID
[tz_no] int NOT NULL --时段编号
)

-- ----------------------------
-- Records of ag_dept_permission
-- ----------------------------

-- ----------------------------
-- Table structure for ag_device_info
-- ----------------------------
DROP TABLE [dbo].[ag_device_info]
GO
CREATE TABLE [dbo].[ag_device_info] (
[id] int identity(1,1)  primary key, --主键
[route_no] nvarchar(20) NOT NULL ,--线路编号
[station_id] int NULL , --车站ID
[device_no] int NOT NULL ,--设备编号
[device_name] nvarchar(20) NOT NULL , --设备名称
[device_type] tinyint NOT NULL , --设备类型
[device_model] nvarchar(20) NULL , --设备型号
[parent_no] int DEFAULT 0 , --上级设备编号
[device_state] tinyint NULL , --设备状态
[door_no] int DEFAULT 0 , --门禁点编号
[remarks] nvarchar(255) NULL ,--备注
[is_enable] int DEFAULT 0 --0禁用 1启用
)

-- ----------------------------
-- Records of ag_device_info
-- ----------------------------

-- ----------------------------
-- Table structure for ag_door
-- ----------------------------
DROP TABLE [dbo].[ag_door]
GO
CREATE TABLE [dbo].[ag_door] (
[id] int identity(1,1) primary key , --主键
[route_no] nvarchar(20) NOT NULL , --线路编号
[door_no] int NOT NULL , --门禁点编号
[door_name] nvarchar(20) NOT NULL , --门禁点名称
[station_id] int NULL , --车站ID
[remarks] nvarchar(255) NULL , --备注
[is_enable] tinyint DEFAULT 0 --0禁用 1启用
)

-- ----------------------------
-- Records of ag_door
-- ----------------------------

-- ----------------------------
-- Table structure for ag_door_group
-- ----------------------------
DROP TABLE [dbo].[ag_door_group]
GO
CREATE TABLE [dbo].[ag_door_group] (
[id] int identity(1,1) primary key , --主键
[route_no] nvarchar(20) NOT NULL , --线路编号
[group_code] nvarchar(20) NOT NULL unique, --组合编号
[group_name] nvarchar(20) NOT NULL , --组合名称
[remarks] nvarchar(255) NULL , --备注信息
[is_enable] tinyint DEFAULT 0  --0禁用 1启用
)

-- ----------------------------
-- Records of ag_door_group
-- ----------------------------

-- ----------------------------
-- Table structure for ag_electronic_door
-- ----------------------------
DROP TABLE [dbo].[ag_electronic_door]
GO
CREATE TABLE [dbo].[ag_electronic_door] (
[id] int identity(1,1) primary key , --主键
[station_id] int NOT NULL , --车站ID
[door_id] int NOT NULL , --门禁点ID
[width] int NOT NULL , --图标宽度
[height] int NOT NULL , --图标高度
[axisX] real NOT NULL , --X轴坐标
[axisY] real NOT NULL  --Y轴坐标
)

-- ----------------------------
-- Records of ag_electronic_door
-- ----------------------------

-- ----------------------------
-- Table structure for ag_electronic_map
-- ----------------------------
DROP TABLE [dbo].[ag_electronic_map]
GO
CREATE TABLE [dbo].[ag_electronic_map] (
[id] int identity(1,1) primary key , --主键
[station_id] int NOT NULL unique, --车站ID
[content] nvarchar(MAX) NOT NULL --地图内容
)

-- ----------------------------
-- Records of ag_electronic_map
-- ----------------------------

-- ----------------------------
-- Table structure for ag_entry_record
-- ----------------------------
DROP TABLE [dbo].[ag_entry_record]
GO
CREATE TABLE [dbo].[ag_entry_record] (
[id] int identity(1,1) primary key , --主键
[route_no] nvarchar(20) NOT NULL , --线路编号
[serial_num] int NOT NULL , --流水号
[station_name] nvarchar(20) NULL , --车站名称
[door_id] int NOT NULL , --门禁点ID
[staff_id] int DEFAULT 0 , --用户ID
[card_no] nvarchar(20) NOT NULL , --卡号
[entry_time] datetime2(0) NOT NULL , --刷卡时间
[entry_code] int NOT NULL  --状态编号
)

-- ----------------------------
-- Records of ag_entry_record
-- ----------------------------

-- ----------------------------
-- Table structure for ag_event_record
-- ----------------------------
DROP TABLE [dbo].[ag_event_record]
GO
CREATE TABLE [dbo].[ag_event_record] (
[id] int identity(1,1) primary key , --主键
[route_no] nvarchar(20) NOT NULL , --线路编号
[station_name] nvarchar(20) NULL , --车站名称
[door_name] nvarchar(20) NULL , --门禁点名称
[serial_num] int NOT NULL , --流水号
[device_no] int NOT NULL , --设备编号
[event_code] int NOT NULL , --事件编号
[event_time] datetime2(0) NOT NULL , --事件时间
[event_state] int NOT NULL , --状态 0待处理 1已处理
[user_name] nvarchar(20) NULL , --处理人姓名
[remarks] nvarchar(255) NULL  --备注
)

-- ----------------------------
-- Records of ag_event_record
-- ----------------------------

-- ----------------------------
-- Table structure for ag_group_permission
-- ----------------------------
DROP TABLE [dbo].[ag_group_permission]
GO
CREATE TABLE [dbo].[ag_group_permission] (
[id] int identity(1,1) primary key , --主键
[group_id] int NOT NULL , --门禁组ID
[door_id] int NOT NULL , --门禁点ID
[tz_no] int NOT NULL  --时段编号
)

-- ----------------------------
-- Records of ag_group_permission
-- ----------------------------

-- ----------------------------
-- Table structure for ag_holiday
-- ----------------------------
DROP TABLE [dbo].[ag_holiday]
GO
CREATE TABLE [dbo].[ag_holiday] (
[id] int identity(1,1) primary key , --主键
[holiday_no] int NOT NULL unique, --节假编号
[holiday_date] date NOT NULL , --日期
[remarks] nvarchar(255) NULL , --备注
[is_enable] tinyint DEFAULT 0 --0禁用 1启用
)

-- ----------------------------
-- Records of ag_holiday
-- ----------------------------

-- ----------------------------
-- Table structure for ag_lock_time
-- ----------------------------
DROP TABLE [dbo].[ag_lock_time]
GO
CREATE TABLE [dbo].[ag_lock_time] (
[id] int identity(1,1) primary key , --主键
[lock_no] int NOT NULL , --编号
[door_id] int NOT NULL , --门禁点ID
[tz_no] int NOT NULL , --时段编号
[work_type] tinyint NOT NULL , --0常开 1常闭
[remarks] nvarchar(255) NULL , --备注
[is_enable] tinyint default 0 --0禁用 1启用
)

-- ----------------------------
-- Records of ag_lock_time
-- ----------------------------

-- ----------------------------
-- Table structure for ag_route
-- ----------------------------
DROP TABLE [dbo].[ag_route]
GO
CREATE TABLE [dbo].[ag_route] (
[id] int identity(1,1) primary key , --主键
[route_name] nvarchar(20) NOT NULL , --线路名称
[route_no] nvarchar(20) NOT NULL , --线路编号
[access_key] nvarchar(100) NOT NULL , --接入秘钥
[remark] nvarchar(200) NULL , --备注
[is_enable] tinyint default 0 , --0禁用 1启用
[auth_code] nvarchar(200) NOT NULL --认证码
)

-- ----------------------------
-- Records of ag_route
-- ----------------------------

-- ----------------------------
-- Table structure for ag_staff_assign
-- ----------------------------
DROP TABLE [dbo].[ag_staff_assign]
GO
CREATE TABLE [dbo].[ag_staff_assign] (
[id] int identity(1,1) primary key , --主键
[staff_id] int NOT NULL , --用户ID
[door_id] int NOT NULL , --门禁点ID
[tz_no] int NOT NULL  --时段编号
)

-- ----------------------------
-- Records of ag_staff_assign
-- ----------------------------

-- ----------------------------
-- Table structure for ag_staff_door_group
-- ----------------------------
DROP TABLE [dbo].[ag_staff_door_group]
GO
CREATE TABLE [dbo].[ag_staff_door_group] (
[id] int identity(1,1) primary key , --主键
[staff_id] int NOT NULL , --用户ID
[group_id] int NOT NULL  --门禁组ID
)

-- ----------------------------
-- Records of ag_staff_door_group
-- ----------------------------

-- ----------------------------
-- Table structure for ag_station
-- ----------------------------
DROP TABLE [dbo].[ag_station]
GO
CREATE TABLE [dbo].[ag_station] (
[id] int identity(1,1) primary key , --主键
[station_no] nvarchar(20) NOT NULL , --车站编号
[station_name] nvarchar(20) NOT NULL , --车站名称
[route_no] nvarchar(20) NOT NULL , --线路编号
[remark] nvarchar(200) NULL , --备注
[is_enable] tinyint default 0  --0启用 1禁用
)

-- ----------------------------
-- Records of ag_station
-- ----------------------------

-- ----------------------------
-- Table structure for ag_temp_cmd
-- ----------------------------
DROP TABLE [dbo].[ag_temp_cmd]
GO
CREATE TABLE [dbo].[ag_temp_cmd] (
[id] int identity(1,1) primary key , --主键
[route_no] nvarchar(50) NOT NULL , --线路编号
[send_data] nvarchar(512) NOT NULL , --待发送数据
[user_id] int NOT NULL , --操作员ID
[oper_time] datetime2(0) NULL , --操作日期
[remark] nvarchar(50) NULL  --指令描述
)

-- ----------------------------
-- Records of ag_temp_cmd
-- ----------------------------

-- ----------------------------
-- Table structure for ag_time_zone
-- ----------------------------
DROP TABLE [dbo].[ag_time_zone]
GO
CREATE TABLE [dbo].[ag_time_zone] (
[id] int identity(1,1) primary key , --主键
[tz_no] int NOT NULL , --编号
[tz_name] nvarchar(20) NOT NULL , --名称
[start_time1] nvarchar(20) NOT NULL , --起始时间1
[end_time1] nvarchar(20) NOT NULL , --截止时间1
[start_time2] nvarchar(20) NULL , --起始时间2
[end_time2] nvarchar(20) NULL , --截止时段2
[start_time3] nvarchar(20) NULL , --起始时段3
[end_time3] nvarchar(20) NULL , --截止时段3
[start_time4] nvarchar(20) NULL , --起始时间4
[end_time4] nvarchar(20) NULL , --截止时间4
[week_day] nvarchar(20) NOT NULL , --有效工作日
[remarks] nvarchar(255) NULL , --备注
[is_enable] tinyint default 0 --0禁用 1启用
)

-- ----------------------------
-- Records of ag_time_zone
-- ----------------------------

-- ----------------------------
-- Table structure for sys_back_database
-- ----------------------------
DROP TABLE [dbo].[sys_back_database]
GO
CREATE TABLE [dbo].[sys_back_database] (
[id] int identity(1,1) primary key , --主键
[data_name] nvarchar(50) NOT NULL , --名称
[ip_addr] nvarchar(20) NOT NULL , --服务器IP
[port] int NOT NULL , --端口号
[account] nvarchar(20) NOT NULL , --账号
[pass_word] nvarchar(20) NOT NULL , --密码
[back_period] nvarchar(20) NOT NULL , --备份周期
[save_path] nvarchar(50) NOT NULL , --保存路径
[remarks] nvarchar(255) NULL , --备注
[is_enable] tinyint default 0 --0禁用 1启用
)

-- ----------------------------
-- Records of sys_back_database
-- ----------------------------

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE [dbo].[sys_department]
GO
CREATE TABLE [dbo].[sys_department] (
[id] int identity(1,1) primary key , --主键
[dept_name] nvarchar(20) NOT NULL , --部门名称
[dept_code] nvarchar(20) NOT NULL , --部门编号
[level] tinyint NOT NULL , --级别
[parent_id] int NOT NULL , --上级ID
[remarks] nvarchar(255) NULL , --备注
[is_enable] tinyint default 0 --0禁用 1启用
)

-- ----------------------------
-- Records of sys_department
-- ----------------------------
--允许将显式值插入表的标识列中 ON-允许  OFF-不允许
set identity_insert [dbo].[sys_department] ON
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'1', N'XX公司', N'1', N'0', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'2', N'测试部', N'2', N'0', N'1', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'3', N'开发部', N'3', N'0', N'1', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'4', N'研发部', N'4', N'0', N'1', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'5', N'市场部', N'5', N'0', N'1', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'6', N'行政部', N'6', N'0', N'1', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'7', N'XX科技', N'7', N'0', N'0', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'8', N'测试', N'8', N'0', N'7', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'9', N'开发', N'9', N'0', N'7', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'10', N'研发', N'10', N'0', N'7', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'11', N'市场', N'11', N'0', N'7', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'12', N'行政', N'12', N'0', N'7', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'13', N'策划', N'13', N'0', N'7', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'14', N'设计', N'14', N'0', N'7', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'15', N'运维', N'15', N'0', N'7', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'16', N'软件', N'17', N'1', N'1', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'17', N'test', N'18', N'1', N'1', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'18', N'暗室逢灯', N'19', N'1', N'0', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'19', N'阿斯顿发生', N'沙发上', N'1', N'0', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'20', N'分公司', N'20', N'0', N'0', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'22', N'发生的发生', N'321', N'0', N'1', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'25', N'ces', N'21', N'1', N'20', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_department] ([id], [dept_name], [dept_code], [level], [parent_id], [remarks], [is_enable]) VALUES (N'26', N'asfsafdas', N'sdfsa', N'1', N'9', N'', N'1')
GO
GO
set identity_insert [dbo].[sys_department] OFF
GO
GO

-- ----------------------------
-- Table structure for sys_operate_log
-- ----------------------------
DROP TABLE [dbo].[sys_operate_log]
GO
CREATE TABLE [dbo].[sys_operate_log] (
[id] int identity(1,1) primary key , --主键
[user_name] nvarchar(20) NOT NULL , --操作员
[account] varchar(20) NOT NULL , --账户
[oper_type] tinyint NOT NULL , --操作类型
[result_msg] nvarchar(255) NOT NULL , --返回消息
[module_name] nvarchar(20) NOT NULL , --模块名称
[occur_time] datetime2(0) NOT NULL , --操作时间
[ip_addr] nvarchar(20) NULL , --客户端IP
[result_state] tinyint NOT NULL , --结果状态
[elapse_time] int NULL , --耗时
[request_param] nvarchar(MAX) NULL , --请求参数
[exception_message] nvarchar(255) NULL --异常信息
)

-- ----------------------------
-- Records of sys_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_parameter
-- ----------------------------
DROP TABLE [dbo].[sys_parameter]
GO
CREATE TABLE [dbo].[sys_parameter] (
[id] int identity(1,1) primary key , --主键
[param_name] nvarchar(50) NOT NULL unique, --参数名称
[param_value] nvarchar(20) NULL , --参数值
[remark] nvarchar(255) NULL , --备注信息
[sys_param] tinyint default 0 --0禁用 1启用
)

-- ----------------------------
-- Records of sys_parameter
-- ----------------------------

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE [dbo].[sys_permission]
GO
CREATE TABLE [dbo].[sys_permission] (
[id] int identity(1,1) primary key , --主键
[permit_name] nvarchar(50) NOT NULL , --菜单名称
[url] nvarchar(255) NULL , --路径
[permission] nvarchar(255) NULL , --权限标签
[target] nvarchar(255) NULL , --目标
[icon] nvarchar(255) NULL , --图标
[genre] tinyint NOT NULL , --种类0菜单 1按钮
[order_by] real NOT NULL , --排序号
[parent_id] int NOT NULL , --上级ID
[remarks] nvarchar(255) NULL , --备注
[is_enable] tinyint default 0 --0禁用 1启用
)

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
set identity_insert [dbo].[sys_permission] ON
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'10', N'系统管理', N'javascript:;', N'ag:system:manage', null, null, N'0', N'0', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'11', N'系统参数', N'sysParam/browse', N'sys:sysParam:view', null, null, N'0', N'0', N'10', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'12', N'添加', N'', N'sys:sysParam:add', N'', N'', N'1', N'0', N'11', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'13', N'修改', N'', N'sys:sysParam:edit', N'', N'', N'1', N'0', N'11', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'14', N'删除', N'', N'sys:sysParam:delete', N'', N'', N'1', N'0', N'11', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'20', N'线路管理', N'route/browse', N'ag:route:view', null, null, N'0', N'0', N'10', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'21', N'添加', N'', N'ag:route:add', N'', N'', N'1', N'0', N'20', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'22', N'修改', N'', N'ag:route:edit', N'', N'', N'1', N'0', N'20', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'23', N'删除', N'', N'ag:route:delete', N'', N'', N'1', N'0', N'20', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'24', N'启用/禁用', null, N'ag:route:enable', null, null, N'1', N'0', N'20', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'25', N'时钟同步', N'', N'ag:route:syncClock', N'', N'', N'1', N'0', N'20', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'30', N'车站管理', N'routeArea/browse', N'ag:area:view', null, null, N'0', N'0', N'10', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'31', N'添加', N'', N'ag:area:add', N'', N'', N'1', N'0', N'30', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'32', N'修改', N'', N'ag:area:edit', N'', N'', N'1', N'0', N'30', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'33', N'删除', N'', N'ag:area:delete', N'', N'', N'1', N'0', N'30', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'40', N'角色管理', N'role/browse', N'sys:role:view', N'', N'', N'0', N'0', N'10', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'41', N'添加', N'', N'sys:role:add', N'', N'', N'1', N'0', N'40', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'42', N'修改', N'', N'sys:role:edit', N'', N'', N'1', N'0', N'40', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'43', N'删除', N'', N'sys:role:delete', N'', N'', N'1', N'0', N'40', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'44', N'权限分配', N'', N'sys:role:permit', N'', N'', N'1', N'0', N'40', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'45', N'启用/禁用', N'', N'sys:role:enable', N'', N'', N'1', N'0', N'40', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'50', N'操作员', N'user/browse', N'sys:operator:view', null, null, N'0', N'0', N'10', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'51', N'添加', N'', N'sys:operator:add', N'', N'', N'1', N'0', N'50', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'52', N'修改', N'', N'sys:operator:edit', N'', N'', N'1', N'0', N'50', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'53', N'删除', N'', N'sys:operator:delete', N'', N'', N'1', N'0', N'50', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'54', N'启用/禁用', N'', N'sys:operator:enable', N'', N'', N'1', N'0', N'50', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'60', N'制卡打印', N'cardModel/showCard', N'ag:fabrication:view', N'', N'', N'0', N'0', N'10', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'61', N'添加', N'', N'ag:fabrication:add', N'', N'', N'1', N'0', N'60', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'62', N'修改', N'', N'ag:fabrication:edit', N'', N'', N'1', N'0', N'60', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'63', N'删除', N'', N'ag:fabrication:delete', N'', N'', N'1', N'0', N'60', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'64', N'制作模板', N'', N'ag:fabrication:makemodel', N'', N'', N'1', N'0', N'60', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'65', N'删除标签', N'', N'ag:fabrication:deleteElm', N'', N'', N'1', N'0', N'60', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'70', N'门禁管理', N'javascript:;', N'ag:access:manage', null, null, N'0', N'0', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'71', N'门禁点', N'door/browse', N'ag:doorPoint:view', null, null, N'0', N'0', N'70', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'72', N'添加', N'', N'ag:doorPoint:add', N'', N'', N'1', N'0', N'71', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'73', N'修改', N'', N'ag:doorPoint:edit', N'', N'', N'1', N'0', N'71', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'74', N'删除', N'', N'ag:doorPoint:delete', N'', N'', N'1', N'0', N'71', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'75', N'启用/禁用', N'', N'ag:doorPoint:enable', N'', N'', N'1', N'0', N'71', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'76', N'重置参数', N'', N'ag:doorPoint:paramReset', N'', N'', N'1', N'0', N'71', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'77', N'查看设备状态', N'', N'ag:doorPoint:checkStatus', N'', N'', N'1', N'0', N'71', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'78', N'传送持卡人', N'', N'ag:doorPoint:sendCardholder', N'', N'', N'1', N'0', N'71', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'79', N'远程控制', N'', N'ag:doorPoint:telecontrol', N'', N'', N'1', N'0', N'71', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'80', N'设备信息', N'device/browse', N'ag:device:view', null, null, N'0', N'0', N'70', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'81', N'添加', N'', N'ag:device:add', N'', N'', N'1', N'0', N'80', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'82', N'修改', N'', N'ag:device:edit', N'', N'', N'1', N'0', N'80', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'83', N'删除', N'', N'ag:device:delete', N'', N'', N'1', N'0', N'80', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'90', N'节假日', N'holiday/browse', N'ag:holiday:view', null, null, N'0', N'0', N'70', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'91', N'添加', N'', N'ag:holiday:add', N'', N'', N'1', N'0', N'90', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'92', N'修改', N'', N'ag:holiday:edit', N'', N'', N'1', N'0', N'90', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'93', N'删除', N'', N'ag:holiday:delete', N'', N'', N'1', N'0', N'90', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'94', N'启用/禁用', N'', N'ag:holiday:enable', N'', N'', N'1', N'0', N'90', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'100', N'时段管理', N'timeInterval/browse', N'ag:timeZone:view', null, null, N'0', N'0', N'70', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'101', N'添加', N'', N'ag:timeZone:add', N'', N'', N'1', N'0', N'100', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'102', N'修改', N'', N'ag:timeZone:edit', N'', N'', N'1', N'0', N'100', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'103', N'删除', N'', N'ag:timeZone:delete', N'', N'', N'1', N'0', N'100', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'104', N'启用/禁用', N'', N'ag:timeZone:enable', N'', N'', N'1', N'0', N'100', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'110', N'电锁时区', N'lockZone/browse', N'ag:lockZone:view', null, null, N'0', N'0', N'70', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'111', N'添加', N'', N'ag:lockZone:add', N'', N'', N'1', N'0', N'110', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'112', N'修改', N'', N'ag:lockZone:edit', N'', N'', N'1', N'0', N'110', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'113', N'删除', N'', N'ag:lockZone:delete', N'', N'', N'1', N'0', N'110', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'114', N'启用/禁用', N'', N'ag:lockZone:enable', N'', N'', N'1', N'0', N'110', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'120', N'消防管理', N'fireControl/browse', N'ag:fireControl:view', null, null, N'0', N'0', N'70', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'121', N'修改', N'', N'ag:fireControl::edit', N'', N'', N'1', N'0', N'120', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'122', N'启用/禁用', N'', N'ag:fireControl:enable', N'', N'', N'1', N'0', N'120', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'125', N'报警定义', N'alarmDefinition/browse', N'ag:alarmDefinition:view', null, null, N'0', N'0', N'70', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'126', N'修改', N'', N'ag:alarmDefinition:edit', N'', N'', N'1', N'0', N'125', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'130', N'人事管理', N'javascript:;', N'sys:hr:manage', N'', N'', N'0', N'0', N'0', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'131', N'部门管理', N'dept/browse', N'sys:depart:view', N'', N'', N'0', N'0', N'130', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'132', N'添加', N'', N'sys:depart:add', N'', N'', N'1', N'0', N'131', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'133', N'修改', N'', N'sys:depart:edit', N'', N'', N'1', N'0', N'131', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'134', N'删除', N'', N'sys:depart:delete', N'', N'', N'1', N'0', N'131', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'140', N'职位管理', N'position/browse', N'sys:position:view', N'', N'', N'0', N'0', N'130', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'141', N'添加', N'', N'sys:position:add', N'', N'', N'1', N'0', N'140', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'142', N'修改', N'', N'sys:position:edit', N'', N'', N'1', N'0', N'140', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'143', N'删除', N'', N'sys:position:delete', N'', N'', N'1', N'0', N'140', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'144', N'启用/禁用', N'', N'sys:position:enable', N'', N'', N'1', N'0', N'140', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'150', N'人员信息', N'staff/browse', N'sys:user:view', N'', N'', N'0', N'0', N'130', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'151', N'添加', N'', N'sys:user:add', N'', N'', N'1', N'0', N'150', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'152', N'修改', N'', N'sys:user:edit', N'', N'', N'1', N'0', N'150', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'153', N'删除', N'', N'sys:user:delete', N'', N'', N'1', N'0', N'150', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'154', N'导入', N'', N'sys:user:import', N'', N'', N'1', N'0', N'150', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'155', N'导出', N'', N'sys:user:export', N'', N'', N'1', N'0', N'150', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'156', N'启用/禁用', N'', N'sys:user:enable', N'', N'', N'1', N'0', N'150', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'157', N'用户添加卡', N'', N'sys:user:addCard', N'', N'', N'1', N'0', N'150', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'160', N'出入权限', N'javascript:;', N'ag:entry:manage', null, null, N'0', N'0', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'161', N'门禁组合', N'doorGroup/browse', N'ag:doorGroup:view', null, null, N'0', N'0', N'160', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'162', N'添加', N'', N'ag:doorGroup:add', N'', N'', N'1', N'0', N'161', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'163', N'修改', N'', N'ag:doorGroup:edit', N'', N'', N'1', N'0', N'161', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'164', N'删除', N'', N'ag:doorGroup:delete', N'', N'', N'1', N'0', N'161', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'165', N'设置门权限', N'', N'ag:doorGroup:permit', N'', N'', N'1', N'0', N'161', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'170', N'卡片管理', N'cardManager/browse', N'ag:cardManager:view', null, null, N'0', N'0', N'130', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'171', N'添加', N'', N'ag:cardManager:add', N'', N'', N'1', N'0', N'170', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'172', N'修改', N'', N'ag:cardManager:edit', N'', N'', N'1', N'0', N'170', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'173', N'删除', N'', N'ag:cardManager:delete', N'', N'', N'1', N'0', N'170', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'174', N'导入', N'', N'ag:cardManager:import', N'', N'', N'1', N'0', N'170', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'175', N'导出', N'', N'ag:cardManager:export', N'', N'', N'1', N'0', N'170', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'180', N'批量授权', N'doorPermit/browse', N'ag:doorPermit:view', null, null, N'0', N'0', N'160', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'181', N'修改', N'', N'ag:doorPermit:edit', N'', N'', N'1', N'0', N'180', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'200', N'记录管理', N'javascript:;', N'sys:records:manage', null, null, N'0', N'0', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'201', N'事件记录', N'eventRecord/browse', N'ag:eventRecord:view', null, null, N'0', N'0', N'200', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'202', N'导出', N'', N'ag:eventRecord:export', N'', N'', N'1', N'0', N'201', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'203', N'处理', N'', N'ag:eventRecord:dispose', N'', N'', N'1', N'0', N'201', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'205', N'出入记录', N'entryRecord/browse', N'ag:entryRecord:view', null, null, N'0', N'0', N'200', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'206', N'导出', N'', N'ag:entryRecord:export', N'', N'', N'1', N'0', N'205', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'210', N'操作日志', N'operaLog/browse', N'sys:operaLog:view', null, null, N'0', N'0', N'200', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'211', N'导出', N'', N'sys:operaLog:export', N'', N'', N'1', N'0', N'210', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'215', N'临时指令', N'sendCmd/browse', N'ag:sendCmd:view', null, null, N'0', N'0', N'200', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'216', N'删除', N'', N'ag:sendCmd:delete', N'', N'', N'1', N'0', N'215', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'220', N'实时监控', N'javascript:;', N'ag:monitor:manager', null, null, N'0', N'0', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'221', N'电子地图', N'map/browse', N'ag:map:view', null, null, N'0', N'0', N'220', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'222', N'编辑', N'', N'ag:map:edit', N'', N'', N'1', N'0', N'221', N'', N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'223', N'部门权限', N'deptPermit/browes', N'ag:detpPermit:view', null, null, N'0', N'0', N'160', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'224', N'考勤管理', N'javascript:;', N'ag:system:attendence', null, null, N'0', N'0', N'0', null, N'1')
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'225', N'规则', N'javascript:;', N'ag:system:attendence', null, null, N'0', N'0', N'224', null, N'1')
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'226', N'节假日', N'javascript:;', N'ag:system:attendence', null, null, N'0', N'0', N'224', null, N'1')
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'227', N'假种', N'javascript:;', N'ag:system:attendence', null, null, N'0', N'0', N'224', null, N'1')
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'228', N'时间段', N'javascript:;', N'ag:system:attendence', null, null, N'0', N'0', N'224', null, N'1')
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'229', N'班次', N'javascript:;', N'ag:system:attendence', null, null, N'0', N'0', N'224', null, N'1')
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'230', N'分组', N'javascript:;', N'ag:system:attendence', null, null, N'0', N'0', N'224', null, N'1')
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'231', N'分组排班', N'javascript:;', N'ag:system:attendence', null, null, N'0', N'0', N'224', null, N'1')
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'232', N'部门排班', N'javascript:;', N'ag:system:attendence', null, null, N'0', N'0', N'224', null, N'1')
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'233', N'人员排班', N'javascript:;', N'ag:system:attendence', null, null, N'0', N'0', N'224', null, N'1')
INSERT INTO [dbo].[sys_permission] ([id], [permit_name], [url], [permission], [target], [icon], [genre], [order_by], [parent_id], [remarks], [is_enable]) VALUES (N'234', N'临时排班', N'javascript:;', N'ag:system:attendence', null, null, N'0', N'0', N'224', null, N'1')
set identity_insert [dbo].[sys_permission] OFF --关闭
GO
GO

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE [dbo].[sys_position]
GO
CREATE TABLE [dbo].[sys_position] (
[id] int identity(1,1) primary key , --主键
[post_code] nvarchar(20) NOT NULL unique, --编号
[post_name] nvarchar(20) NOT NULL , --名称
[remarks] nvarchar(255) NULL , --备注
[is_enable] tinyint default 0 --0禁用 1启用
)

-- ----------------------------
-- Records of sys_position
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE [dbo].[sys_role]
GO
CREATE TABLE [dbo].[sys_role] (
[id] int identity(1,1) primary key , --主键
[role_name] nvarchar(20) NOT NULL unique, --名称
[role_type] tinyint default 1 , --0系统 1自定义
[remarks] nvarchar(255) NULL , --备注
[is_enable] tinyint default 0 --0禁用 1启用
)

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_permit
-- ----------------------------
DROP TABLE [dbo].[sys_role_permit]
GO
CREATE TABLE [dbo].[sys_role_permit] (
[id] int identity(1,1) primary key , --主键
[role_id] int NOT NULL , --角色ID
[permit_id] int NOT NULL  --权限ID
)

-- ----------------------------
-- Records of sys_role_permit
-- ----------------------------

-- ----------------------------
-- Table structure for sys_staff
-- ----------------------------
DROP TABLE [dbo].[sys_staff]
GO
CREATE TABLE [dbo].[sys_staff] (
[id] int identity(1,1) primary key , --主键
[staff_name] nvarchar(20) NOT NULL , --名称
[staff_code] nvarchar(20)  NULL , --编号
[sex] tinyint default 1 , --性别 0女 1男
[dept_id] int DEFAULT 0 , --部门ID
[post_id] int DEFAULT 0 , --职位ID
[job_no] nvarchar(20) NULL , --工号
[mobile] nvarchar(20) NULL , --手机号
[car_no] nvarchar(20) NULL , --车牌号
[email] nvarchar(20) NULL , --邮箱地址
[id_num] nvarchar(20) NULL , --身份证号
[img_path] nvarchar(100) NULL , --头像路径
[auth_type] int NOT NULL , --授权类型 0部门 1组合 2个别
[remarks] nvarchar(255) NULL , --备注
[is_enable] tinyint default 0 --0禁用 1启用
)

-- ----------------------------
-- Records of sys_staff
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE [dbo].[sys_user]
GO
CREATE TABLE [dbo].[sys_user] (
[id] int identity(1,1) primary key , --主键
[user_name] nvarchar(20) NOT NULL , --姓名
[account] nvarchar(20) NOT NULL unique, --账号
[pass_word] nvarchar(50) NOT NULL , --密码
[mobile] nvarchar(20) NULL , --手机号
[id_num] nvarchar(20) NULL , --身份证号
[job_no] nvarchar(20) NULL , --工号
[dept_id] int default 0 , --部门ID
[area_id] int DEFAULT 0 , --线路ID
[group_id] int DEFAULT 0 , --分组ID
[route_no] int DEFAULT 0 , --线路编号
[remarks] nvarchar(255) NULL , --备注
[is_enable] tinyint default 0 --0禁用 1启用
)

-- ----------------------------
-- Records of sys_user
-- ----------------------------
set identity_insert [dbo].[sys_user] ON--打开
GO
GO
INSERT INTO [dbo].[sys_user] ([id], [user_name], [account], [pass_word], [mobile], [id_num], [job_no], [dept_id], [area_id], [remarks], [is_enable]) VALUES (N'1', N'admin', N'admin', N'202cb962ac59075b964b07152d234b70', null, null, null, N'0', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[sys_user] ([id], [user_name], [account], [pass_word], [mobile], [id_num], [job_no], [dept_id], [area_id], [remarks], [is_enable]) VALUES (N'4', N'test', N'test', N'202cb962ac59075b964b07152d234b70', null, null, null, N'11', N'2', null, N'1')
GO
GO
set identity_insert [dbo].[sys_user] OFF--关闭
GO
GO

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE [dbo].[sys_user_role]
GO
CREATE TABLE [dbo].[sys_user_role] (
[id] int identity(1,1) primary key , --主键
[user_id] int NOT NULL , --用户ID
[role_id] int NOT NULL  --角色ID
)

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for ag_send_cmd
-- ----------------------------
DROP TABLE [dbo].[ag_send_cmd]
GO
CREATE TABLE [dbo].[ag_send_cmd] (
[id] int identity(1,1) primary key , --主键
[route_no] varchar(10) NOT NULL,	--线路编号
[send_data] varchar(255) NOT NULL,	--发送数据
[receive_data] varchar(255),	--返回数据
[create_date] datetime2(0) NOT NULL,	--创建时间
[rest_state] int NOT NULL, --发送状态,0失败,1成功
[remarks] VARCHAR(20)	--描述
)

-- ----------------------------
-- Records of ag_send_cmd
-- ----------------------------

-- ----------------------------
-- Indexes structure for table ag_alarm_event
-- ----------------------------
CREATE INDEX [ag_alarm_event_code] ON [dbo].[ag_alarm_event]
([event_code] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_cardholder
-- ----------------------------
CREATE UNIQUE INDEX [ag_cardholder_cardno] ON [dbo].[ag_cardholder]
([card_no] ASC)
WITH (IGNORE_DUP_KEY = ON, STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_cardholder_staffid] ON [dbo].[ag_cardholder]
([staff_id] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_dept_permission
-- ----------------------------
CREATE INDEX [ag_dept_permission_deptid] ON [dbo].[ag_dept_permission]
([dept_id] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_dept_permission_doorid] ON [dbo].[ag_dept_permission]
([door_id] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_device_info
-- ----------------------------
CREATE UNIQUE INDEX [ag_device_no_route] ON [dbo].[ag_device_info]
([device_no] ASC, [route_no] ASC)
WITH (IGNORE_DUP_KEY = ON, STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_device_type] ON [dbo].[ag_device_info]
([device_type] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_device_parent] ON [dbo].[ag_device_info]
([parent_no] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_door
-- ----------------------------
CREATE UNIQUE INDEX [ag_door_no_route] ON [dbo].[ag_door]
([door_no] ASC, [route_no] ASC)
WITH (IGNORE_DUP_KEY = ON, STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_door_name] ON [dbo].[ag_door]
([door_name] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_door_group
-- ----------------------------
CREATE UNIQUE INDEX [ag_door_group_name] ON [dbo].[ag_door_group]
([group_name] ASC)
WITH (IGNORE_DUP_KEY = ON, STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_electronic_door
-- ----------------------------
CREATE UNIQUE INDEX [ag_electronic_door_sid] ON [dbo].[ag_electronic_door]
([station_id] ASC)
WITH (IGNORE_DUP_KEY = ON, STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_electronic_map
-- ----------------------------
CREATE UNIQUE INDEX [ag_electronic_map_sid] ON [dbo].[ag_electronic_map]
([station_id] ASC)
WITH (IGNORE_DUP_KEY = ON, STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_entry_record
-- ----------------------------
CREATE INDEX [ag_entry_record_route] ON [dbo].[ag_entry_record]
([route_no] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_entry_record_cardno] ON [dbo].[ag_entry_record]
([card_no] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_entry_record_door] ON [dbo].[ag_entry_record]
([door_id] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_entry_record_user] ON [dbo].[ag_entry_record]
([staff_id] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_entry_record_time] ON [dbo].[ag_entry_record]
([entry_time] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_event_record
-- ----------------------------
CREATE INDEX [ag_event_route] ON [dbo].[ag_event_record]
([route_no] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_event_time] ON [dbo].[ag_event_record]
([event_time] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_event_state] ON [dbo].[ag_event_record]
([event_state] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_group_permission
-- ----------------------------
CREATE INDEX [ag_group_permission_groupid] ON [dbo].[ag_group_permission]
([group_id] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_group_permission_doorid] ON [dbo].[ag_group_permission]
([door_id] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_holiday
-- ----------------------------
CREATE UNIQUE INDEX [ag_holiday_no] ON [dbo].[ag_holiday]
([holiday_no] ASC)
WITH (IGNORE_DUP_KEY = ON, STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_holiday_date] ON [dbo].[ag_holiday]
([holiday_date] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_lock_time
-- ----------------------------
CREATE INDEX [ag_lock_time_doorid] ON [dbo].[ag_lock_time]
([door_id] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_lock_time_no] ON [dbo].[ag_lock_time]
([lock_no] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_route
-- ----------------------------
CREATE UNIQUE INDEX [ag_route_no] ON [dbo].[ag_route]
([route_no] ASC)
WITH (IGNORE_DUP_KEY = ON, STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_staff_assign
-- ----------------------------
CREATE INDEX [ag_cardassignment_staff] ON [dbo].[ag_staff_assign]
([staff_id] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_cardassignment_door] ON [dbo].[ag_staff_assign]
([door_id] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_staff_door_group
-- ----------------------------
CREATE INDEX [ag_staff_door_group_card] ON [dbo].[ag_staff_door_group]
([staff_id] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_station
-- ----------------------------
CREATE INDEX [ag_station_routeno] ON [dbo].[ag_station]
([route_no] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_station_no] ON [dbo].[ag_station]
([station_no] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_temp_cmd
-- ----------------------------
CREATE INDEX [ag_temp_cmd_route] ON [dbo].[ag_temp_cmd]
([route_no] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table ag_time_zone
-- ----------------------------
CREATE UNIQUE INDEX [ag_time_zone_no] ON [dbo].[ag_time_zone]
([tz_no] ASC)
WITH (IGNORE_DUP_KEY = ON, STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table sys_back_database
-- ----------------------------
CREATE INDEX [sys_back_database_name] ON [dbo].[sys_back_database]
([data_name] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table sys_department
-- ----------------------------
CREATE UNIQUE INDEX [sys_department_code] ON [dbo].[sys_department]
([dept_code] ASC)
WITH (IGNORE_DUP_KEY = ON, STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [sys_department_name] ON [dbo].[sys_department]
([dept_name] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [sys_department_parent] ON [dbo].[sys_department]
([parent_id] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table sys_operate_log
-- ----------------------------
CREATE INDEX [ag_operate_log_user] ON [dbo].[sys_operate_log]
([user_name] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [ag_operate_log_module] ON [dbo].[sys_operate_log]
([module_name] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table sys_parameter
-- ----------------------------
CREATE UNIQUE INDEX [sys_param_name] ON [dbo].[sys_parameter]
([param_name] ASC)
WITH (IGNORE_DUP_KEY = ON, STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table sys_position
-- ----------------------------
CREATE INDEX [sys_position_name] ON [dbo].[sys_position]
([post_name] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table sys_role
-- ----------------------------
CREATE UNIQUE INDEX [sys_role_name] ON [dbo].[sys_role]
([role_name] ASC)
WITH (IGNORE_DUP_KEY = ON, STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table sys_staff
-- ----------------------------
CREATE INDEX [sys_staff_name] ON [dbo].[sys_staff]
([staff_name] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [sys_staff_depart] ON [dbo].[sys_staff]
([dept_id] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

-- ----------------------------
-- Indexes structure for table sys_user
-- ----------------------------
CREATE UNIQUE INDEX [sys_user_account] ON [dbo].[sys_user]
([account] ASC)
WITH (IGNORE_DUP_KEY = ON, STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [sys_user_name] ON [dbo].[sys_user]
([user_name] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO
CREATE INDEX [sys_user_depart] ON [dbo].[sys_user]
([dept_id] ASC)
WITH (STATISTICS_NORECOMPUTE = ON)
GO

CREATE TABLE [dbo].[att_rule] (
[id] nvarchar(50) primary key , --主键--基础信息--考勤规则
[start_work_record] nvarchar(1) NOT NULL , --上班签到取卡记录原则 0:最早原则，1：就近原则
[end_work_record] nvarchar(1) NOT NULL , --下班签到取卡记录原则 0：最晚原则，1：就近原则
[late_early_is_absent] nvarchar(1) NOT NULL , --迟到且早退算旷工 0：否，1：否
[find_scheduling_order] nvarchar(1) NOT NULL , --查找排班记录顺序 0：分组->部门，1：部门->分组
[find_scheduling_rule] nvarchar(1) NOT NULL , --智能找班原则 0:时长最长,1:异常最少
[flexible_time_algorithm] nvarchar(1) NOT NULL , --弹性时长计算方式 0:两两打卡累积时长,1:首尾打卡计算时长
[min_att_time] int NOT NULL , --最短的考勤时段应大于（最小值10分钟）
[max_att_time] int NOT NULL , --最大的考勤时段应小于
[more_than_one_day_algorithm] nvarchar(1) NOT NULL , --班次时间段跨天时，考勤计算结果 0:第一日,1:第二日
[orvertime_algorithm] nvarchar(1) NOT NULL , --是否统计加班 0:否，1：是
[min_orvertime] int NOT NULL, --最短加班时长（分钟）
[create_time] datetime NULL,
[update_time] datetime NULL
)


CREATE TABLE [dbo].[att_holiday] (
[id] nvarchar(50) primary key, --主键 节假日
[holiday_name] nvarchar(50) NOT NULL , --节假日名称
[holiday_no] nvarchar(20) NOT NULL , --节假日编号
[start_time] datetime  NULL , --开始时间
[end_time] datetime  NULL , --结束时间
[remark] nvarchar(500) NULL , --备注
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_leave] (
[id] nvarchar(50) primary key, --主键 节假日
[leave_name] nvarchar(50) NOT NULL , --假种名称
[leave_no] nvarchar(20) NOT NULL , --假种编号
[leave_symbol] nvarchar(20)  NULL , --假种符号
[deduct_work_time] nvarchar(1)  NULL , --是否扣除上班时长 0：否，1：是
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_time_slot] (
[id] nvarchar(50) primary key, --主键 时间段
[slot_name] nvarchar(50) NOT NULL , --时间段名称
[slot_no] nvarchar(20) NOT NULL , --时间段编号
[slot_type] nvarchar(1) NOT NULL , --时间段类型
[start_check_in_time] nvarchar(50) NULL , --开始签到时间 HH:MM
[end_check_in_time] nvarchar(50) NULL , --结束签到时间 HH:MM
[start_sign_off_time] nvarchar(50) NULL , --开始签退时间 HH:MM
[end_sign_off_time] nvarchar(50) NULL , --结束签退时间 HH:MM
[must_check_in] nvarchar(1)  NULL,--必须签到 1：是，0：否
[must_sign_off] nvarchar(1)  NULL,--必须签退 1:是，0：否
[late_allowed_minutes] int  NULL,--允许迟到分钟数
[early_allowed_minutes] int NULL,--允许早退分钟数
[record_as_work_days] decimal(18,1) NULL,--记为工作日数 1位小数
[deduct_for_slot] nvarchar(1)  NULL,--是否时间段扣除 1：是，0：否
[working_time] int  NULL,--工作时长，分钟
[record_as_overtime] nvarchar(1)  NULL,--是否记为加班 1:是，0：否
[early_as_overtime] nvarchar(1)  NULL,--提前是否记为加班：1:是，0：否
[late_as_overtime] nvarchar(1)  NULL,--延后是否记为加班：1：是，0：否
[start_work_time] nvarchar(50) NULL , --上班时间 HH:MM
[end_work_time] nvarchar(50) NULL , --下班时间 HH:MM
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_class] (
[id] nvarchar(50) primary key  , --主键 班次
[time_slot_id] nvarchar(50) primary key  , --时段id
[class_name] nvarchar(50)   NULL , --班次名称
[class_no] nvarchar(20)  NULL , --班次编号
[class_type] nvarchar(1)   NULL , --班次类型 0：规律班次，1：弹性班次
[class_unit] nvarchar(5)   NULL , --班次单位 0：日，1：周，2：月
[start_class_time] datetime NULL , --班次起始时间
[class_color] nvarchar(10)  NULL , --班次颜色值
[class_period] nvarchar(10)  NULL , --班次周期
[start_work_time] nvarchar(50)  NULL , --上下班时间(班次周期和上下班时间动态构成时间段明细)
[end_work_time] nvarchar(50)  NULL , --上下班时间(班次周期和上下班时间动态构成时间段明细)
[should_work_time] int)  NULL , --应出勤(上班)时间，存入的时候计算进来
[class_month_shifts] nvarchar(1) NULL , --是否月内轮班，0：否，1：是
[att_type] nvarchar(1)  NULL , --考勤方式，0：按班次正常刷卡，1：一天内任刷一次有效卡，2：只计算刷卡时间：3，免刷卡
[over_time_status] nvarchar(1)  NULL , --加班标记，0：平时，1：休息日，2：节假日
[over_time_type] nvarchar(1)  NULL , --加班方式，0：电脑自动计算，1：加班必须申请，2：必须加班否则旷工，3：时长为较小者，4：不算加班
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_class_time_slot_detail] (
[id] nvarchar(50) primary key  , --主键 班次时段详情(这个表估计不需要)
[class_id] nvarchar(50) null  , --班次ID
[day_num] nvarchar(50) null  , --第几天
[start_end_work_time] nvarchar(50)  NULL , --上下班时间
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_group] (
[id] nvarchar(50) primary key  , --主键 排班-分组
[group_name] nvarchar(50) NOT NULL , --分组名称
[group_no] nvarchar(20) NOT NULL , --分组编号
[remark] nvarchar(200)  NULL , --备注
[create_time] datetime NULL,
[update_time] datetime NULL
)


CREATE TABLE [dbo].[att_group_class] (
[id] nvarchar(50) primary key , --主键 排班-分组排班
[class_type] nvarchar(1) NOT NULL , --班次类型 0：规律班次，1：弹性班次
[class_name] nvarchar(50)  NULL , --班次名称
[class_no] nvarchar(20)  NULL , --班次编号
[group_id] nvarchar(20)  NULL , --分组ID
[start_time] NVARCHAR(20) NULL,
[end_time] NVARCHAR(20) NULL,
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_depart_class] (
[id] nvarchar(50) primary key , --主键 排班-部门排班
[classId] nvarchar(50) NOT NULL , --班次Id   2019-07-21 添加 Andy
[class_type] nvarchar(1) NOT NULL , --班次类型 0：规律班次，1：弹性班次
[depart_id] nvarchar(20) NOT NULL , --部门ID
[depart_no] nvarchar(20) NOT NULL , --部门编号
[depart_name] nvarchar(50) NOT NULL , --部门名称
[start_time] datetime NULL,
[end_time] datetime NULL,
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_staff_class] (
[id] nvarchar(50) primary key , --主键 排班-人员排班
[classId] nvarchar(50) NOT NULL , --班次Id   2019-07-21 添加 Andy
[class_type] nvarchar(1) NOT NULL , --班次类型 0：规律班次，1：弹性班次
[staff_id] nvarchar(20) NOT NULL , --人员ID
[staff_no] nvarchar(20) NOT NULL , --人员编号
[staff_name] nvarchar(50) NOT NULL , --人员名称
[start_time] datetime NULL,
[end_time] datetime NULL,
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_makeup_bill] (
[id] nvarchar(50) primary key , --主键 异常管理-补签单
[sign_card_time] datetime NOT NULL , --签卡时间
[remark] nvarchar(100) NULL , --备注
[staff_code] nvarchar(20)  NULL , --人员编号
[staff_name] nvarchar(50) NULL , --人员名称
[dept_id] nvarchar(20) NULL , --部门ID
[dept_code] nvarchar(20) NULL , --部门编号
[dept_name] nvarchar(50) NULL , --部门名称
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_leave_bill] (
[id] nvarchar(50) primary key , --主键 异常管理-请假单
[leave_type] nvarchar(2)  NULL , --假种
[leave_name] nvarchar(2)  NULL , --假类名称
[start_time] datetime NULL, --开始时间
[end_time] datetime NULL, --结束时间
[remark] nvarchar(100) NULL , --备注
[staff_code] nvarchar(20)  NULL , --人员编号
[staff_name] nvarchar(50)  NULL , --人员名称
[dept_id] nvarchar(20)  NULL , --部门ID
[dept_code] nvarchar(20)  NULL , --部门编号
[dept_name] nvarchar(50)  NULL , --部门名称
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_business_bill] (
[id] nvarchar(50) primary key , --主键 异常管理-出差单
[start_time] datetime NULL, --开始时间
[end_time] datetime NULL, --结束时间
[remark] nvarchar(100) NULL , --备注
[staff_code] nvarchar(20)  NULL , --人员编号
[staff_name] nvarchar(50)  NULL , --人员名称
[dept_id] nvarchar(20) NOT NULL , --部门ID
[dept_code] nvarchar(20) NOT NULL , --部门编号
[dept_name] nvarchar(50) NOT NULL , --部门名称
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_out_bill] (
[id] nvarchar(50) primary key , --主键 异常管理-外出单
[start_time] datetime NULL, --开始时间
[end_time] datetime NULL, --结束时间
[remark] nvarchar(100) NULL , --备注
[staff_code] nvarchar(20)  NULL , --人员编号
[staff_name] nvarchar(50)  NULL , --人员名称
[dept_id] nvarchar(20)  NULL , --部门ID
[dept_code] nvarchar(20)  NULL , --部门编号
[dept_name] nvarchar(50)  NULL , --部门名称
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_overtime_bill] (
[id] nvarchar(50) primary key , --主键 异常管理-加班单
[overtime_type] nvarchar(1)   NULL , --加班类型 0：平时，1：休息日，2：节假日
[overtime_name] nvarchar(50)   NULL , --加班类型名称
[start_time] datetime NULL, --开始时间
[end_time] datetime NULL, --结束时间
[remark] nvarchar(100) NULL , --备注
[staff_code] nvarchar(20)  NULL , --人员编号
[staff_name] nvarchar(50)  NULL , --人员名称
[dept_id] nvarchar(20)   NULL , --部门ID
[dept_code] nvarchar(20)   NULL , --部门编号
[dept_name] nvarchar(50)   NULL , --部门名称
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_adjustment_bill] (
[id] nvarchar(50) primary key , --主键 异常管理-调休补班(调整单)
[adjust_type] nvarchar(1)   NULL , --调整类型：0：调休，1：补班
[adjust_time] datetime   NULL , --调整日期
[remark] nvarchar(100) NULL , --备注
[staff_code] nvarchar(20)  NULL , --人员编号
[staff_name] nvarchar(50)  NULL , --人员名称
[dept_id] nvarchar(20)  NULL , --部门ID
[dept_no] nvarchar(20)  NULL , --部门编号
[dept_name] nvarchar(50)  NULL , --部门名称
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_adjustment_class] (
[id] nvarchar(50) primary key , --主键 异常管理-调班
[adjust_type] nvarchar(1) NOT NULL , --调整类型：0：个人同日期调班，1：个人不同日期调班，2：二人对调
[adjust_time] datetime  NULL , --调整日期
[exchange_time] datetime  NULL , --对调日期
[exchange_staff_no] nvarchar(20)  NULL , --对调人员编号
[exchange_staff_name] nvarchar(50)  NULL , --对调人员名称
[adjust_class_id] nvarchar(20)  NULL , --对调班次ID
[adjust_class_no] nvarchar(20)  NULL , --对调人员编号
[exchange_class_name] nvarchar(20)  NULL , --调整班次名称
[remark] nvarchar(100) NULL , --备注
[staff_no] nvarchar(20)  NULL , --人员编号
[staff_name] nvarchar(50)  NULL , --人员名称
[depart_id] nvarchar(20)  NULL , --部门ID
[depart_no] nvarchar(120)  NULL , --部门编号
[depart_name] nvarchar(50)  NULL , --部门名称
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_process_node] (
[id] nvarchar(50) primary key , --主键 流程管理-节点设置
[node_type] nvarchar(1)  NULL , --调整类型：0：指定人，1：指定职位
[node_no] nvarchar(20)   NULL , --节点编号
[node_name] nvarchar(50)   NULL , --节点名称
[position_name] nvarchar(50) NULL , --职位
[staff_no] nvarchar(20)   NULL , --人员编号
[staff_name] nvarchar(50)   NULL , --人员名称
[depart_id] nvarchar(20)   NULL , --部门ID
[depart_no] nvarchar(20)   NULL , --部门编号
[depart_name] nvarchar(50)   NULL , --部门名称
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_process] (
[id] nvarchar(50) primary key , --主键 流程管理-流程设置
[process_type] nvarchar(1)   NULL , --流程类型：0：补签单，1：请假，2：出差，3：外出，4：加班，5：调休补班，6：调班
[process_no] nvarchar(20)   NULL , --流程编号
[process_name] nvarchar(50)   NULL , --流程名称
[node_name] nvarchar(50)   NULL , --节点名称
[process_rule] nvarchar(50)   NULL , --流程规则
[approval_nodes] nvarchar(100) NULL , --审批节点
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_apply] (
[id] nvarchar(50) primary key, --主键 流程管理-我的申请
[apply_no] nvarchar(20)   NULL , --申请编号
[apply_staff_no] nvarchar(20)   NULL , --申请人员编号
[apply_staff_name] nvarchar(20)   NULL , --申请人员姓名
[adjust_type] nvarchar(50)   NULL , --异常类型
[make_person] nvarchar(50)   NULL , --创建人
[apply_time] datetime NULL,--申请/审核时间
[process_status] nvarchar(1)   NULL,--流程状态 0：发起申请，1：流程中，2：结束，3：驳回，4：异常
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_approval] (
[id] nvarchar(50) primary key , --主键 流程管理-我的审批
[approval_no] nvarchar(20)   NULL , --审批编号
[apply_staff_no] nvarchar(20)   NULL , --申请人员编号
[apply_staff_name] nvarchar(20)   NULL , --申请人员姓名
[approval_staff_no] nvarchar(20)   NULL , --审批人员编号
[approval_staff_name] nvarchar(20)   NULL , --审批人员姓名
[apply_time] datetime NULL,--申请/审核时间
[node_status] nvarchar(1)   NULL,--节点状态 0：待审批，1：通过，2：不通过
[process_status] nvarchar(1)   NULL,--流程状态 0：发起申请，1：流程中，2：结束，3：驳回，4：异常
[create_time] datetime NULL,
[update_time] datetime NULL
)

CREATE TABLE [dbo].[att_timing_compute] (
[id] nvarchar(50) primary key , --主键 定时计算
[rule_type] nvarchar(1)   NULL , --计算方式，0：按日，1：按月
[day_rule1] nvarchar(50)   NULL , --按日规则
[day_rule2] nvarchar(50)   NULL , --按日规则
[day_rule3] nvarchar(50)   NULL , --按日规则
[day_rule4] nvarchar(50)   NULL , --按日规则
[day_rule5] nvarchar(50)   NULL , --按日规则
[day_rule6] nvarchar(50)   NULL , --按日规则
[monthRule] nvarchar(100)   NULL , --0:每月最后一天，1：每月第一天；2：具体日期
[some_day] nvarchar(100)   NULL , --具体日期值
[create_time] datetime NULL,
[update_time] datetime NULL
)


-------添加测试数据  2019-07-21 Andy
----添加时间段
INSERT INTO att_time_slot(
id,
slot_name,
slot_no,
slot_type,
start_check_in_time,
end_check_in_time,
start_sign_off_time,
end_sign_off_time,
must_check_in,
must_sign_off,
late_allowed_minutes,
early_allowed_minutes,
record_as_work_days,
deduct_for_slot,
working_time,
record_as_overtime,
early_as_overtime,
late_as_overtime,
start_work_time,
end_work_time,
create_time,
update_time)
VALUES(
'1',
'八小时考勤时间段',
'123',
'1',
'08:00',
'10:00',
'08:00',
'23:59',
'1',
'1',
30,
30,
'0',
'0',
480,
'1',
'0',
'1',
'09:00',
'18:00',
GETDATE(),
GETDATE()
);



----添加班次
INSERT INTO att_class(
class_name,
class_no,
class_type,
class_unit,
start_class_time,
class_color,
class_period,
start_work_time,
end_work_time,
should_work_time,
class_month_shifts,
over_time_status,
over_time_type,
create_time,
update_time)
VALUES(
'测试八小时排班',
'123',
'0',
'1',
'2019-07-22 09:00:00',
'',
'',
'09:00',
'18:00',
480,
'0',
'0',
'0',
GETDATE(),
GETDATE()
);

---添加排班记录
INSERT INTO dbo.att_staff_class (
id,
class_id,
class_type,
staff_id,
staff_no,
staff_name,
start_time,
end_time,
create_time,
update_time) VALUES ('1',8,'0','1','','川普','2019-07-22 09:00:00','2019-07-22 18:00:00',GETDATE(),GETDATE()),
('2',8,'0','1','','川普','2019-07-23 09:00:00','2019-07-23 18:00:00',GETDATE(),GETDATE()),
('3',8,'0','1','','川普','2019-07-24 09:00:00','2019-07-24 18:00:00',GETDATE(),GETDATE()),
('4',8,'0','1','','川普','2019-07-25 09:00:00','2019-07-25 18:00:00',GETDATE(),GETDATE()),
('5',8,'0','1','','川普','2019-07-26 09:00:00','2019-07-26 18:00:00',GETDATE(),GETDATE()),
('6',8,'0','1','','川普','2019-07-27 09:00:00','2019-07-27 18:00:00',GETDATE(),GETDATE()),
('7',8,'0','1','','川普','2019-07-28 09:00:00','2019-07-28 18:00:00',GETDATE(),GETDATE());


---添加刷卡记录
INSERT INTO ag_entry_record(
route_no,
serial_num,
station_name,
door_id,
staff_id,
card_no,
entry_time,
entry_code

)VALUES
('测试路线'，123,'测试站点',12,1,'123456','2019-07-22 09:00:00',1),
('测试路线'，123,'测试站点',12,1,'123456','2019-07-22 18:00:00',1),
('测试路线'，123,'测试站点',12,1,'123456','2019-07-23 09:00:00',1),
('测试路线'，123,'测试站点',12,1,'123456','2019-07-23 18:00:00',1),
('测试路线'，123,'测试站点',12,1,'123456','2019-07-24 09:00:00',1),
('测试路线'，123,'测试站点',12,1,'123456','2019-07-24 18:00:00',1),
('测试路线'，123,'测试站点',12,1,'123456','2019-07-25 09:10:00',1),
('测试路线'，123,'测试站点',12,1,'123456','2019-07-25 18:00:00',1),
('测试路线'，123,'测试站点',12,1,'123456','2019-07-26 09:00:00',1),
('测试路线'，123,'测试站点',12,1,'123456','2019-07-26 18:00:00',1),
('测试路线'，123,'测试站点',12,1,'123456','2019-07-27 09:00:00',1),
('测试路线'，123,'测试站点',12,1,'123456','2019-07-27 18:00:00',1),
('测试路线'，123,'测试站点',12,1,'123456','2019-07-28 09:00:00',1),
('测试路线'，123,'测试站点',12,1,'123456','2019-07-28 18:30:00',1),


