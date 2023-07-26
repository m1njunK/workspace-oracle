-- ��¥ �Լ� SYSDATE
-- + - �����ڷ� ��� ����
SELECT SYSDATE,
       SYSDATE + 1, 
       SYSDATE - 1 ;
-- ���� ������ִ� �Լ� ADD_MONTHS (��¥, ���� ������)
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3);

-- Q. �Ի���(HIREDATE)�� 10�ֳ� �Ǵ� ���� ������ּ���.
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 120) AS W10YEAR FROM EMP;

-- ���� ���� ���ϴ� �Լ� MONTHS_BETWEEN
-- MOTHES_BETWEEN(��¥1, ��¥2)
SELECT ENAME, HIREDATE, 
    ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS WORKDATE 
    FROM EMP;

-- ���ƿ��� ����    
-- NEXT_DAY(��¥, ���Ϲ���)
SELECT SYSDATE, NEXT_DAY(SYSDATE, '������');
-- LAST_DAY(��¥ ������)
SELECT SYSDATE, LAST_DAY(SYSDATE);

-- ��¥ �Լ��� �ݿø�, �����ϱ�
-- ROUND(��¥, ��¥����)
-- TRUNC(��¥, ��¥����)
-- ISO 8604 ������ ������ �ȴ�
SELECT SYSDATE,
    ROUND(SYSDATE, 'YYYY'),     -- ������ �ݿø�
    TRUNC(SYSDATE, 'YYYY'),
    ROUND(SYSDATE, 'Q'),        -- �б⺰ �ݿø�
    TRUNC(SYSDATE, 'MM'),
    ROUND(SYSDATE, 'DD');

-- SYSDATE, MONTH���� �Լ�, ����, ��������¥, ROUND, TRUNC ��¥ ����