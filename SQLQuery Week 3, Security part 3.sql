ALTER SCHEMA office TRANSFER customers;
GO



select 'ALTER SCHEMA office TRANSFER ' + name + ';' from sys.tables;

ALTER SCHEMA office TRANSFER Employees;
ALTER SCHEMA office TRANSFER Order_Details;
ALTER SCHEMA office TRANSFER Orders;