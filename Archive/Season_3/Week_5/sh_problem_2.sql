-- 조건에 부합하는 중고거래 상태 조회하기
SELECT board_id, writer_id, title, price, case when status="sale" then "판매중"
            when status="reserved" then "예약중"
            when status="done" then "거래완료" 
            end as status 
from used_goods_board
where created_date='2022-10-05'
order by board_id desc
