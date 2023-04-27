DECLARE @Counter INT
SET @Counter = (SELECT MAX(e.emp_no) FROM dbo.employee AS e)
WHILE (@Counter < 50000)
BEGIN
INSERT INTO dbo.employee 
VALUES
(@Counter, 'Test', 'Student #' + CAST(@Counter AS VARCHAR), 'd1')
COMMIT
SET @Counter = @Counter + 1
END;