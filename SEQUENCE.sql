-- SEQUENCE
-- ����, ������ �����ϱ� ���� ��ü
CREATE SEQUENCE �������̸�
[INCREMENT BY n] -- �󸶾� ������ ������
[START WITH n]   -- ������� �����Ұ�����
[MAXVALUE n | NO...]     -- �ִ밪�� �󸶷� �Ұų�
[MINVALUE n | NO...]     -- �ּҰ��� �󸶷� �Ұų�
[CYCLE | NOCYCLE]   -- �ִ밪�� �������� �� ó������ �ٽ� ������ ������       
[CACHE n | NOCACHE] -- �޸𸮿� �Ҵ��� ���� �� ������ 

CREATE TABLE DEPT_SEQ
    AS SELECT * FROM DEPT WHERE 1 != 1;

SELECT * FROM DEPT_SEQ;

CREATE SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 10
    START WITH 10
    MAXVALUE 90
    NOCYCLE
    CACHE 2;
    
SELECT * FROM USER_SEQUENCES;

-- �������� ����Ͽ� ������ �����ϱ�
-- ������ ���� Ȯ���ϱ�
INSERT INTO DEPT_SEQ (DEPTNO, DNAME, LOC)
    VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');
    
SELECT * FROM DEPT_SEQ;

-- ���� ���������� ������ ������ Ȯ���ϱ�
SELECT SEQ_DEPT_SEQUENCE.CURRVAL;

ALTER SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 3
    MAXVALUE 99
    CYCLE;
    
SELECT * FROM USER_SEQUENCES;

-- ������ ���� : �������� �����Ǿ �������� ������ ���� �����ʹ� �����ִ�.
DROP SEQUENCE SEQ_DEPT_SEQUENCE;
SELECT * FROM USER_SEQUENCES;
SELECT * FROM DEPT_SEQ;