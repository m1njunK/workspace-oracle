-- 서브쿼리
-- SQL문을 실행할 때 SQL 문 내부에서 사용하는 SELECT문

-- WHERE 조건절에서 사용할 경우

-- 메인쿼리
--SELECT 컬럼
--FROM 테이블
--WHERE 조건식 ( SELECT 컬럼
--              FROM 테이블
--              WHERE 조건식 )
              -- 서브쿼리
              
SELECT SAL
FROM EMP
WHERE ENAME = 'JONES';

-- 존스씨보다 급여를 많이 받는 사람을 조회
SELECT *
FROM EMP
WHERE SAL > (SELECT SAL
FROM EMP
WHERE ENAME = 'JONES'
);

-- 서브쿼리의 특징
-- 1. 서브쿼리는 같은 비교 조회 대상의 오른족에 놓이며 괄호로 묶어 사용
-- 2. 서브쿼리의 SELECT 절에 명시한 컬럼은 비교 대상과 같은 자료형(data type)이어야 합니다.
--    같은 개수로 지정해야 합니다.
-- 3. 서브쿼리문의 결과 행 수(ROW COUNT)는 메인쿼리의 연산자 종류와 호환되어야 합니다.

-- EMP 테이블의 사원 이름이 ALLEN인 사원의 추가수당(COMM)보다 추가수당 많이 받는 직원의 수를
-- 구하는 SQL문 작성

SELECT * FROM EMP WHERE COMM > (SELECT COMM FROM EMP WHERE ENAME = 'ALLEN');