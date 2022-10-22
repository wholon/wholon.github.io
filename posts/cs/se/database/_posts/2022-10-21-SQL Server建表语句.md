1. SQL Server表创建后字段不能重新排序，所以尽量创建后就确定下来
2. SQL Server默认引擎没有UTF-8，有中文的VARCHAR请用NVARCHAR

## 单表建表语句

```sql
-- auto-generated definition

CREATE TABLE MY_HR_Talent_Pool_Application
(
    id          BIGINT      DEFAULT NULL PRIMARY KEY,
    tenant_id   VARCHAR(12) DEFAULT '000000',

    -- 业务字段 start --
    -- 业务字段的备注通过UI界面设置
    -- 业务字段 end --

    -- 通用字段
    create_user BIGINT      DEFAULT NULL,
    create_dept BIGINT      DEFAULT NULL,
    create_time DATETIME    DEFAULT CURRENT_TIMESTAMP,
    update_user BIGINT      DEFAULT NULL,
    update_dept BIGINT      DEFAULT NULL,
    update_time DATETIME    DEFAULT CURRENT_TIMESTAMP,
    status      INT         DEFAULT 0,
    is_deleted  INT         DEFAULT 0
)
GO

-- 通用字段备注
EXEC sp_addextendedproperty 'MS_Description', '主键', 'SCHEMA', 'dbo', 'TABLE', 'MY_HR_Talent_Pool_Application',
     'COLUMN', 'id'
GO

EXEC sp_addextendedproperty 'MS_Description', '租户ID', 'SCHEMA', 'dbo', 'TABLE', 'MY_HR_Talent_Pool_Application',
     'COLUMN', 'tenant_id'
GO

EXEC sp_addextendedproperty 'MS_Description', '创建人', 'SCHEMA', 'dbo', 'TABLE', 'MY_HR_Talent_Pool_Application',
     'COLUMN', 'create_user'
GO

EXEC sp_addextendedproperty 'MS_Description', '创建时间', 'SCHEMA', 'dbo', 'TABLE', 'MY_HR_Talent_Pool_Application',
     'COLUMN', 'create_time'
GO

EXEC sp_addextendedproperty 'MS_Description', '创建部门', 'SCHEMA', 'dbo', 'TABLE', 'MY_HR_Talent_Pool_Application',
     'COLUMN', 'create_dept'
GO

EXEC sp_addextendedproperty 'MS_Description', '更新人', 'SCHEMA', 'dbo', 'TABLE', 'MY_HR_Talent_Pool_Application',
     'COLUMN', 'update_user'
GO

EXEC sp_addextendedproperty 'MS_Description', '更新时间', 'SCHEMA', 'dbo', 'TABLE', 'MY_HR_Talent_Pool_Application',
     'COLUMN', 'update_time'
GO

EXEC sp_addextendedproperty 'MS_Description', '更新部门', 'SCHEMA', 'dbo', 'TABLE', 'MY_HR_Talent_Pool_Application',
     'COLUMN', 'update_dept'
GO

EXEC sp_addextendedproperty 'MS_Description', '状态：启用/停用  【1】启用 【0】停用', 'SCHEMA', 'dbo', 'TABLE',
     'MY_HR_Talent_Pool_Application', 'COLUMN', 'status'
GO

EXEC sp_addextendedproperty 'MS_Description', '是否删除 【0】否 【1】是', 'SCHEMA', 'dbo', 'TABLE',
     'MY_HR_Talent_Pool_Application', 'COLUMN', 'is_deleted'
GO

-- 更新时间触发器 --
-- 触发器名称在数据库层级，同一个库下不能重复
-- SQL Server 的触发器在 Data Grip 的生成的 DDL(Data Definition Language) 语句中是没有体现的，不方便，建议不要了
CREATE TRIGGER 表名_trigger_update_time
    ON MY_HR_Talent_Pool_Application
    AFTER UPDATE
    AS
BEGIN
    UPDATE MY_HR_Talent_Pool_Application
    SET
        update_time = GETDATE()
    WHERE
        id IN (SELECT DISTINCT id FROM inserted)
END
GO


```

