select moma.artist_id as artist_id , moma.name as name
from artists moma --모마 등록 작가 
left join artworks_artists atst 
on moma.artist_id = atst.artist_id
where moma.death_year is not null and 
atst.artwork_id is NULL
