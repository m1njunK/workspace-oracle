-- SYNONYM 동의어
-- 테이블 이름이 너무 길 때, 객체(뷰, 인덱스, 시퀀스) 등의 이름을 간단하고
-- 짧게 사용하고 싶을 때 만들어준다.

CREATE SYNONYM 동의어이름
FOR [사용자.][객체이름];

-- 권한이 없을 시 DCL
GRANT CREATE SYNONYM TO SCOTT;

CREATE SYNONYM E
    FOR EMP;
    
SELECT * FROM E;

-- 동의어 삭제
DROP SYNONYM E;

