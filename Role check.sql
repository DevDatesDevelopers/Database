SELECT 
    USER_NAME(member_principal_id) AS UserName,
    USER_NAME(role_principal_id) AS RoleName
FROM 
    sys.database_role_members
WHERE 
    USER_NAME(member_principal_id) = 'PublicAccess';



SELECT name FROM sys.database_principals WHERE name = 'PublicAccess' AND type_desc = 'SQL_USER';
