-- 날짜 함수 SYSDATE
-- + - 연산자로 계산 가능
SELECT SYSDATE,
       SYSDATE + 1, 
       SYSDATE - 1 ;
-- 달을 계산해주는 함수 ADD_MONTHS (날짜, 더할 개월수)
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3);

-- Q. 입사일(HIREDATE)이 10주년 되는 날을 출력해주세요.
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 120) AS W10YEAR FROM EMP;

-- 개월 차를 구하는 함수 MONTHS_BETWEEN
-- MOTHES_BETWEEN(날짜1, 날짜2)
SELECT ENAME, HIREDATE, 
    ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS WORKDATE 
    FROM EMP;

-- 돌아오는 요일    
-- NEXT_DAY(날짜, 요일문자)
SELECT SYSDATE, NEXT_DAY(SYSDATE, '월요일');
-- LAST_DAY(날짜 데이터)
SELECT SYSDATE, LAST_DAY(SYSDATE);

-- 날짜 함수에 반올림, 버림하기
-- ROUND(날짜, 날짜포맷)
-- TRUNC(날짜, 날짜포맷)
-- ISO 8604 포맷을 넣으면 된다
SELECT SYSDATE,
    ROUND(SYSDATE, 'YYYY'),     -- 연도로 반올림
    TRUNC(SYSDATE, 'YYYY'),
    ROUND(SYSDATE, 'Q'),        -- 분기별 반올림
    TRUNC(SYSDATE, 'MM'),
    ROUND(SYSDATE, 'DD');

-- SYSDATE, MONTH관련 함수, 요일, 마지막날짜, ROUND, TRUNC 날짜 포맷