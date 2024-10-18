/* HackerRank Draw The Triangle 2
https://www.hackerrank.com/challenges/draw-the-triangle-2/submissions/code/318931761 */

SET @NUM = 0;
SELECT REPEAT("* ", @NUM := @NUM + 1)
FROM information_schema.tables LIMIT 20;