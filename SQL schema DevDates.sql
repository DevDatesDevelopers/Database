CREATE TABLE Genders (
Id INT PRIMARY KEY,
DisplayName VARCHAR(255),
Created DATETIME,
Modified DATETIME,
ModifiedBy VARCHAR(255)
);

CREATE TABLE Users (
Id INT PRIMARY KEY,
Name VARCHAR(255),
DateOfBirth DATETIME,
GenderId INT,
Bio VARCHAR(255),
Email VARCHAR(255),
Created DATETIME,
Modified DATETIME,
ModifiedBy VARCHAR(255),
FOREIGN KEY (GenderId) REFERENCES Genders(Id)
);

CREATE TABLE ResourcesTypes (
Id INT PRIMARY KEY,
DisplayName VARCHAR(255),
Created DATETIME,
Modified DATETIME,
ModifiedBy VARCHAR(255)
);

CREATE TABLE Resources (
Id INT PRIMARY KEY,
ResourceURI VARCHAR(255),
ResourceTypeId INT,
FOREIGN KEY (ResourceTypeId) REFERENCES ResourcesTypes(Id)
);

CREATE TABLE Interests (
Id INT PRIMARY KEY,
DisplayName VARCHAR(255),
Created DATETIME,
Modified DATETIME,
ModifiedBy VARCHAR(255)
);

CREATE TABLE InterestsResources (
InterestId INT,
ResourceId INT,
PRIMARY KEY (InterestId, ResourceId),
FOREIGN KEY (InterestId) REFERENCES Interests(Id),
FOREIGN KEY (ResourceId) REFERENCES Resources(Id)
);

CREATE TABLE UsersResources (
UserId INT,
ResourceId INT,
PRIMARY KEY (UserId, ResourceId),
FOREIGN KEY (UserId) REFERENCES Users(Id),
FOREIGN KEY (ResourceId) REFERENCES Resources(Id)
);

CREATE TABLE GendersResources (
GenderId INT,
ResourceId INT,
PRIMARY KEY (GenderId, ResourceId),
FOREIGN KEY (GenderId) REFERENCES Genders(Id),
FOREIGN KEY (ResourceId) REFERENCES Resources(Id)
);

CREATE TABLE UsersPreferences (
UserId INT,
GenderId INT,
Created DATETIME,
PRIMARY KEY (UserId, GenderId),
FOREIGN KEY (UserId) REFERENCES Users(Id),
FOREIGN KEY (GenderId) REFERENCES Genders(Id)
);

CREATE TABLE UsersInterests (
UserId INT,
InterestId INT,
PRIMARY KEY (UserId, InterestId),
FOREIGN KEY (UserId) REFERENCES Users(Id),
FOREIGN KEY (InterestId) REFERENCES Interests(Id)
);

CREATE TABLE Likes (
LikerId INT,
LikedId INT,
Created DATETIME,
PRIMARY KEY (LikerId, LikedId),
FOREIGN KEY (LikerId) REFERENCES Users(Id),
FOREIGN KEY (LikedId) REFERENCES Users(Id)
);


ALTER TABLE Users 
	ADD CONSTRAINT FK_Users_Genders 
		FOREIGN KEY (GenderId) 
			REFERENCES Genders(Id);

ALTER TABLE UsersResources 
	ADD CONSTRAINT FK_UsersResources_Users 
		FOREIGN KEY (UserId) 
			REFERENCES Users(Id);

ALTER TABLE UsersResources 
	ADD CONSTRAINT FK_UsersResources_Resources 
		FOREIGN KEY (ResourceId) 
			REFERENCES Resources(Id);

ALTER TABLE GendersResources 
	ADD CONSTRAINT FK_GendersResources_Genders 
		FOREIGN KEY (GenderId) 
			REFERENCES Genders(Id);

ALTER TABLE GendersResources 
	ADD CONSTRAINT FK_GendersResources_Resources 
		FOREIGN KEY (ResourceId) 
			REFERENCES Resources(Id);

ALTER TABLE UsersPreferences 
	ADD CONSTRAINT FK_UsersPreferences_Users 
		FOREIGN KEY (UserId) 
			REFERENCES Users(Id);

ALTER TABLE UsersPreferences 
	ADD CONSTRAINT FK_UsersPreferences_Genders 
		FOREIGN KEY (GenderId) 
			REFERENCES Genders(Id);

ALTER TABLE Resources 
	ADD CONSTRAINT FK_Resources_ResourceTypes 
		FOREIGN KEY (ResourceTypeId) 
			REFERENCES ResourcesTypes(Id);

ALTER TABLE InterestsResources 
	ADD CONSTRAINT FK_InterestsResources_Interests 
		FOREIGN KEY (InterestId) 
			REFERENCES Interests(Id);

ALTER TABLE InterestsResources 
	ADD CONSTRAINT FK_InterestsResources_Resources 
		FOREIGN KEY (ResourceId) 
			REFERENCES Resources(Id);

ALTER TABLE UsersInterests 
	ADD CONSTRAINT FK_UsersInterests_Users 
		FOREIGN KEY (UserId) 
			REFERENCES Users(Id);

ALTER TABLE UsersInterests 
	ADD CONSTRAINT FK_UsersInterests_Interests 
		FOREIGN KEY (InterestId)
			REFERENCES Interests(Id);

ALTER TABLE Likes 
	ADD CONSTRAINT FK_Likes_Likers 
		FOREIGN KEY (LikerId) 
			REFERENCES Users(Id);

ALTER TABLE Likes 
	ADD CONSTRAINT FK_Likes_Liked 
		FOREIGN KEY (LikedId) 
			REFERENCES Users(Id);