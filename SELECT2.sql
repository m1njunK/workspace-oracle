-- ��Ī �����ϱ�
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
FROM EMP;

-- ������� �����͸� �����ϱ� ORDER BY
-- SELECT  [��1,2,3,4,*...]
-- FROM [���̺�]
-- ORDER BY [�����Ϸ��� �� �̸�]
-- �������� ����(ASC)
SELECT *
FROM EMP
ORDER BY SAL;
-- �������� ���� (DESC)
SELECT *
FROM EMP
ORDER BY SAL DESC;

-- ��������. �����ȣ �������� �������� SQL�� �ۼ����ּ���.
SELECT * FROM EMP ORDER BY EMPNO DESC;

-- ���������� �������� ���ÿ� ����ϱ�
-- �μ���ȣ �������� ����, �޿�(SAL)�� �������� ����
SELECT * FROM EMP ORDER BY deptno , SAL DESC;

-- ���ǻ��� : �ǹ����� ��������� ���� ���� ��,
-- ORDER BY�� ������ ���, ���Ŀ� ���ҽ��� �Ҹ��ϱ� ������ ���� ������
-- SELECTION ���� ���Ͽ� ���� ������ ���� �Ŀ� ������ �ϴ� ���� ����.
-- �� �ʿ��� ���.

-- ��������
-- 1. JOB �� �����͸� �ߺ����� �����ϱ�
SELECT DISTINCT JOB FROM EMP;
-- 2. �÷��� �̸��� FULLNAME���� ��������ּ���.
SELECT * FROM emp;
SELECT EMPNO EMPLOYEE_NO, ENAME EMPLOYEE_NAME, JOB, MGR MANAGER, HIREDATE, SAL SALARY,COMM COMMISSION, DEPTNO DEPARTEMENT_NO FROM emp;
-- �� sql������ �μ������� �������� �����ϰ�, �̸������� �������� ����
SELECT EMPNO EMPLOYEE_NO, ENAME EMPLOYEE_NAME, JOB, MGR MANAGER, HIREDATE, SAL SALARY,COMM COMMISSION, DEPTNO DEPARTEMENT_NO FROM emp ORDER BY DEPTNO DESC, ENAME;