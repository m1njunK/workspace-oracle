-- 단일행 서브쿼리 (single row subquery)

-- 비교 연산자 : > >= = <= < <> !=       => 단일행 연산자

SELECT * FROM EMP
WHERE HIREDATE < ( SELECT HIREDATE 
                   FROM EMP
                   WHERE ENAME = 'SCOTT');
                   
-- 서브쿼리에서 함수 사용, JOIN 사용

-- 20번 부서에서 속한 사원 중 평균 급여보다 높은 급여를 받은 , 사원 정보와 부서 정보
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
    AND E.DEPTNO = 20
    AND E.SAL > (SELECT AVG(SAL) FROM EMP);
    
-- Q. 서브쿼리 이용해서 전체 사원 평균 급여보다 작거나 같은(이하) 급여를 받는 20번
--     부서 사원 정보와, 부서 정보를 출력하는 SQL
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
    AND E.DEPTNO = 20
    AND E.SAL <= (SELECT AVG(SAL) FROM EMP);
    
-- EX1. 전체 사원 중 'ALLEN'과 같은 'JOB'인 사원의 사원 정보(EMP), 부서 정보(DEPT)를
--      출력하는 SQL문 작성
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
    AND JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN');

-- EX2. 전체 사원 평균 급여보다 높은 급여를 받는 사원들의 사원 정보(EMP), 부서정보(DEPT),
--      급여등급정보(SALGRADE)를 출력하는 SQL문을 작성하세요. (급여 많은 순으로 정렬)
SELECT E.EMPNO, E.ENAME, D.DNAME, TO_CHAR(E.HIREDATE,'YYYY-MM-DD'), D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
    AND SAL > (SELECT AVG(SAL) FROM EMP)
    AND E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY E.SAL DESC, E.EMPNO;       