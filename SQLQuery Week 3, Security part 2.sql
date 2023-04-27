/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [CustomerID]
      ,[CustFirstName]
      ,[CustLastName]
      ,[CustStreetAddress]
      ,[CustCity]
      ,[CustState]
      ,[CustZipCode]
      ,[CustAreaCode]
      ,[CustPhoneNumber]
  FROM [SalesOrdersModify].[office].[Customers]


  -- I have watched the second video of the assignment -- .:|:. Tim Smith .:|:. BYU-Idaho .:|:.