-- ������ �������� (single row subquery)

-- �� ������ : > >= = <= < <> !=       => ������ ������

SELECT * FROM EMP
WHERE HIREDATE < ( SELECT HIREDATE 
                   FROM EMP
                   WHERE ENAME = 'SCOTT');
                   
-- ������������ �Լ� ���, JOIN ���

-- 20�� �μ����� ���� ��� �� ��� �޿����� ���� �޿��� ���� , ��� ������ �μ� ����
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
    AND E.DEPTNO = 20
    AND E.SAL > (SELECT AVG(SAL) FROM EMP);
    
-- Q. �������� �̿��ؼ� ��ü ��� ��� �޿����� �۰ų� ����(����) �޿��� �޴� 20��
--     �μ� ��� ������, �μ� ������ ����ϴ� SQL
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
    AND E.DEPTNO = 20
    AND E.SAL <= (SELECT AVG(SAL) FROM EMP);
    
-- EX1. ��ü ��� �� 'ALLEN'�� ���� 'JOB'�� ����� ��� ����(EMP), �μ� ����(DEPT)��
--      ����ϴ� SQL�� �ۼ�
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
    AND JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN');

-- EX2. ��ü ��� ��� �޿����� ���� �޿��� �޴� ������� ��� ����(EMP), �μ�����(DEPT),
--      �޿��������(SALGRADE)�� ����ϴ� SQL���� �ۼ��ϼ���. (�޿� ���� ������ ����)
SELECT E.EMPNO, E.ENAME, D.DNAME, TO_CHAR(E.HIREDATE,'YYYY-MM-DD'), D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
    AND SAL > (SELECT AVG(SAL) FROM EMP)
    AND E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY E.SAL DESC, E.EMPNO;       