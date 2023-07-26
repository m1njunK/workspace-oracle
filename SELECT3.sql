-- WHERE 절
--SELECT [컬럼]
--FROM [테이블]
--WHERE [조건식];
SELECT * FROM EMP WHERE DEPTNO = 30;
-- QUIZ 사원번호가 7499인 사원 정보만 나오는 SQL문
SELECT * FROM EMP WHERE EMPNO = 7499;

-- 여러개 조건식을 사용하는 AND, OR
SELECT * FROM EMP
WHERE deptno = 30 AND JOB = 'SALESMAN';

-- AND : 피연산자 모두 TRUE인 경우만 (*) 교집합
-- OR : 피연산자 중 하나만 TRUE여도   (+) 합집합

SELECT * FROM EMP
WHERE deptno = 30 OR JOB = 'SALESMAN';

-- 산술 연산자
SELECT * FROM EMP WHERE sal*12 = 36000;

-- 비교 연산자
SELECT * FROM EMP WHERE sal >= 3000;

-- 월급이 2500 이상이고 , 직업이 analyst인 사원 정보 sql
SELECT * FROM emp WHERE sal>=2500 AND job ='ANALYST';
