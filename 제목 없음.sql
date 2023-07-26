-- Excercise
-- 1.
-- EMP 테이블
-- HIREDATE 기준으로 3개월이 지난 첫번째 월요일에 정직원이 됩니다.
-- R_JOB 정직원이 되는 날짜 YYYY-MM-DD 형식으로 출력
-- COMM 없는 사원은 N/A로 출력해주세요
SELECT EMPNO,ENAME,
    TO_CHAR(HIREDATE,'YYYY/MM/DD'),
    TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일'),'YYYY-MM-DD'), 
    NVL(TO_CHAR(COMM),'N/A') FROM EMP;

-- MGR 매니저 : 직속상관 사원번호
-- CHG_MGR (DECODE OR CASE)
--  매니저가 없는 경우 : 0000
--  앞자리 75 : 5555
--  앞자리 76 : 6666
--  앞자리 77 : 7777
--  앞자리 78 : 8888
--  기본값은 그대로 출력
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