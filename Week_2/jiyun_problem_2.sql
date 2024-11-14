SELECT artist_id, name
FROM artists
WHERE death_year IS NOT NULL
  AND artist_id NOT IN (SELECT artist_id 
                        FROM artworks_artists art
                          JOIN artworks works
                            ON art.artwork_id = works.artwork_id)
