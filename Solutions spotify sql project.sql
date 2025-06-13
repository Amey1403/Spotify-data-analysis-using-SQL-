create database company_a_spotify;
use company_a_spotify;
rename table cleaned_dataset to spotify; 
select * from spotify; 

-- 1. Retrieve the names of all tracks that have more than 1 billion streams.
--
 select * from spotify;
SELECT Track, Stream
FROM spotify
WHERE Stream > 1000000000 ;

-- 2. Find all tracks that belong to the album type single.
select * from spotify;
select track,Album_type
from spotify
where Album_type='single'; 

-- 3. Get the total number of comments for tracks where licensed = TRUE.
-- 
SELECT SUM(Comments) AS total_comments
FROM spotify
WHERE Licensed = TRUE;

-- 4.  List all albums along with their respective artists.
select * from spotify;
SELECT DISTINCT Album, Artist
FROM spotify; 

-- 5.Count the total number of tracks by each artist.

select Artist, count(Track) as total_tracks
from spotify
group by Artist;  

-- 6. Calculate the average danceability of tracks in each album.
--
select * from spotify;
select Album, avg(Danceability)
from spotify
group by Album; 

-- 7.Find the top 5 tracks with the highest energy values.
--
select * from spotify;
select Track, Energy
from spotify
order by Energy desc 
limit 5;  

-- 8.List all tracks along with their views and likes where official_video = TRUE.
select* from spotify; 
--
select Track, Views,Likes
from spotify
where official_video='TRUE';  

-- 9. For each album, calculate the total views of all associated tracks.
--
select * FROM spotify; 
select Album,sum(Views) as total_views
from spotify
group by Album ; 
-- 10. Write a query to find tracks where the liveness score is above the average.
--
select * FROM spotify; 
SELECT Track, Liveness
FROM spotify
WHERE Liveness > (
    SELECT AVG(Liveness) FROM spotify
);
-- 11. Find the top 3 most-viewed tracks for each artist using window functions.
SELECT *  
FROM (
    SELECT 
        Track,
        Artist,
        Views,
        ROW_NUMBER() OVER (PARTITION BY Artist ORDER BY Views DESC) AS rn
    FROM spotify
) AS rank_data
WHERE rn <= 3; 
 