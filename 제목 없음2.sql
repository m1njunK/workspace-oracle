-- ���̺��� �����ϴ� DDL
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP;

-- ���̺� �����͸� �߰� INSERT
-- INSERT INTO ���̺� �̸� (���̸�1, ���̸�2, ....)
-- VALUES (���̸�1�� �� ������, ���̸�2�� �� ������, ....)

INSERT INTO DEPT_TEMP (deptno, DNAME, LOC)
VALUES(50, 'DATABASE', 'SEOUL');

-- ���� ��Ȳ : ������Ÿ�Կ� ���� �ʰų�, ���̰� ���� �ʰų�, ������ �����͸� ���� �ְų�
-- INSERT INTO DEPT_TEMP (deptno, DNAME, LOC)
--            VALUES(123,'DATABASE','SEOUL','ABCD');

-- �� �̸� ���̵� INSERT���� ��������� �������� �ʴ� ���� ����.
INSERT INTO DEPT_TEMP
        VALUES(70,'WEB','BUSAN');
SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP
        VALUES(70,'WEB',NULL);
SELECT * FROM DEPT_TEMP;
-- �ǹ������� �����ͺ��̽��� �ͼ����� ���� ����� ���Ƶ� �򰥸��� �ʰ�
-- ��������� NULL�� ����Ѵ�.
INSERT INTO DEPT_TEMP
        VALUES(80,'MOBILE','');
SELECT * FROM DEPT_TEMP;

-- �� ���� �Է����� ������ NULL�� ä������.
INSERT INTO DEPT_TEMP (DEPTNO, DNAME)
        VALUES(90,'WEB');
SELECT * FROM DEPT_TEMP;

-- EMP ���̺� ����
CREATE TABLE EMP_TEMP
    AS SELECT * FROM EMP WHERE 1 != 1;
SELECT * FROM EMP_TEMP;

DESC EMP_TEMP;
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES (9999, 'ȫ�浿', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);
-- DATE���� ������ �� ���� 'YYYY/MM/DD', 'YYYY-MM-DD'
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES (1111, '������', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);
SELECT * FROM EMP_TEMP;
-- ��¥������ �Է��Ҷ� ������ 'DD/MM/YYYY' <- �̷��� ������ �ٲٸ� ������ �߻��Ѵ�.
-- TO_DATE �Լ��� �Է��ϴ� ������ �ٲ� �� �ִ�.
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES (2111, '�̼���', 'MANAGER', 9999, TO_DATE('07/01/2001', 'DD/MM/YYYY'), 4000, NULL, 20);
SELECT * FROM EMP_TEMP;
-- �ý��� ��¥ �Է�(���� ����)
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES (9999, '��û��', 'PRESIDENT', 9999, SYSDATE, 5000, NULL, 10);
SELECT * FROM EMP_TEMP;

SELECT * 
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
AND S.GRADE = 1;