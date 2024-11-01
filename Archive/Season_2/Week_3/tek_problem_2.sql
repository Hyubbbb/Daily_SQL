

/*
HackerRank Draw The Triangle 1
https://www.hackerrank.com/challenges/draw-the-triangle-1/submissions/code/318932199
*/
SET @NUM = 21;
SELECT REPEAT("* ", @NUM := @NUM - 1)
FROM information_schema.tables LIMIT 20;

-- https://discuss.codecademy.com/t/could-someone-explain-me-why-this-code-creates-automatic-20-lines/558795/2