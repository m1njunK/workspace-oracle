SELECT * FROM DEPT_TCL;

-- Ŀ�� �� : ���� 1���� ������ �����Ͱ�
-- �״�� ����
SELECT * FROM DEPT_TCL;
-- Ŀ�� �� : ����1���� ������ ������ �ݿ�
SELECT * FROM DEPT_TCL;

-- �б� �ϰ���(read consistency)
-- �����͸� ���� �����ϴ� ���� ��
-- �ٸ� ���ǿ����� ������ �ϰ�������
-- ��ȸ, ���, �˻� �Ǵ� Ư��

SELECT * FROM DEPT_TCL;

-- ���� 1���� �������� �����͸�
-- ���� 2�� �����ϰ� �� ��
-- ����� �����ϸ� ���߰� �ȴ�. (LOCK)
UPDATE DEPT_TCL SET DNAME='DATABASE'
WHERE DEPTNO = 30;
-- �ٸ� ������ ������ ������ �Ϸ�ɶ�����
-- ��ٸ��� ���� : HANG
SELECT * FROM DEPT_TCL;
-- 30�� �����ʹ� ����2�� ���� LOCK�� ����
COMMIT;

SELECT * FROM DEPT_TCL;