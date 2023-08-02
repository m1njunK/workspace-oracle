-- MULTI-ROW FUNCTION
-- 14개의 행이 하나의 행 결과로 반환
SELECT SUM(SAL) FROM EMP;

-- 일반 컬럼과 함께 사용할 수 없다
SELECT ENAME, SUM(SAL) FROM EMP;

-- 다중행 함수 5대장 SUM, COUNT, MAX, MIN, AVG
-- SUM([선택, DISTINCT OR ALL] 합계를 구할 데이터(칼럼))
SELECT SUM(DISTINCT SAL), SUM(ALL SAL), SUM(SAL) FROM EMP;

-- COUNT([선택, DISTINCT OR ALL]) 합계를 구할 데이터(컬럼))
SELECT COUNT(*)
FROM EMP;

-- 부서번호 30인 사원의 인원수 파악
SELECT COUNT(*) FROM EMP WHERE DEPTNO = 30;

SELECT COUNT(DISTINCT SAL), COUNT(SAL) FROM EMP;

-- 최대값, 최소값
SELECT MAX(SAL)
FROM EMP;

SELECT MIN(SAL)
FROM EMP;

-- Q. 10번 부서에서 급여 가장 많이 받는 경우와 적게 받는 경우
SELECT MAX(SAL), MIN(SAL) FROM EMP WHERE DEPTNO = 10;

-- 최대 최소값이 날짜에 적용 가능
-- Q. 20번 부서에서 가장 입사일이 오래된 HIREDATE, 가장 최근
SELECT MIN(HIREDATE) AS 늙은이, MAX(HIREDATE) AS 젊은이 FROM EMP;

-- 평균 : AVG(데이터)
-- Q. 부서번호 30인 사원들의 평균 급여를 출력
SELECT CONCAT('$',ROUND(AVG(SAL),2)) FROM EMP WHERE DEPTNO = 30;

-- 다중행 함수와 함께 원하는 열로 묶어 사용하는
-- GROUP BY 절
SELECT ROUND(AVG(SAL),2) FROM EMP GROUP BY DEPTNO;

-- 문법
-- SELECT 조회할 열
-- FROM 조회할 테이블
-- WHERE (조회할 행을 선별하는) 조건식
-- GROUP BY 그룹화할 열
-- HAVING (출력 그룹을 선별하는) 조건식
-- ORDER BY 정렬할 열

SELECT DEPTNO AS 평균급여, AVG(SAL)
FROM EMP GROUP BY DEPTNO;

-- 다중 그룹 및 순서 정렬 가능
-- 평균 급여를 부서별번호와 직책별로 정렬하기
SELECT DEPTNO,JOB,AVG(SAL) AS 평균급여 
FROM EMP 
GROUP BY DEPTNO , 
JOB ORDER BY DEPTNO,JOB;

-- GROUP BY절을 사용할 때 주의사항
-- GROUP BY절에 없는 컬럼을 SELECT절에 포함시키면 ERROR가 발생합니다.
-- SELECT ENAME,DEPTNO,JOB,AVG(SAL) AS 평균급여 
-- FROM EMP 
-- GROUP BY DEPTNO , JOB 
-- ORDER BY DEPTNO,JOB;

-- HAVING 절 : GROUP BY 절에 조건을 줄 때 사용.
SELECT DEPTNO,JOB,ROUND(AVG(SAL)) AS 평균급여 
FROM EMP 
GROUP BY DEPTNO,JOB 
HAVING ROUND(AVG(SAL)) >= 2000
ORDER BY DEPTNO,JOB;

-- WHERE절 HAVING절 모두 사용하는 경우
SELECT DEPTNO,JOB,ROUND(AVG(SAL)) AS 평균급여 
FROM EMP 
WHERE SAL <= 3000
GROUP BY DEPTNO,JOB 
HAVING ROUND(AVG(SAL)) >= 2000
ORDER BY DEPTNO,JOB;

-- EX1 : EMP 테이블에서 DEPTNO, 평균 급여 AVG_SAL , 최고 급여 MAX_SAL , 최저 급여 MIN_SAL , 사원 수 CNT 출력
-- 평균 급여는 소수점 제외하고 버립니다.
SELECT DEPTNO, TRUNC(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(*) AS CNT 
FROM EMP 
GROUP BY DEPTNO 
ORDER BY DEPTNO DESC;

-- EX2 : JOB 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력하세요
SELECT JOB, COUNT(*) 
FROM EMP 
GROUP BY JOB 
HAVING COUNT(*) >= 3;

