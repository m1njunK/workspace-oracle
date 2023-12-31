-- 타입변환, MULTI-ROW FUNCTION
-- 그룹화와 관련된 함수

-- ROLLUP
-- SELECT
-- FROM
-- WHERE
-- GROUP BY ROLLUP (그룹화할 열 지정)

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB 
ORDER BY DEPTNO,JOB;

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO,JOB)
ORDER BY DEPTNO

-- CUBE 함수
-- SELECT
-- FROM
-- WHERE
-- GROUP BY CUBE(그룹화할 열 지정)
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO,JOB)
ORDER BY DEPTNO
-- n개의 열을 지정하면 2^n 개 조합이 출력됩니다.

-- GROUPING SETS 함수
-- 여러 그룹화 대상 열의 값을 각각 같은 수준으로 출력합니다.
SELECT DEPTNO, JOB, COUNT(*)
FROM EMP
GROUP BY GROUPING SETS(DEPTNO,JOB)

-- GROUPIN 함수
-- 그룹화 할 열을 선택하면 어느 대상 열이 그룹화되어 집계되었는지 반환(0,1)
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL),
        GROUPING(DEPTNO),
        GROUPING(JOB)
FROM EMP
GROUP BY CUBE(DEPTNO,JOB)
ORDER BY DEPTNO,JOB

SELECT DECODE(GROUPING(DEPTNO),1,'ALL_DEPT',DEPTNO) AS DEPTNO,
       DECODE(GROUPING(JOB),1,'ALL_JOB',JOB) AS JOB, 
        COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO,JOB)
ORDER BY DEPTNO,JOB

-- GROUPING_ID 함수 (BIT 연산)
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL),
        GROUPING(DEPTNO),
        GROUPING(JOB),
        GROUPING_ID(DEPTNO,JOB)
FROM EMP
GROUP BY CUBE(DEPTNO,JOB)
ORDER BY DEPTNO,JOB

-- 이진수  10진수
--
-- 0 0 =>   0   아무것도 아님
-- 0 1 =>   1   두번째 조건 만족
-- 1 0 =>   2   첫번째 조건 만족
-- 1 1 =>   3   조건 2개 만족

-- 사원들의 입사연도를 기준으로 부서별로 몇 명이 입사했는지 출력하세요.
-- HIREDATE -> HIRE_YEAR
SELECT TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR,DEPTNO,COUNT(*) AS CNT 
FROM EMP 
GROUP BY HIRE_YEAR,DEPTNO;

SELECT * FROM EMP;

-- EX2. 추가수당(COMM) 받는 사원과 받지 않는 사원의 수를 출력하세요.
SELECT NVL2(COMM,'O','X') AS EXIST_COMM ,COUNT(*) AS CNT 
FROM EMP 
GROUP BY EXIST_COMM

-- EX3. 입사연도, 연도별 사원수, 급여 합계, 평균 급여가 출력 되도록
--      부서와 입사연도로 그룹을 지어주고, 부서별로 소계와 총계를 출력하세요.
SELECT DEPTNO, TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR,
       COUNT(*) AS CNT, 
       MAX(SAL) AS MAX_SAL, 
       SUM(SAL) AS SUM_SAL, 
       AVG(SAL) AS AVG_SAL 
FROM EMP 
GROUP BY ROLLUP(DEPTNO,HIRE_YEAR) 
ORDER BY DEPTNO
