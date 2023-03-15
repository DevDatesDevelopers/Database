CREATE ROLE [db_admin] AUTHORIZATION [dbo];
GO

EXEC sp_addrolemember 'db_owner', 'db_admin';
GO