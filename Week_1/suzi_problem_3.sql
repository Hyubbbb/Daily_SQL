'특정 형질을 가지는 대장균 찾기'

'비트연상 쪼개서 계산하기'

select count(id) as COUNT
from ECOLI_DATA
where GENOTYPE & 2 = 0
and (GENOTYPE & 1 > 0 or GENOTYPE & 4 > 0);
