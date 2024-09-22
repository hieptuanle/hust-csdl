USE CSDL_Muahang;

-- Step 1: Drop all foreign key constraints
DECLARE @sql NVARCHAR(MAX) = '';

-- Build the drop constraint commands for all foreign keys
SELECT @sql = @sql + 
    'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) + '.' + QUOTENAME(OBJECT_NAME(parent_object_id)) + 
    ' DROP CONSTRAINT ' + QUOTENAME(name) + '; '
FROM sys.foreign_keys;

-- Execute the drop constraint commands
EXEC sp_executesql @sql;


-- Step 2: Drop all tables
DECLARE @dropSql NVARCHAR(MAX) = '';

-- Build the drop table commands for all tables
SELECT @dropSql = @dropSql + 
    'DROP TABLE ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + '; '
FROM sys.tables;

-- Execute the drop table commands
EXEC sp_executesql @dropSql;