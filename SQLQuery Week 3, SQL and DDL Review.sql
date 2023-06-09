--SALES ORDERS DATABASE

--1. List customers and the dates they placed an order, sorted in order date sequence.

SELECT orders.OrderDate, customers.CustFirstName, customers.CustLastName 
FROM orders 
INNER JOIN customers 
USING (CustomerID) 
ORDER BY orders.OrderDate, customers.CustFirstName

--2. List employees and the customers for whom they booked an order.

SELECT DISTINCT CONCAT(employees.EmpFirstName, ' ', employees.EmpLastName) AS Employee, CONCAT(customers.CustFirstName, ' ', customers.CustLastName) AS Customer 
FROM (employees 
INNER JOIN orders 
USING (EmployeeID)) 
INNER JOIN customers 
USING (CustomerID) 
ORDER BY employees.EmpFirstName, customers.CustFirstName

--3. Display all orders, the products in each order, and the amount owed for each product, in order number sequence.

SELECT orders.OrderNumber, orders.OrderDate, products.ProductName, order_details.QuantityOrdered, order_details.QuotedPrice 
FROM (orders 
INNER JOIN order_details 
USING (OrderNumber)) 
INNER JOIN products 
USING (ProductNumber) 
ORDER BY orders.OrderNumber, orders.OrderDate, products.ProductName

--4. Show me the vendors and the products they supply to us for products that cost less than $100.

SELECT vendors.VendName, products.ProductName, product_vendors.WholesalePrice 
FROM (vendors 
INNER JOIN product_vendors 
USING (VendorID)) 
INNER JOIN products 
USING (ProductNumber) 
WHERE product_vendors.WholesalePrice < '100' 
ORDER BY vendors.VendName, products.ProductName

--5. Show me customers and employees who have the same last name

SELECT CONCAT(customers.CustFirstName, ' ',customers.CustLastName) AS Customer, 
       CONCAT(employees.EmpFirstName, ' ', customers.CustLastName) AS Employee 
FROM customers 
INNER JOIN employees 
ON customers.CustLastName=employees.EmpLastName
ORDER BY customers.CustFirstName, employees.EmpFirstName

--6. Show me customers and employees who live in the same city.

SELECT CONCAT(customers.CustFirstName, ' ',customers.CustLastName) AS Customer, 
       CONCAT(employees.EmpFirstName, ' ', customers.CustLastName) AS Employee, customers.CustCity AS City 
FROM customers 
INNER JOIN employees 
ON customers.CustCity=employees.EmpCity 
ORDER BY customers.CustFirstName, employees.EmpFirstName

--ENTERTAINMENT AGENCY DATABASE

--1. Display agents and the engagement dates they booked, sorted by booking start date.

SELECT CONCAT(agents.AgtFirstName, ' ',agents.AgtLastName) AS Agent, engagements.StartDate 
FROM agents 
INNER JOIN engagements 
USING (AgentID) 
ORDER BY engagements.StartDate

--2. List customers and the entertainers they booked.

SELECT DISTINCT CONCAT (CustFirstName, ' ', CustLastName) AS Customer, entertainers.EntStageName AS Entertainer 
FROM (customers 
INNER JOIN engagements 
USING (CustomerID)) 
INNER JOIN entertainers 
USING (EntertainerID)

--3. Find the agents and entertainers who live in the same postal code.

SELECT DISTINCT CONCAT (AgtFirstName, ' ', AgtLastName) AS Agent, entertainers.EntStageName AS Entertainer, agents.AgtZipCode AS ZipCode 
FROM agents 
INNER JOIN entertainers 
ON agents.AgtZipCode=entertainers.EntZipCode

--SCHOOL SCHEDULING DATABASE

--1. Display buildings and all the classrooms in each building.

SELECT buildings.BuildingName, class_rooms.ClassRoomID 
FROM buildings 
INNER JOIN class_rooms 
USING (BuildingCode)

--2. List students and all the classes in which they are currently enrolled.

SELECT DISTINCT CONCAT(students.StudFirstName, ' ', students.StudLastName) AS StudentName, classes.ClassID, subjects.SubjectName 
FROM ((students 
INNER JOIN student_schedules 
USING (StudentID)) 
INNER JOIN classes 
USING (ClassID)) 
INNER JOIN subjects 
USING (SubjectID)

--3. List the faculty staff and the subject each teaches.

SELECT DISTINCT CONCAT(staff.StfFirstName, ' ', staff.StfLastName) AS StaffName, subjects.SubjectName 
FROM (Staff 
INNER JOIN faculty_subjects 
USING (StaffID)) 
INNER JOIN subjects 
USING (SubjectID)

--4. Show me the students who have a grade of 85 or better in art and who also have a grade of 85 or better in any computer course.

SELECT CONCAT(students.StudFirstName, ' ',students.StudLastName) AS StudentName, subjects.SubjectName, student_schedules.Grade 
FROM ((students 
INNER JOIN student_schedules 
USING (StudentID)) 
INNER JOIN classes 
USING (ClassID)) 
INNER JOIN subjects 
USING (SubjectID) 
WHERE (subjects.SubjectName LIKE '%art%' AND student_schedules.Grade >= '85') 
      AND (subjects.SubjectName LIKE '%computer%' AND student_schedules.Grade >= '85')

--BOWLING LEAGUE DATABASE 

--1. List the bowling teams and all the team members.

SELECT teams.TeamName, CONCAT(bowlers.BowlerFirstName, ' ', bowlers.BowlerLastName) AS Members 
FROM teams 
INNER JOIN bowlers 
ON teams.TeamID=bowlers.TeamID 
ORDER BY teams.TeamName, bowlers.BowlerFirstName 

--2. Display the bowlers, the matches they played in, and the bowler game scores. 

SELECT bowlerID, CONCAT(bowlers.BowlerFirstName, ' ', bowlers.BowlerLastName) AS Players
FROM bowlers 
INNER JOIN matches 
Using (bowler.games)
ORDER BY matches;

--3. Find the bowlers who live in the same ZIP Code.

SELECT bowler_scores.MatchID, CONCAT(bowlers.BowlerFirstName, ' ',bowlers.BowlerLastName) AS BowlerName, bowler_scores.GameNumber, 
       bowler_scores.RawScore, bowler_scores.HandiCapScore 
FROM bowlers 
INNER JOIN bowler_scores 
USING (BowlerID)

--RECIPES DATABASE

--1. List all the recipes for salads.

SELECT recipes.RecipeTitle 
FROM recipes 
INNER JOIN recipe_classes 
USING (RecipeClassID) 
WHERE recipe_classes.RecipeClassDescription = 'salad'

--2. List all recipes that contain a dairy ingredient.

SELECT DISTINCT recipes.RecipeTitle AS RecipesContainingDairy 
FROM ((recipes 
INNER JOIN recipe_ingredients 
USING (RecipeID)) 
INNER JOIN ingredients 
USING (IngredientID)) 
INNER JOIN ingredient_classes 
USING (IngredientClassID) 
WHERE ingredient_classes.IngredientClassDescription = 'dairy'

--3. Find the ingredients that use the same default measurement amount.

SELECT one.FirstIngredient, one.Measurement, two.SecondIngredient 
FROM (SELECT ingredients.IngredientName AS FirstIngredient, measurements.MeasurementDescription AS Measurement 
     FROM ingredients 
     INNER JOIN measurements 
     USING (MeasureAmountID)) 
     AS one 
INNER JOIN (SELECT ingredients.IngredientName AS SecondIngredient, measurements.MeasurementDescription AS Measurement 
     FROM ingredients 
     INNER JOIN measurements
     USING (MeasureAmountID)) 
     AS two 
ON one.Measurement=two.Measurement 
WHERE one.FirstIngredient<>two.SecondIngredient

--4. Show me the recipes that have beef and garlic.

SELECT BeefRecipes.RecipeTitle 
FROM (SELECT recipes.RecipeID, recipes.RecipeTitle
     FROM (recipes 
     INNER JOIN recipe_ingredients 
     USING (RecipeID)) 
     INNER JOIN ingredients 
     USING (IngredientID) 
     WHERE ingredients.IngredientName = 'beef') 
     AS BeefRecipes 
INNER JOIN (SELECT recipes.RecipeID, recipes.RecipeTitle 
     FROM (recipes 
     INNER JOIN recipe_ingredients 
     USING (RecipeID)) 
     INNER JOIN ingredients 
     USING (IngredientID) 
     WHERE ingredients.IngredientName = 'garlic') 
     AS GarlicRecipes 
ON BeefRecipes.RecipeID=GarlicRecipes.RecipeID