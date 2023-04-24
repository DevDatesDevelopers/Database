CREATE LOGIN milenkov WITH PASSWORD = '********';

CREATE USER BoyanMilenkov FOR LOGIN milenkov;

exec sys.sp_addrolemember 'db_datareader', 'BoyanMilenkov';

exec sys.sp_addrolemember 'db_datawriter', 'BoyanMilenkov';

CREATE LOGIN class WITH PASSWORD = 'DevDatesPublic123';

CREATE USER PublicAccess FOR LOGIN class

exec sys.sp_addrolemember 'db_datareader', 'PublicAccess';

exec sys.sp_addrolemember 'db_datawriter', 'PublicAccess';