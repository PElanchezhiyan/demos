USE [AdventureWorks2017]

-- Look at 05_ObjectSizeAndCompression.sql

-- 1) T-SQL
-- Apply compression to the Clustered Index
ALTER TABLE [Sales].[SalesOrderDetail] REBUILD PARTITION = ALL
WITH (DATA_COMPRESSION = ROW)

-- Apply compression to the NC Index
ALTER INDEX [IX_SalesOrderDetail_ProductID] 
ON [Sales].[SalesOrderDetail] REBUILD PARTITION = ALL 
WITH (DATA_COMPRESSION = ROW)

-- Look at 05_ObjectSizeAndCompression.sql

-- 2) SSMS GUI
-- Right click on table or index > Storage > Manage Compression


--RESET SO POWERSHELL FINDS IT

ALTER TABLE [Sales].[SalesOrderDetail] REBUILD PARTITION = ALL
WITH (DATA_COMPRESSION = NONE)

-- Apply compression to the NC Index
ALTER INDEX [IX_SalesOrderDetail_ProductID] 
ON [Sales].[SalesOrderDetail] REBUILD PARTITION = ALL 
WITH (DATA_COMPRESSION = NONE)

