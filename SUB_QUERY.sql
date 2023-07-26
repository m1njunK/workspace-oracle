-- ��������
-- SQL���� ������ �� SQL �� ���ο��� ����ϴ� SELECT��

-- WHERE ���������� ����� ���

-- ��������
--SELECT �÷�
--FROM ���̺�
--WHERE ���ǽ� ( SELECT �÷�
--              FROM ���̺�
--              WHERE ���ǽ� )
              -- ��������
              
SELECT SAL
FROM EMP
WHERE ENAME = 'JONES';

-- ���������� �޿��� ���� �޴� ����� ��ȸ
SELECT *
FROM EMP
WHERE SAL > (SELECT SAL
FROM EMP
WHERE ENAME = 'JONES'
);

-- ���������� Ư¡
-- 1. ���������� ���� �� ��ȸ ����� �������� ���̸� ��ȣ�� ���� ���
-- 2. ���������� SELECT ���� ����� �÷��� �� ���� ���� �ڷ���(data type)�̾�� �մϴ�.
--    ���� ������ �����ؾ� �մϴ�.
-- 3. ������������ ��� �� ��(ROW COUNT)�� ���������� ������ ������ ȣȯ�Ǿ�� �մϴ�.

-- EMP ���̺��� ��� �̸��� ALLEN�� ����� �߰�����(COMM)���� �߰����� ���� �޴� ������ ����
-- ���ϴ� SQL�� �ۼ�

SELECT * FROM EMP WHERE COMM > (SELECT COMM FROM EMP WHERE ENAME = 'ALLEN');