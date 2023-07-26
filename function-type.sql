-- ����ȯ
-- ���� �����ͷ� ��ȯ TO_CHAR(������, ��������)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS');
SELECT TO_CHAR(SYSDATE, 'MM'),  --  04
    TO_CHAR(SYSDATE, 'MON'),    --  APR
    TO_CHAR(SYSDATE, 'MONTH');  --  APRIL
    
SELECT TO_CHAR(SYSDATE, 'DD'),  --  ��¥
    TO_CHAR(SYSDATE, 'DY'),    --   WED
    TO_CHAR(SYSDATE, 'DAY');  --  WEDNESEDAY
SELECT TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE');
SELECT TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH');

-- ���ڵ����� �������ϱ�
SELECT SAL,
    TO_CHAR(SAL, '$999,999'),
    TO_CHAR(SAL, '999,999'),
    TO_CHAR(SAL, '999,999.00'),
    TO_CHAR(SAL, '000999,999')
FROM EMP;

-- TO_NUMBER ���ڷ� ��ȯ�ϴ� �Լ�
-- TO_NUMBER(������, ����)
SELECT SAL,
    TO_NUMBER('1,300', '999,999')
FROM EMP;

-- TO_DATE ��¥�����ͷ� ��ȯ
-- TO_DATE(������, ����)
SELECT TO_DATE('20230712','YYYY-MM-DD');

-- NULL ó�� �Լ�
-- NVL(�� ���θ� �˻��� ������, ���� ��� ��ȯ�� ������)
SELECT ENAME, COMM, NVL(COMM, 0) FROM EMP;

-- NVL2(�� ���θ� �˻��� ������, ���� �ƴ� ��� ��ȯ�� ������,���� ��� ��ȯ�� ������)
SELECT ENAME, COMM, NVL2(COMM,'O','�뿹') AS ISCOMM FROM EMP;

-- DECODE - CASE    (SWITCH - CASE)
-- DECODE(�˻� ����� �� ������, ����1, ����2, .... ����N, �ش���� �� ��ȯ ��)
SELECT ENAME, JOB, SAL,
    DECODE(JOB,
        'MANAGER', SAL*1.1,
        'SALESMAN', SAL*1.05,
        'ANALYST', SAL,
        SAL * 1.03) AS UPSAL
FROM EMP;

SELECT ENAME, JOB, SAL,
    CASE JOB
        WHEN 'MANAGER' THEN SAL*1.1
        WHEN 'SALESMAN' THEN SAL*1.05
        WHEN 'ANALYST' THEN SAL
        ELSE SAL * 1.03
        END AS UPSAL
FROM EMP;

