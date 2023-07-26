-- 별칭 설정하기
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
FROM EMP;

-- 순서대로 데이터를 정렬하기 ORDER BY
-- SELECT  [열1,2,3,4,*...]
-- FROM [테이블]
-- ORDER BY [정렬하려는 열 이름]
-- 오름차순 정렬(ASC)
SELECT *
FROM EMP
ORDER BY SAL;
-- 내림차순 정렬 (DESC)
SELECT *
FROM EMP
ORDER BY SAL DESC;

-- 복습문제. 사원번호 기준으로 내림차순 SQL문 작성해주세요.
SELECT * FROM EMP ORDER BY EMPNO DESC;

-- 오름차순과 내림차순 동시에 사용하기
-- 부서번호 오름차순 정렬, 급여(SAL)은 내림차순 정렬
SELECT * FROM EMP ORDER BY deptno , SAL DESC;

-- 주의사항 : 실무에서 수억단위의 행이 있을 때,
-- ORDER BY는 신중히 사용, 정렬에 리소스를 소모하기 때문에 성능 떨어짐
-- SELECTION 등을 통하여 행의 갯수를 줄인 후에 정렬을 하는 것이 좋다.
-- 꼭 필요할 경우.

-- 연습문제
-- 1. JOB 열 데이터를 중복없이 추출하기
SELECT DISTINCT JOB FROM EMP;
-- 2. 컬럼의 이름을 FULLNAME으로 변경시켜주세요.
SELECT * FROM emp;
SELECT EMPNO EMPLOYEE_NO, ENAME EMPLOYEE_NAME, JOB, MGR MANAGER, HIREDATE, SAL SALARY,COMM COMMISSION, DEPTNO DEPARTEMENT_NO FROM emp;
-- 위 sql문에서 부서순으로 내림차순 정렬하고, 이름순으로 오름차순 정렬
SELECT EMPNO EMPLOYEE_NO, ENAME EMPLOYEE_NAME, JOB, MGR MANAGER, HIREDATE, SAL SALARY,COMM COMMISSION, DEPTNO DEPARTEMENT_NO FROM emp ORDER BY DEPTNO DESC, ENAME;