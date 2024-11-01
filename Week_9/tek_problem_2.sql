/* HackerRank Placements
https://www.hackerrank.com/challenges/placements/submissions/code/321486422 */

select SP.Name
from (
    select S.ID as ID, S.Name as Name, P.Salary as Salary
    from Students S
    inner join Packages P
        on S.ID = P.ID) as SP
inner join Friends F
    on SP.ID = F.ID
inner join Packages P
    on F.Friend_ID = P.ID
where SP.Salary < P.Salary
order by P.salary