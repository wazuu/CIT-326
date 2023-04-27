USE [BowlingLeagueExample]
GO

-- 2 --

-- A --

CREATE LOGIN [ralph] WITH PASSWORD=N'password' MUST_CHANGE, DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [ralph]
GO

-- B --

USE BowlingLeagueExample
GO

SELECT roles.principal_id							AS RolePrincipalID
	, roles.name									AS RolePrincipleName
	, server_role_members.member_principal_id       AS MemberPricipalID
	, members.name									AS MemberPrincipalName
	, members.modify_date							AS ModifyDate
FROM sys.server_role_members AS server_role_members
INNER JOIN sys.server_principal_credentials AS roles
	ON server_role_members.role_principal_id = role_principal_id
INNER JOIN sys.server_principals AS members
	ON server_role_members.member_principal_id = members.principal_id
;


-- C --

DROP TABLE IF EXISTS sysadmin_check_$(ESCAPE_NONE(DATE));
CREATE TABLE sysadmin_check_$(ESCAPE_NONE(DATE))
    (
    username VARCHAR(30),
    type_desc VARCHAR(20) NULL,
    is_disabled BIT NULL
    ) ;

INSERT INTO sysadmin_check_$(ESCAPE_NONE(DATE)) 
SELECT 'Name' = sp.NAME
    ,type_desc
    ,sp.is_disabled AS [Is_disabled]
FROM sys.server_role_members rm
    ,sys.server_principals sp
WHERE rm.role_principal_id = SUSER_ID('Sysadmin')
    AND rm.member_principal_id = sp.principal_id;






