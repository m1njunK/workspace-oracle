-- VIEW

-- 가상 테이블, 셀렉트 문을 저장한 객체 <-> 물리적 데이터

SELECT * FROM
(SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO = 20);

-- 뷰의 사용 목적
-- 1. 편리성 : 복잡도를 완화하기 위해
-- 2. 보안성 : 테이블의 특정 열을 노출하고 싶지 않을 경우

-- 권한이 없을 경우 SYSTEM 계정으로부터 권한을 부여 받아야 한다.
-- DCL : 권한 부여 (GRANT / REVOKE)
GRANT CREATE VIEW TO SCOTT; -- 뷰 생성 권한 부여

CREATE VIEW VW_EMP20
    AS (SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO = 20);
    
SELECT * FROM USER_VIEWS;

SELECT * FROM VW_EMP20;

-- VIEW 삭제
DROP VIEW VW_EMP20;

