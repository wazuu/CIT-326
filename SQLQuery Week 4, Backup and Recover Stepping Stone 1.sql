USE [master]
BACKUP LOG [sample] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\sample_LogBackup_2022-10-05_18-06-05.bak' WITH NOFORMAT, NOINIT,  NAME = N'sample_LogBackup_2022-10-05_18-06-05', NOSKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 5
RESTORE DATABASE [sample_TEST] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\sample.bak' WITH  FILE = 1,  MOVE N'sample' TO N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sample_TEST.mdf',  MOVE N'sample_log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sample_TEST_log.ldf',  NOUNLOAD,  STATS = 5

GO


/* This was the final step of the first video in our stepping stone assignment week 4. .:|:. Tim Smith .:|:. BYU-Idaho .:|:.