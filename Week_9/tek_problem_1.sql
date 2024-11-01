/* HackerRank https://www.hackerrank.com/challenges/full-score/submissions/code/321149754
https://www.hackerrank.com/challenges/full-score/submissions/code/321149754 */

select H.hacker_id, H.name
from Hackers H
inner join Submissions S
    on H.hacker_id = S.hacker_id
inner join Challenges C
    on S.challenge_id = C.challenge_id
inner join Difficulty D
    on C.difficulty_level = D.difficulty_level
where S.score = D.score
group by H.hacker_id, H.name
having count(H.name) > 1
order by count(H.name) desc, H.hacker_id asc