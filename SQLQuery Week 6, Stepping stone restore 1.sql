SELECT * FROM project;
;
INSERT INTO project VALUES ('p4', 'Rexburg Rapids', 150000.00);
SELECT GETDATE();
--2022-10-17 20:50:36.120

INSERT INTO project VALUES ('p5', 'Barnum', 145000.00);
SELECT GETDATE();
--2022-10-17 20:53:55.813

BACKUP LOG [sample] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\sampletlog.trn' WITH NOFORMAT, NOINIT,  NAME = N'sample-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--2022-10-17 20:56:38.510

DELETE FROM project;

BACKUP LOG [sample] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\sampletlog3.trn' WITH NOFORMAT, NOINIT,  NAME = N'sample-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO