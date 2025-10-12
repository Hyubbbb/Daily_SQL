SELECT 
    # 'JOIN' 한 테이블 중 특정 출력 컬럼 선택 
    e1.ID, 
    # ECOLI_DATA 테이블 => 부모 테이블 지정 계획
    # e1 으로 지정 => ID 컬럼 만 선택 
    COUNT(e2.ID) AS CHILD_COUNT
    # ECOLI_DATA 테이블 => 자식 테이블 지정 계획 
    # CHILD_COUNT 출력 컬럼 생성 
FROM ECOLI_DATA e1
    LEFT JOIN ECOLI_DATA e2 # 'JOIN 들여쓰기'
        ON e1.ID = e2.PARENT_ID
    # 부모 테이블의 ID 와 자식 테이블의 ID 가 같은 행끼리 연결 
    # 자식이 없으면 'NULL'로 표시
GROUP BY e1.ID
    # 집계 기준 설정 => e1.ID 단위로 묶어서 집계 
ORDER BY e1.ID;
    # el.ID 기준으로 오름차순 
