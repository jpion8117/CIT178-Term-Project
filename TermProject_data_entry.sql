
USE termProject;

DELETE Top5;
DELETE PodcastDirectory;
DELETE Platforms;
DELETE Studios;
Delete SubCategory;
DELETE Category;

GO

INSERT INTO Category VALUES ('NEWS', 'News')
INSERT INTO Category VALUES ('ENT', 'Entertainment')
INSERT INTO Category VALUES ('TC', 'True Crime')
INSERT INTO Category VALUES ('NAR', 'Naritive')
INSERT INTO Category VALUES ('INFO', 'Informative')

INSERT INTO Studios VALUES (1000,'Independent Podcast','NULL')
INSERT INTO Studios VALUES (1001,'Rooster Teeth Productions','Texas')
INSERT INTO Studios VALUES (1002,'Crooked Media','California')
INSERT INTO Studios VALUES (1003,'The GV Network','Texas')
INSERT INTO Studios VALUES (1004,'The Ringer','NULL')
INSERT INTO Studios VALUES (1005,'Linus Tech Tips','Brittish Columbia (CAN)')
INSERT INTO Studios VALUES (1006,'TNP Studios','NULL')

INSERT INTO Platforms VALUES ('ALL','All Platforms')
INSERT INTO Platforms VALUES ('SPT','Spotify')
INSERT INTO Platforms VALUES ('AUD','Audible')
INSERT INTO Platforms VALUES ('RSS','Direct/RSS')
INSERT INTO Platforms VALUES ('OTR','Other')

INSERT INTO SubCategory VALUES ('COM','Comedy','ENT','Primary purpose is to make you laugh')
INSERT INTO SubCategory VALUES ('POL','Politics','NEWS','Covers topics of politics and political news')
INSERT INTO SubCategory VALUES ('IMP','Improv','NAR','Improvised narritive story')
INSERT INTO SubCategory VALUES ('GAME','Video Games','NEWS','All things video games')
INSERT INTO SubCategory VALUES ('TECH','Tech News','NEWS','News podcasts involving tech')
INSERT INTO SubCategory VALUES ('VAR','Variety','ENT','No real topic, just good conversation/stories')
INSERT INTO SubCategory VALUES ('DIS','Disaster Story','TC','True stories involving disasters, either natural or man-made')
INSERT INTO SubCategory VALUES ('USM','Unsolved Mystery','TC','Mysteries that are ether unsolved or open to interpretation')
INSERT INTO SubCategory VALUES ('CRME','Crime','TC','Anything having to do with actual crime')
INSERT INTO SubCategory VALUES ('EDU','Educational','INFO','Learning something is the goal')
INSERT INTO SubCategory VALUES ('HST','History','INFO','Deals with historical events')
INSERT INTO SubCategory VALUES ('FD','Food','ENT','Focus on food, reviews, recipies, etc.')

INSERT INTO PodcastDirectory VALUES (1000,'Black Box Down',1001,'ALL','DIS')
INSERT INTO PodcastDirectory VALUES (1001,'Dense Pixels Podcast',1006,'ALL','GAME')
INSERT INTO PodcastDirectory VALUES (1002,'Face Jam',1001,'ALL','FD')
INSERT INTO PodcastDirectory VALUES (1003,'Good Morning From Hell',1001,'ALL','IMP')
INSERT INTO PodcastDirectory VALUES (1004,'I Don''t Know About That',1000,'ALL','COM')
INSERT INTO PodcastDirectory VALUES (1005,'Larry Wilmore: Black on the Air',1004,'ALL','POL')
INSERT INTO PodcastDirectory VALUES (1006,'Off Topic',1001,'ALL','VAR')
INSERT INTO PodcastDirectory VALUES (1007,'On The Spot',1001,'ALL','IMP')
INSERT INTO PodcastDirectory VALUES (1008,'Pod Save America',1002,'ALL','POL')
INSERT INTO PodcastDirectory VALUES (1009,'The WAN Show',1005,'ALL','TECH')
INSERT INTO PodcastDirectory VALUES (1010,'This Land',1002,'ALL','HST')
INSERT INTO PodcastDirectory VALUES (1011,'Wrong Side of 30',1003,'ALL','VAR')
INSERT INTO PodcastDirectory VALUES (1012,'Rooster Teeth Podcast',1001,'ALL','VAR')
INSERT INTO PodcastDirectory VALUES (1013,'Wind of Change',1002,'SPT','USM')
INSERT INTO PodcastDirectory VALUES (1014,'60 Songs That Explain the 90''s',1004,'SPT','COM')

INSERT INTO Top5 VALUES (1,'2019/1/1',1,1008);
INSERT INTO Top5 VALUES (2,'2019/1/1',2,1010);
INSERT INTO Top5 VALUES (3,'2019/1/1',3,1006);
INSERT INTO Top5 VALUES (4,'2019/1/1',4,1012);
INSERT INTO Top5 VALUES (5,'2019/1/1',5,1007);
INSERT INTO Top5 VALUES (6,'2019/6/1',1,1012);
INSERT INTO Top5 VALUES (7,'2019/6/1',2,1006);
INSERT INTO Top5 VALUES (8,'2019/6/1',3,1001);
INSERT INTO Top5 VALUES (9,'2019/6/1',4,1009);
INSERT INTO Top5 VALUES (10,'2019/6/1',5,1010);
INSERT INTO Top5 VALUES (11,'2020/1/1',1,1001);
INSERT INTO Top5 VALUES (12,'2020/1/1',2,1006);
INSERT INTO Top5 VALUES (13,'2020/1/1',3,1002);
INSERT INTO Top5 VALUES (14,'2020/1/1',4,1004);
INSERT INTO Top5 VALUES (15,'2020/1/1',5,1003);
INSERT INTO Top5 VALUES (16,'2020/6/1',1,1011);
INSERT INTO Top5 VALUES (17,'2020/6/1',2,1012);
INSERT INTO Top5 VALUES (18,'2020/6/1',3,1004);
INSERT INTO Top5 VALUES (19,'2020/6/1',4,1000);
INSERT INTO Top5 VALUES (20,'2020/6/1',5,1008);
INSERT INTO Top5 VALUES (21,'2021/1/1',1,1013);
INSERT INTO Top5 VALUES (22,'2021/1/1',2,1011);
INSERT INTO Top5 VALUES (23,'2021/1/1',3,1008);
INSERT INTO Top5 VALUES (24,'2021/1/1',4,1004);
INSERT INTO Top5 VALUES (25,'2021/1/1',5,1012);
INSERT INTO Top5 VALUES (26,'2021/6/1',1,1013);
INSERT INTO Top5 VALUES (27,'2021/6/1',2,1011);
INSERT INTO Top5 VALUES (28,'2021/6/1',3,1004);
INSERT INTO Top5 VALUES (29,'2021/6/1',4,1001);
INSERT INTO Top5 VALUES (30,'2021/6/1',5,1003);