-- Ÿ�Ժ�ȯ, MULTI-ROW FUNCTION
-- �׷�ȭ�� ���õ� �Լ�

-- ROLLUP
-- SELECT
-- FROM
-- WHERE
-- GROUP BY ROLLUP (�׷�ȭ�� �� ����)

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB 
ORDER BY DEPTNO,JOB;

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO,JOB)
ORDER BY DEPTNO

-- CUBE �Լ�
-- SELECT
-- FROM
-- WHERE
-- GROUP BY CUBE(�׷�ȭ�� �� ����)
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO,JOB)
ORDER BY DEPTNO
-- n���� ���� �����ϸ� 2^n �� ������ ��µ˴ϴ�.

-- GROUPING SETS �Լ�
-- ���� �׷�ȭ ��� ���� ���� ���� ���� �������� ����մϴ�.
SELECT DEPTNO, JOB, COUNT(*)
FROM EMP
GROUP BY GROUPING SETS(DEPTNO,JOB)

-- GROUPIN �Լ�
-- �׷�ȭ �� ���� �����ϸ� ��� ��� ���� �׷�ȭ�Ǿ� ����Ǿ����� ��ȯ(0,1)
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

-- GROUPING_ID �Լ� (BIT ����)
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL),
        GROUPING(DEPTNO),
        GROUPING(JOB),
        GROUPING_ID(DEPTNO,JOB)
FROM EMP
GROUP BY CUBE(DEPTNO,JOB)
ORDER BY DEPTNO,JOB

-- ������  10����
--
-- 0 0 =>   0   �ƹ��͵� �ƴ�
-- 0 1 =>   1   �ι�° ���� ����
-- 1 0 =>   2   ù��° ���� ����
-- 1 1 =>   3   ���� 2�� ����

-- ������� �Ի翬���� �������� �μ����� �� ���� �Ի��ߴ��� ����ϼ���.
-- HIREDATE -> HIRE_YEAR
SELECT TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR,DEPTNO,COUNT(*) AS CNT 
FROM EMP 
GROUP BY HIRE_YEAR,DEPTNO;

SELECT * FROM EMP;

-- EX2. �߰�����(COMM) �޴� ����� ���� �ʴ� ����� ���� ����ϼ���.
SELECT NVL2(COMM,'O','X') AS EXIST_COMM ,COUNT(*) AS CNT 
FROM EMP 
GROUP BY EXIST_COMM

-- EX3. �Ի翬��, ������ �����, �޿� �հ�, ��� �޿��� ��� �ǵ���
--      �μ��� �Ի翬���� �׷��� �����ְ�, �μ����� �Ұ�� �Ѱ踦 ����ϼ���.
SELECT DEPTNO, TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR,
       COUNT(*) AS CNT, 
       MAX(SAL) AS MAX_SAL, 
       SUM(SAL) AS SUM_SAL, 
       AVG(SAL) AS AVG_SAL 
FROM EMP 
GROUP BY ROLLUP(DEPTNO,HIRE_YEAR) 
ORDER BY DEPTNO
