USE termProject;
GO
CREATE INDEX idx_podcasts ON Top5(Podcast);
GO
CREATE INDEX idx_category ON SubCategory(CategoryID);
GO
CREATE INDEX idx_studio ON PodcastDirectory(StudioID);
GO
CREATE INDEX idx_platform ON PodcastDirectory(PlatformID);
GO
CREATE INDEX idx_subCat ON PodcastDirectory(SubCategoryID);