-- 형변환
-- 문자 데이터로 변환 TO_CHAR(데이터, 문자형태)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS');
SELECT TO_CHAR(SYSDATE, 'MM'),  --  04
    TO_CHAR(SYSDATE, 'MON'),    --  APR
    TO_CHAR(SYSDATE, 'MONTH');  --  APRIL
    
SELECT TO_CHAR(SYSDATE, 'DD'),  --  날짜
    TO_CHAR(SYSDATE, 'DY'),    --   WED
    TO_CHAR(SYSDATE, 'DAY');  --  WEDNESEDAY
SELECT TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE');
SELECT TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH');

-- 숫자데이터 포매팅하기
SELECT SAL,
    TO_CHAR(SAL, '$999,999'),
    TO_CHAR(SAL, '999,999'),
    TO_CHAR(SAL, '999,999.00'),
    TO_CHAR(SAL, '000999,999')
FROM EMP;

-- TO_NUMBER 숫자로 변환하는 함수
-- TO_NUMBER(데이터, 포맷)
SELECT SAL,
    TO_NUMBER('1,300', '999,999')
FROM EMP;

-- TO_DATE 날짜데이터로 변환
-- TO_DATE(데이터, 포맷)
SELECT TO_DATE('20230712','YYYY-MM-DD');

-- NULL 처리 함수
-- NVL(널 여부를 검사할 데이터, 널일 경우 반환할 데이터)
SELECT ENAME, COMM, NVL(COMM, 0) FROM EMP;

-- NVL2(널 여부를 검사할 데이터, 널이 아닐 경우 반환할 데이터,널일 경우 반환할 데이터)
SELECT ENAME, COMM, NVL2(COMM,'O','노예') AS ISCOMM FROM EMP;

-- DECODE - CASE    (SWITCH - CASE)
-- DECODE(검사 대상이 될 데이터, 조건1, 조건2, .... 조건N, 해당없을 때 반환 값)
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

