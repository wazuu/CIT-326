/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [EmployeeID]
      ,[EmpFirstName]
      ,[EmpLastName]
      ,[EmpStreetAddress]
      ,[EmpCity]
      ,[EmpState]
      ,[EmpZipCode]
      ,[EmpAreaCode]
      ,[EmpPhoneNumber]
  FROM [SalesOrdersModify].[office].[Employees]


  /* I have watched, followed along, and completed video 2 of week 5 stepping stone. .:|:. Tim Smith .:|:. BYU-Idaho .:|:.