-- 코드를 작성해주세요
SELECT COUNT(ID) COUNT
FROM ECOLI_DATA
WHERE GENOTYPE & b'0111' IN (b'0100', b'1', b'0101')
