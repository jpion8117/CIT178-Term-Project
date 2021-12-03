USE termProject;
GO

/* View #1

-- Create View --
CREATE VIEW PodcastDirectoryClean (PodcastID, Name, Category, Subcategory, Studio, [Platform], [Subscribers (x1000)])
AS
SELECT PodcastDirectory.ID, PodcastDirectory.Name, Category.CategoryName, SubCategory.SubCatName, 
Studios.Name, Platforms.Name, PodcastDirectory.SubsX1000
FROM PodcastDirectory
JOIN Studios ON Studios.ID = StudioID
JOIN Platforms ON Platforms.ID = PlatformID
JOIN SubCategory ON SubCategory.SubCatID = PodcastDirectory.SubCategoryID
JOIN Category ON SubCategory.CategoryID = Category.CategoryID;
GO

-- Original Data --
SELECT * FROM PodcastDirectoryClean;
GO

-- Add additional Podcast --
UPDATE PodcastDirectoryClean
SET [Subscribers (x1000)] = 4
WHERE PodcastID = 1004;
GO

-- Updated data -- 
SELECT * FROM PodcastDirectoryClean;*/

/* View #2 
CREATE VIEW TopRatedPodcasts (PodcastID, Name, Category, Subcategory, Studio, [Platform], [Subscribers (x1000)], [Number of Rankings])
AS
SELECT PodcastDirectory.ID, PodcastDirectory.Name, Category.CategoryName, SubCategory.SubCatName, 
Studios.Name, Platforms.Name, PodcastDirectory.SubsX1000, (SELECT COUNT(*) FROM Top5 WHERE Top5.Podcast = PodcastDirectory.ID)
FROM PodcastDirectory
JOIN Studios ON Studios.ID = StudioID
JOIN Platforms ON Platforms.ID = PlatformID
JOIN SubCategory ON SubCategory.SubCatID = PodcastDirectory.SubCategoryID
JOIN Category ON SubCategory.CategoryID = Category.CategoryID
WHERE (SELECT COUNT(*) FROM Top5 WHERE Top5.Podcast = PodcastDirectory.ID) >= 3;
GO

SELECT * FROM TopRatedPodcasts;*/

/* View #3 
CREATE VIEW CurrentYearTop5 ([Rank], [Month], [Podcast Name])
AS
SELECT Ranking, DATENAME(MONTH, ListDate), PodcastDirectory.Name
FROM Top5
JOIN PodcastDirectory ON PodcastDirectory.ID = Podcast
WHERE YEAR(ListDate) = YEAR(GETDATE());
GO

SELECT * FROM CurrentYearTop5;*/

/* View #4 
CREATE VIEW WinsByStudio ([Studio Name], [Number of Ranking Shows])
AS
SELECT Studios.Name, COUNT(Studios.Name)
FROM Top5
JOIN PodcastDirectory ON Top5.Podcast = PodcastDirectory.ID
JOIN Studios ON PodcastDirectory.StudioID = Studios.ID
GROUP BY Studios.Name;
GO

SELECT * FROM WinsByStudio;*/