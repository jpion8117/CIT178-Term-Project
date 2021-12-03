USE termProject;

/*
	I needed some additional data to work with...

	These are actual subscriber numbers from the podcast app "Podcast Addict" because I wasn't
	thought it would be interesting to look at my podcast preferences from this angle anyway
*/

--create a subscriber column to hold subscriber counts (rounded to the nearest thousand)
/*
ALTER TABLE PodcastDirectory
ADD SubsX1000 int NULL;

GO

--add the data
UPDATE PodcastDirectory
SET SubsX1000 = 9
WHERE ID = 1000;

UPDATE PodcastDirectory
SET SubsX1000 = 2
WHERE ID = 1001;

UPDATE PodcastDirectory
SET SubsX1000 = 5
WHERE ID = 1002;

UPDATE PodcastDirectory
SET SubsX1000 = 6
WHERE ID = 1003;

UPDATE PodcastDirectory
SET SubsX1000 = 3
WHERE ID = 1004;

UPDATE PodcastDirectory
SET SubsX1000 = 35
WHERE ID = 1006;

UPDATE PodcastDirectory
SET SubsX1000 = 26
WHERE ID = 1007;

UPDATE PodcastDirectory
SET SubsX1000 = 130
WHERE ID = 1008;

UPDATE PodcastDirectory
SET SubsX1000 = 4
WHERE ID = 1009;

UPDATE PodcastDirectory
SET SubsX1000 = 12
WHERE ID = 1010;

UPDATE PodcastDirectory
SET SubsX1000 = 0
WHERE ID = 1011;

UPDATE PodcastDirectory
SET SubsX1000 = 178
WHERE ID = 1012;
*/

/* 
	QUERY #1

	Count up the total times a particular genre of podcast ranked in the
	top 5 countdown 

SELECT CategoryName, COUNT(CategoryName) AS CategoryWins
FROM Top5
JOIN PodcastDirectory ON Top5.Podcast = PodcastDirectory.ID
JOIN SubCategory ON PodcastDirectory.SubCategoryID = SubCategory.SubCatID
JOIN Category ON SubCategory.CategoryID = Category.CategoryID
GROUP BY CategoryName
ORDER BY CategoryName;*/


/* 
	QUERY #2

	Display the podcasts with the lowest, highest, and average number of subscribers

SELECT MIN(SubsX1000) AS 'Least Subscribers', MAX(SubsX1000) AS 'Most Subscribers', 
	AVG(SubsX1000) AS 'Average Subscribers' 
FROM PodcastDirectory;
*/

/*
	QUERY #3

	Display all the podcasts with subscriber data and how far above/below the average they are
	With some help from Google, I kind of jumped ahead here to subqueries but I had the idea and
	wanted to make it work...

SELECT Name, SubsX1000, SubsX1000 - (SELECT AVG(SubsX1000) FROM PodcastDirectory) AS 'Diff from Avg Subs'
FROM PodcastDirectory
GROUP BY Name, SubsX1000
HAVING SubsX1000 > -1
ORDER BY Name;*/


/*
	QUERY #4

	Displays the average sub count of podcasts listed in my top5's

SELECT MIN(SubsX1000) AS MinTop5, MAX(SubsX1000) AS MaxTop5 ,AVG(SubsX1000) AS AverageTop5
FROM Top5
JOIN PodcastDirectory ON Top5.Podcast = PodcastDirectory.ID
*/