-- �Լ�
-- ��ҹ��ڸ� �ٲ��ִ� �Լ�
SELECT UPPER(ENAME),LOWER(ENAME), INITCAP(ENAME) FROM EMP;

-- ����
-- SELECT * FROM �Խ���
-- WHERE �Խ������� LIKE '%oracle%';
-- �̷��� ���� �� Oracle ORACLE ���� ������ �˻��� ���� �ʴ´�.

SELECT ENAME FROM EMP WHERE ENAME = upper('smith');

-- Smith SMITH smith sMiTh
-- �پ��� �����Ͱ� ��ҹ��� ���� ���� ���͵�
-- SQL�� ��ȸ���� ��ҹ��� �Լ��� ����ϸ� ��� ������ �����͸� �˻��� �� �ִ�

-- ���ڿ��� ���� ���ϱ�
SELECT ENAME, LENGTH(ENAME) FROM EMP;
-- Q1. ��� �̸� ���̰� 5�̻��� ��� ����ϱ�
SELECT ENAME, LENGTH(ENAME) FROM EMP WHERE LENGTH(ENAME) >= 5;
-- Q2. ��å �̸� ���̰� 6�̻��� �����͸� ����ϱ�
SELECT * FROM EMP WHERE LENGTH(job) >= 6;