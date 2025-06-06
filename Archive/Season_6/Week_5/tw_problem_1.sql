SET @number = 21;
SELECT REPEAT('* ', @number := @number - 1) FROM information_schema.tables LIMIT 20;

-- information_schema.tables = 데이터베이스에서 테이블 정보를 담고 있는 시스템 테이블
-- DB의 메타 정보(테이블, 칼럼, 인덱스 등의 스키마 정보)를 모아둔 DB
-- 단순 조회만 가능하다고 함
