SELECT * FROM EMP
WHERE ENAME >= 'F';
-- ���ڿ� �� ����
SELECT * FROM 
EMPWHERE ENAME <= 'FORE';
-- � �� EQUAL(=), NOT EQUAL(!=, <>, ^=, NOT)
SELECT * FROM emp WHERE SAL != 3000;
SELECT * FROM emp WHERE SAL <> 3000;
SELECT * FROM emp WHERE SAL ^= 3000;
SELECT * FROM emp WHERE NOT SAL = 3000;

-- IN ������
SELECT * FROM emp WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';
SELECT * FROM emp WHERE JOB IN('MANAGER','SALESMAN','CLERK');
SELECT * FROM emp WHERE JOB NOT IN('MANAGER','SALESMAN','CLERK');

-- BETWEEN A AND B
SELECT * FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;
-- ����
SELECT * FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;
-- LIKE ������ : �Ϻ� ���ڿ��� ���Ե� ������ ��ȸ�� ���
SELECT * FROM EMP
WHERE ename LIKE 'S%';
-- WILD CARD : * % _ ���ڿ� ������ ǥ���ϴ� Ư�� ����
-- _ : � ���̵� ������� �� ���� ���� ������
-- % : ���̿� ������� ��� ���� ������
-- ENAME�� �ι�° ���ڰ� L�� ���
SELECT ENAME FROM EMP WHERE ename LIKE '_L%';
-- ���� �̸��� AM�� ���Ե� ���
SELECT ENAME FROM EMP WHERE ename LIKE '%AM%';
-- NULL
SELECT * FROM EMP WHERE COMM IS NOT NULL;

SELECT * FROM EMP WHERE SAL > NULL OR COMM IS NULL;

-- Q1. EMP���� ��� �̸��� s�� ������ ��������͸� ����ϴ� SQL��
SELECT * FROM EMP WHERE ename like '%S';
-- Q2. EMP 30�� �μ� �ٹ��ϴ� ��� �� JOB�� 'SALESMAN'�� ������ �̸��� �޿��� ��ȸ
SELECT ename,sal,deptno FROM emp WHERE deptno = 30 AND job = 'SALESMAN';
-- Q3. EMP 20�� �μ��� 30�� �μ��� ������ ��ȸ (IN ������ ���)
SELECT * FROM emp WHERE deptno in(20,30);
SELECT * FROM emp WHERE deptno = 20 OR DEPTNO = 30;

-- ���� ������ UNION
SELECT * FROM emp WHERE deptno = 20
UNION
SELECT * FROM emp WHERE deptno = 10;

-- ������ MINUS
SELECT * FROM emp WHERE deptno in(10,20)
MINUS
SELECT * FROM emp WHERE deptno = 20;
-- ������ INTERSECT
SELECT * FROM emp WHERE deptno in(10,20)
INTERSECT
SELECT * FROM emp WHERE deptno = 20;

-- �켱����
-- 1. ������� * / (�켱) + -
-- 2. �񱳿��� > < >= <= !=
-- 3. IS NULL, LIKE, IN
-- BEETWEEN
-- NOT, AND, OR