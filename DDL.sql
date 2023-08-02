-- DDL (Data Definition Language)

-- OBJECT(��ü)�� TABLE�� ����, ����, ���� ���� ����� �����մϴ�.
-- * DDL�� ����ϰ� �� ��� COMMIT ȿ���� �߻��Ѵ�.
-- DML�� ����ϰ� DDL�� ����ϸ� Ŀ���� �Ǿ� ������ �����ͺ��̽��� �ݿ�

-- ���̺��� �����ϴ� CREATE

CREATE TABLE (��������).���̺��̸�(
    ��1 �̸� ��1 �ڷ���,
    ��2 �̸� ��2 �ڷ���,
    .....
);
DESC EMP;
-- ���� ��Ģ : ���ڷ� �����ؾ� �Ѵ�. 30Byte ����, ������ ���� �̸� �ߺ��Ұ�
--            �����(select, from ... ) ���Ұ�
CREATE TABLE EMP_DDL (
    EMPNO    NUMBER(4),
    ENAME    VARCHAR2(10),
    JOB      VARCHAR2(9),
    MGR      NUMBER(4),
    HIREDATE DATE,
    SAL      NUMBER(7,2),
    COMM     NUMBER(7,2),
    DEPTNO   NUMBER(2)
);
DESC EMP_DDL;
SELECT * FROM EMP_DDL;

-- AS���� ����Ͽ� �⺻ ���̺� ������ �Ϻ� �����͸� �����ؼ� �����ϱ�
CREATE TABLE EMP_DDL_30
    AS SELECT * FROM EMP WHERE DEPTNO = 30;
SELECT * FROM EMP_DDL_30;

-- DDL ALTER ���̺��� ����
CREATE TABLE EMP_ALTER
    AS SELECT * FROM EMP;

SELECT * FROM EMP_ALTER;

-- [ ALTER ADD : ��(�÷�) �߰� ]
ALTER TABLE EMP_ALTER   -- ���̺��
ADD HP VARCHAR2(20);     -- �߰��� �÷��� ������Ÿ��

SELECT * FROM EMP_ALTER;

-- [ ALTER RENAME : ��(�÷�) �̸� ���� ]
ALTER TABLE EMP_ALTER
RENAME COLUMN HP TO TEL; 

SELECT * FROM EMP_ALTER;

DESC EMP_ALTER;
-- [ ALTER MODIFY : ���� �ڷ����� ���� ]
ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(5);

-- [ ALTER DROP : ���� �����ϱ� ]
ALTER TABLE EMP_ALTER
DROP COLUMN TEL;

SELECT * FROM EMP_ALTER;

-- ���̺� �̸� ���� RENAME
RENAME (���̺��) TO ������ ���̺��;
RENAME EMP_ALTER TO EMP_RENAME;

SELECT * FROM EMP_RENAME;

-- ���̺� ������ �����ϱ� TRUNCATE
TRUNCATE TABLE EMP_RENAME;  -- DDL�̱� ������ COMMIT�� ���ԵǾ� �ѹ� �Ұ�.
ROLLBACK;

-- ���̺� ��ü�� ������ �� DROP
DROP TABLE EMP_RENAME; 