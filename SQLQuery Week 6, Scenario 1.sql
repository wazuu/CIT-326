-- Scenario 1 -- Tim Smith -- CIT 326 -- Week / Sencario 6 --


USE [master]

BACKUP DATABASE [Karl_Bowling] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Karl_Bowling.bak' WITH NOFORMAT, NOINIT,  NAME = N'Karl_Bowling-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

-- Practice deleting the database --

DROP DATABASE [Karl_Bowling]
GO

-- Show restoring the database --