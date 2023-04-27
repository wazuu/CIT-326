USE BowlingLeagueExample;
UPDATE [dbo].[Bowlers]
SET BowlerEmail = trim(bowlerfirstname) + trim(bowlerlastname) + '@gmail.com'
GO