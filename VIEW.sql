-- VIEW

-- ���� ���̺�, ����Ʈ ���� ������ ��ü <-> ������ ������

SELECT * FROM
(SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO = 20);

-- ���� ��� ����
-- 1. ���� : ���⵵�� ��ȭ�ϱ� ����
-- 2. ���ȼ� : ���̺��� Ư�� ���� �����ϰ� ���� ���� ���

-- ������ ���� ��� SYSTEM �������κ��� ������ �ο� �޾ƾ� �Ѵ�.
-- DCL : ���� �ο� (GRANT / REVOKE)
GRANT CREATE VIEW TO SCOTT; -- �� ���� ���� �ο�

CREATE VIEW VW_EMP20
    AS (SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO = 20);
    
SELECT * FROM USER_VIEWS;

SELECT * FROM VW_EMP20;

-- VIEW ����
DROP VIEW VW_EMP20;

