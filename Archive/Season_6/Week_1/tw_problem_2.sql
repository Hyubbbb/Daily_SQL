-- 1. 중복이 아닌 것만 남기고
-- 2. 최대값만 남기고
-- 3. 위 둘을 어떻게?


WITH CNT as (SELECT H.hacker_id, H.name, COUNT(challenge_id) CNUM
FROM Hackers H JOIN Challenges C ON H.hacker_id = C.hacker_id
GROUP BY H.hacker_id, H.name)

-- 1. distinct
-- SELECT CNUM
-- FROM CNT
-- GROUP BY CNUM 
-- HAVING COUNT(*) = 1

-- 2. max
-- SELECT MAX(CNUM)
-- FROM CNT


SELECT h.hacker_id, h.name, COUNT(challenge_id) CNUM_FINAL
FROM Hackers h JOIN Challenges c ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING CNUM_FINAL IN (SELECT CNUM
    FROM CNT
    GROUP BY CNUM 
    HAVING COUNT(*) = 1)
OR CNUM_FINAL = (SELECT MAX(CNUM)
    FROM CNT)
    
ORDER BY CNUM_FINAL DESC, h.hacker_id
