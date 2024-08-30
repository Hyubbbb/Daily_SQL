/* HackerRank Ollivander's Inventory
https://www.hackerrank.com/challenges/harry-potter-and-wands/submissions/code/321217938 */


select W.id, WP.age, W.coins_needed, W.power
from Wands W
inner join Wands_Property WP
    on W.code = WP.code
/* Using self join - must check this again */
where WP.is_evil = 0 and W.coins_needed in (
    select min(w2.coins_needed)
    from Wands w2
    inner join Wands_Property wp2
        on w2.code = wp2.code
    where W.code = w2.code and W.power = w2.power
)
order by W.power desc, WP.age desc