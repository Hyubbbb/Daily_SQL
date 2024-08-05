/* HackerRank Binary Tree Nodes
https://www.hackerrank.com/challenges/binary-search-tree-1/submissions/code/320093370 */

SELECT N,
       (CASE
            WHEN P IS NULL THEN "Root"
            WHEN N IN (SELECT P FROM BST) THEN "Inner"
            ELSE "Leaf"
        END) as Node
FROM BST
ORDER BY N ASC;