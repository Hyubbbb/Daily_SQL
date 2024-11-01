/* HackerRank Contest Leaderboard
https://www.hackerrank.com/challenges/contest-leaderboard/submissions/code/321308642 */

/* Using sum(max_score) to sum maximum scores for each challenges */
select J.id, J.name, sum(max_score)
/* Subquery for finding out maximum scores by challenges */
from (
    select H.hacker_id as id, H.name as name, S.challenge_id as challenge,  
        max(S.score) as max_score
    from Hackers H
    inner join Submissions S
        on H.hacker_id = S.hacker_id
    /* Using group by for finding out maximum score by challenge_id */
    group by H.hacker_id, H.name, S.challenge_id
) as J
group by J.id, J.name
/* Exclude all hackers with a total score of 0 */
having sum(max_score) > 0
order by sum(max_score) desc, J.id