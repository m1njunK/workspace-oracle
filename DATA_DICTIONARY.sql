-- OBJECT
-- DATA DICTIONARY
-- Ư�� ���̺� (�����ͺ��̽� ������ �� �ڵ����� ��������� ���̺�)
-- �����ͺ��̽� ��� �߿��� �����Ͱ� �����Ǿ� �ֽ��ϴ�.

-- ���ξ ���� �з�
-- USER_    : ����ڰ� ������ ��ü ����
-- ALL_     : ��� �㰡�� �ִ� ��� ��ü ����
-- DBA_     : �����ͺ��̽� ���� ������ ���� ����
-- V$_      : �����ͺ��̽� ���� ���� ����

SELECT * FROM DICTIONARY;

-- ����ڰ� ����� �� �ִ� ���̺� Ȯ��
SELECT TABLE_NAME FROM USER_TABLES;

-- ���� ������ ��� ���̺� Ȯ��
SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

-- DBA �������� ���̺� Ȯ�� 
-- (���ȶ��� �Ⱦ˷���)
SELECT * FROM DBA_TABLES;
SELECT * FROM DBA_USERS WHERE USERNAME = 'SCOTT';