SELECT * FROM DEPT_TCL;

-- 커밋 전 : 세션 1에서 삭제한 데이터가
-- 그대로 존재
SELECT * FROM DEPT_TCL;
-- 커밋 후 : 세션1에서 조작한 데이터 반영
SELECT * FROM DEPT_TCL;

-- 읽기 일관성(read consistency)
-- 데이터를 직접 조작하는 세션 외
-- 다른 세션에서는 내용이 일관적으로
-- 조회, 출력, 검색 되는 특성

SELECT * FROM DEPT_TCL;

-- 세션 1에서 조작중인 데이터를
-- 세션 2가 접근하게 될 때
-- 명령이 실행하면 멈추게 된다. (LOCK)
UPDATE DEPT_TCL SET DNAME='DATABASE'
WHERE DEPTNO = 30;
-- 다른 세션의 데이터 조작이 완료될때까지
-- 기다리는 현상 : HANG
SELECT * FROM DEPT_TCL;
-- 30번 데이터는 세션2에 의해 LOCK된 상태
COMMIT;

SELECT * FROM DEPT_TCL;