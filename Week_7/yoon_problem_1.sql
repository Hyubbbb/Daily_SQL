select book_id, author_name, date_format(published_date, '%Y-%m-%d') as published_date
from book, author
where book.author_id=author.author_id
and category='경제'
order by published_date
