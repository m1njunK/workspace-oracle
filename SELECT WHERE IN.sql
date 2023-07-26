SELECT * FROM EMP
WHERE ENAME >= 'F';
-- 문자열 비교 가능
SELECT * FROM 
EMPWHERE ENAME <= 'FORE';
-- 등가 비교 EQUAL(=), NOT EQUAL(!=, <>, ^=, NOT)
SELECT * FROM emp WHERE SAL != 3000;
SELECT * FROM emp WHERE SAL <> 3000;
SELECT * FROM emp WHERE SAL ^= 3000;
SELECT * FROM emp WHERE NOT SAL = 3000;

-- IN 연산자
SELECT * FROM emp WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';
SELECT * FROM emp WHERE JOB IN('MANAGER','SALESMAN','CLERK');
SELECT * FROM emp WHERE JOB NOT IN('MANAGER','SALESMAN','CLERK');

-- BETWEEN A AND B
SELECT * FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;
-- 부정
SELECT * FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;
-- LIKE 연산자 : 일부 문자열이 포함된 데이터 조회시 사용
SELECT * FROM EMP
WHERE ename LIKE 'S%';
-- WILD CARD : * % _ 문자열 패턴을 표기하는 특수 문자
-- _ : 어떤 값이든 상관없이 한 개의 문자 데이터
-- % : 길이와 상관없이 모든 문자 데이터
-- ENAME의 두번째 글자가 L인 경우
SELECT ENAME FROM EMP WHERE ename LIKE '_L%';
-- 글자 이름에 AM이 포함된 경우
SELECT ENAME FROM EMP WHERE ename LIKE '%AM%';
-- NULL
SELECT * FROM EMP WHERE COMM IS NOT NULL;

SELECT * FROM EMP WHERE SAL > NULL OR COMM IS NULL;

-- Q1. EMP에서 사원 이름이 s로 끝나는 사원데이터를 출력하는 SQL문
SELECT * FROM EMP WHERE ename like '%S';
-- Q2. EMP 30번 부서 근무하는 사원 중 JOB이 'SALESMAN'인 직원의 이름과 급여를 조회
SELECT ename,sal,deptno FROM emp WHERE deptno = 30 AND job = 'SALESMAN';
-- Q3. EMP 20번 부서와 30번 부서의 직원을 조회 (IN 연산자 사용)
SELECT * FROM emp WHERE deptno in(20,30);
SELECT * FROM emp WHERE deptno = 20 OR DEPTNO = 30;

-- 집합 연산자 UNION
SELECT * FROM emp WHERE deptno = 20
UNION
SELECT * FROM emp WHERE deptno = 10;

-- 차집합 MINUS
SELECT * FROM emp WHERE deptno in(10,20)
MINUS
SELECT * FROM emp WHERE deptno = 20;
-- 교집합 INTERSECT
SELECT * FROM emp WHERE deptno in(10,20)
INTERSECT
SELECT * FROM emp WHERE deptno = 20;

-- 우선순위
-- 1. 산술연산 * / (우선) + -
-- 2. 비교연산 > < >= <= !=
-- 3. IS NULL, LIKE, IN
-- BEETWEEN
-- NOT, AND, OR