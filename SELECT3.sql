-- WHERE ��
--SELECT [�÷�]
--FROM [���̺�]
--WHERE [���ǽ�];
SELECT * FROM EMP WHERE DEPTNO = 30;
-- QUIZ �����ȣ�� 7499�� ��� ������ ������ SQL��
SELECT * FROM EMP WHERE EMPNO = 7499;

-- ������ ���ǽ��� ����ϴ� AND, OR
SELECT * FROM EMP
WHERE deptno = 30 AND JOB = 'SALESMAN';

-- AND : �ǿ����� ��� TRUE�� ��츸 (*) ������
-- OR : �ǿ����� �� �ϳ��� TRUE����   (+) ������

SELECT * FROM EMP
WHERE deptno = 30 OR JOB = 'SALESMAN';

-- ��� ������
SELECT * FROM EMP WHERE sal*12 = 36000;

-- �� ������
SELECT * FROM EMP WHERE sal >= 3000;

-- ������ 2500 �̻��̰� , ������ analyst�� ��� ���� sql
SELECT * FROM emp WHERE sal>=2500 AND job ='ANALYST';
