
 USE termProject;
 GO

 /* Final Project Procedures */
 /* Stored Procedure #1 
	-- This procedure simply pulls a list of podcasts by their average ranking in the Top5 table
 CREATE PROC spGetPodcastsByAVGRank
 AS
 SELECT PodcastDirectory.Name AS PodcastName, (SELECT AVG(Ranking) FROM Top5 WHERE Top5.Podcast = PodcastDirectory.ID) AS AverageRank
 FROM PodcastDirectory
 JOIN Top5 ON top5.Podcast = PodcastDirectory.ID
 GROUP BY PodcastDirectory.Name, PodcastDirectory.ID
 ORDER BY AverageRank;

 EXEC spGetPodcastsByAVGRank;*/
 
 /* Stored Procedure #2 
	-- This procedure looks for the most relevant top five list from a given date
CREATE PROC spGetTop5ByDate
	@searchDate DATE
AS
BEGIN
	-- Declare additional vars
	DECLARE @lowDate DATE;
	DECLARE @highDate DATE;
	DECLARE @listDate DATE;

	-- narrow search to lowest date above and below search
	SET @lowDate = (SELECT MAX(ListDate) FROM Top5 WHERE @searchDate>=ListDate);
	SET @highDate = (SELECT MIN(ListDate) FROM Top5 WHERE @searchDate<=ListDate);

	-- check which date is closer to the search date
	IF DATEDIFF(DAY, @highDate, @searchDate) > DATEDIFF(DAY, @searchDate, @lowDate)
		SET @listDate = @highDate;
	ELSE
		SET @listDate = @lowDate;

	-- execute the SELECT for the found date
	SELECT Ranking, PodcastDirectory.Name AS Podcast, Category.CategoryName AS Category, SubCategory.SubCatName AS SubCategory, ListDate AS [List Compiled Date]
	FROM Top5
	JOIN PodcastDirectory ON Top5.Podcast = PodcastDirectory.ID
	JOIN SubCategory ON SubCategory.SubCatID = PodcastDirectory.SubCategoryID
	JOIN Category ON SubCategory.CategoryID = Category.CategoryID
	WHERE ListDate = @listDate;
END

EXEC spGetTop5ByDate '2020-7-17';*/

 /* Stored Procedure #3 
	-- This one takes a podcast name or partial name and sees how many times that podcast has ranked number 1
	-- I will admit... I kind of have this one pulling double duty as it also returns -1 if there is an error.
CREATE PROC spCountTopRankings
	@SearchName VARCHAR(35), 
	@NumberOfTopRankings INT OUTPUT,
	@PodcastName VARCHAR(30) OUTPUT
AS
BEGIN
	SET @SearchName = '%' + @SearchName + '%'; --adds the wild card symbol to the begining and end of the string.

	--check if there is a match to a podcast in the directory
	IF (SELECT COUNT(*) FROM PodcastDirectory WHERE Name LIKE @SearchName)=0
	BEGIN
		PRINT 'Your search for "' + @SearchName + '" returned no results. Please try again...'
		RETURN -1;
	END;

	--check if search returned more than one result and print an error if so
	IF (SELECT COUNT(*) FROM PodcastDirectory WHERE Name LIKE @SearchName)>1
	BEGIN
		PRINT 'Your search for "' + @SearchName + '" returned more than one result. Please try a more specific search...'
		RETURN -1;
	END;

	--count up the number of times the podcast placed in the first rank

	SELECT @NumberOfTopRankings = COUNT(*) 
	FROM Top5
	JOIN PodcastDirectory ON Top5.Podcast = PodcastDirectory.ID
	WHERE Name LIKE @SearchName;

	--set the podcast name output parameter
	SELECT @PodcastName =Name
	FROM PodcastDirectory
	WHERE Name LIKE @SearchName;
END
GO
DECLARE @topRankCount INT;
DECLARE @podcastName VARCHAR(30);
DECLARE @error INT;
EXEC @error = spCountTopRankings 'Wind', @topRankCount OUTPUT, @podcastName OUTPUT;
IF @error = -1
	PRINT 'There was an issue finding the podcast you requested...'
ELSE
	PRINT @podcastName + ' has ranked number 1, ' + CONVERT(VARCHAR, @topRankCount) + ' times!';*/

/* Final Project User Defined Functions */
/* UDF #1 
CREATE FUNCTION dbo.fnFindPodcast(@searchName VARCHAR(32))
	RETURNS VARCHAR(30)
AS
BEGIN
	SET @searchName = '%' + @searchName + '%'; --adds the wild card symbol to the begining and end of the string.

	--check if there is a match to a podcast in the directory
	IF (SELECT COUNT(*) FROM PodcastDirectory WHERE Name LIKE @searchName)=0
	BEGIN
		RETURN 'No results found...';
	END;

	--check if search returned more than one result and print an error if so
	IF (SELECT COUNT(*) FROM PodcastDirectory WHERE Name LIKE @searchName)>1
	BEGIN
		RETURN 'Multiple podcasts found...';
	END;

	RETURN (SELECT Name FROM PodcastDirectory WHERE Name LIKE @searchName);
END;
GO
PRINT dbo.fnFindPodcast('Pod sav');

/* UDF #2*/
CREATE FUNCTION dbo.fnFindShowsByCategory(@Category VARCHAR(30))
	RETURNS table
	RETURN (
		SELECT PodcastDirectory.Name AS Podcast, SubCategory.SubCatName AS SubCategory, Category.CategoryName AS Category,
			PodcastDirectory.SubsX1000
		FROM PodcastDirectory
		JOIN SubCategory ON SubCategory.SubCatID = PodcastDirectory.SubCategoryID
		JOIN Category ON Category.CategoryID = SubCategory.CategoryID
		WHERE Category.CategoryName LIKE '%' + @Category + '%')
GO
SELECT * FROM dbo.fnFindShowsByCategory('news'); */

/* Final Project Triggers */

/* Setup Archive Table 
--creating table
IF OBJECT_ID('Top5Archive') IS NOT NULL
	DROP TABLE Top5Archive;
GO
SELECT * INTO Top5Archive
FROM Top5
WHERE 1=0;

-- adding a status column
ALTER TABLE Top5Archive ADD Activity VARCHAR(30);
GO*/

/* DELETE Trigger 
-- create delete trigger
IF OBJECT_ID('Top5_Delete') IS NOT NULL
	DROP TRIGGER Top5_Delete;
GO
CREATE TRIGGER Top5_Delete ON Top5
	AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Top5Archive (ID, ListDate, Ranking, Podcast)
	SELECT ID, ListDate, Ranking, Podcast FROM DELETED

	UPDATE Top5Archive SET Activity = 'DELETED' WHERE Activity IS NULL
END;
GO*/

/* INSERT trigger 
CREATE TRIGGER Top5_Insert ON Top5
	AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @ID INT;
	DECLARE @ListDate DATE;
	DECLARE @Ranking INT;
	DECLARE @Podcast INT;
SELECT @ID = ID, @ListDate = ListDate, @Ranking = Ranking, @Podcast = Podcast FROM INSERTED;

INSERT INTO Top5Archive VALUES(@ID, @ListDate, @Ranking, @Podcast, 'INSERTED');
END;
GO*/

/* UPDATE trigger 
CREATE TRIGGER Top5_Update ON Top5
	AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Top5Archive (ID, ListDate, Ranking, Podcast)
	SELECT ID, ListDate, Ranking, Podcast FROM inserted;

	UPDATE Top5Archive SET Activity = 'UPDATED' WHERE Activity IS NULL;
END;
GO*/

/* Test all triggers 
INSERT INTO Top5 VALUES(111,GETDATE(),1,1000);
UPDATE Top5 SET Podcast = 1001 WHERE ID = 111;
DELETE Top5 WHERE ID = 111;

SELECT * FROM Top5Archive;*/