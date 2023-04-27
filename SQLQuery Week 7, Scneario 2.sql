/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [username]
      ,[type_desc]
      ,[is_disabled]
  FROM [BowlingLeagueExample].[dbo].[sysadmin_check_20221028]