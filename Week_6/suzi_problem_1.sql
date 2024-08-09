'항상 FORMAT 확인 잘해야지;;;;'

select concat(format(length,2),'cm') as MAX_LENGTH
from fish_info
order by length desc limit 1
