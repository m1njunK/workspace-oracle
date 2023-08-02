-- DML UPDATE ������ ����

CREATE TABLE DEPT_TEMP2
    AS SELECT * FROM DEPT;
    
SELECT * FROM DEPT_TEMP2;

-- UPDATE���� ����
-- UPDATE [���̺�]
-- SET [������ ��1] = [������ ��1],[������ �� 2] = [������ ��2], ....
-- WHERE ������ ����� �����ϴ� ����

UPDATE DEPT_TEMP2
SET LOC='SEOUL';
-- �������� ���� ���� ��� ������ ���� ��� �����Ͱ� �����ȴ�.
SELECT * FROM DEPT_TEMP2;
-- ������ ������ �ǵ����� ���� ��;
ROLLBACK; -- TCL

UPDATE DEPT_TEMP2
SET LOC='SEOUL'
WHERE DEPTNO=40;
SELECT * FROM DEPT_TEMP2;

-- �������� ����ϱ�
SELECT DNAME, LOC FROM DEPT WHERE DEPTNO = 40;

UPDATE DEPT_TEMP2
SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO = 40)
WHERE DEPTNO = 40;

SELECT * FROM DEPT_TEMP2;

-- WHERE ������ ����ϴ� ���
UPDATE DEPT_TEMP2
SET LOC = 'SEOUL'
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT_TEMP2 WHERE DNAME='OPERATIONS');

SELECT * FROM DEPT_TEMP2;

SELECT DEPTNO FROM DEPT_TEMP2 WHERE DNAME='OPERATIONS';
-- UPDATE������ ���������� ����� �� ������
-- �� SELECT������ �ѹ� Ȯ���ϰ�, UPDATE������ �ۼ��� ��.