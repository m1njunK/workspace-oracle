-- Excercise
-- 1.
-- EMP ���̺�
-- HIREDATE �������� 3������ ���� ù��° �����Ͽ� �������� �˴ϴ�.
-- R_JOB �������� �Ǵ� ��¥ YYYY-MM-DD �������� ���
-- COMM ���� ����� N/A�� ������ּ���
SELECT EMPNO,ENAME,
    TO_CHAR(HIREDATE,'YYYY/MM/DD'),
    TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'������'),'YYYY-MM-DD'), 
    NVL(TO_CHAR(COMM),'N/A') FROM EMP;

-- MGR �Ŵ��� : ���ӻ�� �����ȣ
-- CHG_MGR (DECODE OR CASE)
--  �Ŵ����� ���� ��� : 0000
--  ���ڸ� 75 : 5555
--  ���ڸ� 76 : 6666
--  ���ڸ� 77 : 7777
--  ���ڸ� 78 : 8888
--  �⺻���� �״�� ���
SELECT 
    EMPNO,ENAME,TO_CHAR(NVL2(MGR,TO_CHAR(MGR),' ')) AS MGR,
        CASE SUBSTR(NVL2(TO_CHAR(MGR),TO_CHAR(MGR),'0000'),0,2)
            WHEN '75' THEN '5555'
            WHEN '76' THEN '6666'
            WHEN '77' THEN '7777'
            WHEN '78' THEN '8888'
            ELSE NVL2(TO_CHAR(MGR),TO_CHAR(MGR),'0000')
            END AS CHG_MGR
FROM EMP;

SELECT EMPNO,ENAME,
    CASE
        WHEN MGR IS NULL THEN '0000'
        WHEN SUBSTR(MGR,1,2) = '75' THEN '5555'
        WHEN SUBSTR(MGR,1,2) = '76' THEN '6666'
        WHEN SUBSTR(MGR,1,2) = '77' THEN '7777'
        WHEN SUBSTR(MGR,1,2) = '78' THEN '8888'
        ELSE TO_CHAR(MGR)
    END
FROM EMP;