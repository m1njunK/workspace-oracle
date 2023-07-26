-- ���� �� �������� MULTIPLE ROW SUBQUERY

-- ������ ������ : IN, ANY(SOME), ALL, EXIST

-- IN : �ϳ��� ��ġ�� �����Ͱ� ������ TRUE
-- ANY : �ϳ� �̻��̸� TRUE
-- ALL : ��� �����ϸ� TRUE
-- EXIST : ����� �����ϸ� TRUE

SELECT * FROM EMP
WHERE DEPTNO IN (20,30);

-- �� �μ��� �ְ� �޿��� ������ �޿� �޴� ��� ����
SELECT * FROM EMP
WHERE SAL IN(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO); -- IN (3000,2850,5000)

-- ANY ������
SELECT * FROM EMP
WHERE SAL = ANY(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);  -- = �����ڴ� IN�� ���� ȿ��

-- 30�� �μ����� �ִ�޿����� ���� �޿��޴� ��� ���� ���
SELECT * FROM EMP
WHERE SAL < ANY(SELECT SAL FROM EMP WHERE DEPTNO = 30); -- ��Ÿ �� ���� ����

SELECT * FROM EMP
WHERE SAL < ANY( 1600, 1250, 1250, 2850, 1500, 950); -- ��Ÿ �� ���� ����

SELECT * FROM EMP
WHERE SAL = ANY(SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30);

-- ALL ������ : ��� ����� ���ǽĿ� �¾� �������� TRUE
SELECT * FROM EMP
WHERE SAL < ALL ( SELECT SAL FROM EMP WHERE DEPTNO = 30 );
             -- ( 1600, 1250, 1250, 2850, 1500, 950)

-- EXISTS ������ : �����ϸ� TRUE
SELECT * FROM EMP WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 10);
-- �������� ������ �ƹ� �൵ ��µ��� ����.
SELECT * FROM EMP WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 50);

-- MULTIPLE-COLUMN SUBQUERY ���߿� ��������
SELECT * 
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;
-- ���� ������ ��ȸ ��� �÷��� 2�� �̻��� ���, ���� ���� ���� ���ǿ� ��ȣ�� ����
-- Ÿ���� ��ġ��Ų �÷��� ��ȸ�Ѵ�.

-- FROM ���� ����ϴ� ��������

-- VIEW ������ ȿ�� : INLINE VIEW
SELECT * 
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
     (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

SELECT * FROM EMP WHERE DEPTNO = 10;    -- 10�� �μ� ������ ��Ÿ���� VIEW
SELECT * FROM DEPT;

-- WITH���� ����ϴ� ���
WITH E10 AS (SELECT * FROM emp WHERE deptno = 10), d AS (SELECT * FROM DEPT)
SELECT * FROM E10,d where E10.deptno = d.deptno;
-- SELECT���� ����ϴ� ��������
-- SCALAR SUBQUERY, SELECT���� �ϳ��� �÷����μ� ����� ���
-- JOIN ���� ������� �ʰ� , �÷��� �߰���Ű�� ���� ���
SELECT empno,ename,job,sal,
    (SELECT grade FROM salgrade WHERE e.sal BETWEEN losal and hisal) AS salgrade,
    deptno,
    (SELECT dname FROM dept WHERE e.deptno = dept.deptno) as dname
FROM EMP e;

-- EX3. 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� ������� �������
--      �������(EMP), �μ�����(DEPT)�� ����ϴ� SQL��
SELECT E.EMPNO,E.ENAME,E.JOB,D.DEPTNO,D.DNAME,D.LOC 
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO 
AND E.DEPTNO = 10 
AND JOB NOT IN(SELECT DISTINCT JOB FROM EMP WHERE DEPTNO = 30);

-- EX4. ��å�� SALESMAN�� ������� �ְ� �޿�(SAL)���� ���� �޿��� �޴� ��� ����(EMP)
--      �޿��������(SALGRADE)�� ����ϴ� SQL��
SELECT EMPNO,ENAME,SAL,S.GRADE 
FROM EMP,SALGRADE S 
WHERE SAL BETWEEN S.LOSAL AND S.HISAL 
AND SAL > (SELECT MAX(SAL) FROM (SELECT * FROM EMP WHERE JOB = 'SALESMAN'));

SELECT EMPNO,ENAME,SAL,S.GRADE 
FROM EMP,SALGRADE S 
WHERE SAL BETWEEN S.LOSAL AND S.HISAL 
AND SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN');

-- ������ ���������� ����� ���
SELECT EMPNO,ENAME,SAL,S.GRADE 
FROM EMP,SALGRADE S 
WHERE SAL BETWEEN S.LOSAL AND S.HISAL 
AND SAL > ALL (SELECT DISTINCT SAL FROM EMP WHERE JOB = 'SALESMAN');

-- EX5. SCALAR SUBQUERY�� �̿��ؼ� �μ��� ��ȣ�� �μ��̸�, �ְ�޿��� ����غ�����.
SELECT D.DEPTNO, D.DNAME, 
(SELECT MAX(SAL) 
    FROM EMP 
    WHERE DEPTNO = D.DEPTNO) AS SAL
FROM DEPT D;

-- EX6. WITH���� ����ؼ� ������� ������ ���� �μ��� �ο����� ����ϼ���.

WITH DEPT_COUNT AS (
    SELECT DEPTNO, COUNT(*) AS DEPT_COUNT
    FROM EMP 
    GROUP BY DEPTNO
)
SELECT ENAME,DEPT_COUNT
FROM EMP E, DEPT_COUNT DC
WHERE E.DEPTNO = DC.DEPTNO;
