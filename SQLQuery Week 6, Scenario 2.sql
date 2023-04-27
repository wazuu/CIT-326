-- Scenario 2 -- Tim Smith -- CIT 326 -- Week / Scenario 6 --

SELECT * FROM project;

INSERT INTO project VALUES ('p5', 'NightHawk', 12); 

SELECT GETDATE();
-- 2022-10-22 19:26:51.493 --

INSERT INTO project VALUES ('p7', 'Mandalorian', 18);

SELECT GETDATE();

-- 2022-10-22 19:34:47.747 -- 



DELETE FROM project;

SELECT GETDATE();

-- 2022-10-22 19:38:36.883 --

BACKUP LOG [sample] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\sampletlog.trn' WITH NOFORMAT, NOINIT,  NAME = N'sample-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

