-- DQL (DATA QUERY LANGUAGE)
-- SELECT��
-- 1. SELECTION : �� ���� ����
-- 2. PROJECTION : �� ���� ����
-- 3. JOIN : �� �� �̻��� ���̺� ����Ͽ� ��ȸ
DESC EMP;
-- table ���� EMP : ������ ����
DESC dept;
-- DEPT : �μ� ����
DESC salgrade;
-- SALGRADE : �޿� ���

-- SELECT���� FROM��
SELECT * FROM EMP;
SELECT EMPNO, ENAME, DEPTNO FROM EMP;

-- �ߺ� ������ ���� DISTINCT
-- SELECT DISTINCT
SELECT DISTINCT DEPTNO FROM EMP;
SELECT ALL deptNO FROM emp;
-- ��Ī �����ϱ�
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
FROM EMP;
