/* HackerRank Symmetric Pairs
https://www.hackerrank.com/challenges/symmetric-pairs/submissions/code/321502078 */


SELECT F1.X, F1.Y
FROM Functions F1
INNER JOIN Functions F2
    ON F1.X = F2.Y AND F1.Y = F2.X
GROUP BY F1.X, F1.Y
HAVING Count(*) > 1 OR F1.X < F1.Y
ORDER BY F1.X