-- SYNONYM ���Ǿ�
-- ���̺� �̸��� �ʹ� �� ��, ��ü(��, �ε���, ������) ���� �̸��� �����ϰ�
-- ª�� ����ϰ� ���� �� ������ش�.

CREATE SYNONYM ���Ǿ��̸�
FOR [�����.][��ü�̸�];

-- ������ ���� �� DCL
GRANT CREATE SYNONYM TO SCOTT;

CREATE SYNONYM E
    FOR EMP;
    
SELECT * FROM E;

-- ���Ǿ� ����
DROP SYNONYM E;

