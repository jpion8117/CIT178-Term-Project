/*
	Josh Pion
	CIT178 Term Project Milestone #2
*/

CREATE DATABASE termProject;

GO
USE termProject;

/* Setup and configure Categories table */
CREATE TABLE Category(
	CategoryID VARCHAR(4) NOT NULL,
	CategoryName VARCHAR(30) NOT NULL
);

ALTER TABLE Category
ADD CONSTRAINT PK_CategoryID PRIMARY KEY(CategoryID);

/* Setup and configure SubCategory table */
CREATE TABLE SubCategory(
	SubCatID VARCHAR(4) NOT NULL,
	SubCatName VARCHAR(30)NOT NULL,
	CategoryID VARCHAR(4) NOT NULL,
	Description VARCHAR(120) NULL
);

ALTER TABLE SubCategory
ADD CONSTRAINT PK_SubCatID PRIMARY KEY(SubCatID);
ALTER TABLE SubCategory
ADD CONSTRAINT FK_CategoryID FOREIGN KEY(CategoryID) REFERENCES Category(CategoryID);

/* Setup and configure Platforms table */
CREATE TABLE Platforms(
	ID VARCHAR(3) NOT NULL,
	Name VARCHAR(30) NOT NULL
);

ALTER TABLE Platforms
ADD CONSTRAINT PK_PlatformID PRIMARY KEY(ID);

/* Setup and configure Studios table */
CREATE TABLE Studios(
	ID int NOT NULL,
	Name VARCHAR(30) NOT NULL,
	Location VARCHAR(30) NULL,
);

ALTER TABLE Studios
ADD CONSTRAINT PK_StudioID PRIMARY KEY(ID);

/* Setup and configure Podcasts table */
CREATE TABLE PodcastDirectory(
	ID int NOT NULL,
	Name VARCHAR(30)NOT NULL,
	StudioID int NOT NULL,
	PlatformID VARCHAR(3) NOT NULL,
	SubCategoryID VARCHAR(4)
);

ALTER TABLE PodcastDirectory
ADD CONSTRAINT PK_PodcastID PRIMARY KEY(ID);
ALTER TABLE PodcastDirectory
ADD CONSTRAINT FK_SubCategoryID FOREIGN KEY(SubCategoryID) REFERENCES SubCategory(SubCatID);
ALTER TABLE PodcastDirectory
ADD CONSTRAINT FK_PlatformID FOREIGN KEY(PlatformID) REFERENCES Platforms(ID);
ALTER TABLE PodcastDirectory
ADD CONSTRAINT FK_StudioID FOREIGN KEY(StudioID) REFERENCES Studios(ID);

/* Setup and configure Top5 table */
CREATE TABLE Top5(
	ID int NOT NULL,
	ListDate date NOT NULL,
	Ranking int NOT NULL,
	Podcast int NOT NULL,	
	CONSTRAINT CHK_Rank CHECK(Ranking>=1 AND Ranking <=5)
);

ALTER TABLE Top5
ADD CONSTRAINT PK_Top5ID PRIMARY KEY(ID);
ALTER TABLE Top5
ADD CONSTRAINT FK_PodcastID FOREIGN KEY(Podcast) REFERENCES PodcastDirectory(ID);