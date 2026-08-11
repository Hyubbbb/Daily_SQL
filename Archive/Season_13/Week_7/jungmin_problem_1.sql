-- https://solvesql.com/problems/find-movies-by-korean-artists/
SELECT
    at.name AS artist,
    aw.title
FROM artists AS at
    JOIN artworks_artists AS aa
        ON at.artist_id = aa.artist_id
    JOIN artworks AS aw
        ON aw.artwork_id = aa.artwork_id
WHERE 1=1
    AND at.nationality = 'Korean'
    AND aw.classification = 'Film'
