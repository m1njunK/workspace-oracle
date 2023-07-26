-- 함수2
-- 문자열 추출
-- 길이를 지정하지 않으면 끝까지 추출한다. substr(문자열,시작위치)
SELECT job, substr(job,1,2), substr(job, 3,2), substr(job,5) from emp;
-- Q1. 사원 이름을 세번째 글자에서 끝까지 출력되게 해주세요.
SELECT substr(ename,3) FROM emp;
-- 다른 함수와 같이 사용
SELECT JOB, 
SUBSTR(JOB, -LENGTH(JOB)), 
SUBSTR(JOB, -LENGTH(JOB), 2),
SUBSTR(JOB, -2)
FROM EMP;

-- 문자열 데이터에서 위치를 찾는 함수 INSTR
-- INSTR(문자열 데이터, 찾으려는 문자,[시작위치 기본값1],[시작위치에서 몇번째])
SELECT INSTR('HELLO, ORACLE!', 'L') as instr_l,
    INSTR('HELLO, ORACLE!', 'L', 5),
    INSTR('HELLO, ORACLE!', 'L', 2,2); -- 두번째 등장하는 문자열 찾고 싶을때

-- WHERE 절에 사용하기
-- Q1. INSTR함수로 사원이름에 S가 있는 컬럼을 구하기
SELECT * FROM emp WHERE ENAME LIKE '%S%';
SELECT * FROM emp WHERE INSTR(ename,'S') > 0;

-- REPLACE 함수 : 문자열을 바꾼다.
-- REPLACE(문자열, 찾는 문자, 바꿀 문자)
SELECT '010-1234-5678',
    REPLACE('010-1234-5678','-',' '),
    REPLACE('010-1234-5678', '-');
-- LPAD, RPAD
-- LPAD(문자열, 자릿수, [채울 문자])
SELECT 'Oracle',
    LPAD('Oracle',10,'*'),
    LPAD('1234',10,'0'),
    RPAD('800101-1',14,'*'),
    RPAD('Oracle',10),
    LPAD('Oracle',10); -- 채울문자 없으면 기본값 공백
    
-- CONCAT 함수 : 두 문자열 합침
SELECT CONCAT(EMPNO,ENAME) FROM EMP;
SELECT CONCAT(EMPNO, CONCAT(' : ', ENAME)) FROM EMP;

-- TRIM 함수 LTRIM, RTRIM 함수
-- 공백제거
SELECT TRIM('   ORACLE    '),
    LTRIM('  ORACLE   '),
    RTRIM('  ORACLE   ');

-- EXCERCISE : ENAME이 5글자 이상이고, 6글자 미만인 사원 정보를 출력
-- MASKING_ENAME 이라는 컬럼을 만듭니다. 사원이름 첫글자만 남기고 나머지 *
-- 사원번호, MASKIN_EMPNO 앞 두글자만 놔두고 뒤는 **
SELECT 
    EMPNO,
    RPAD(SUBSTR(EMPNO,1,2),LENGTH(EMPNO),'*') AS MASKING_EMPNO,
    ENAME,
    RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*') AS MASKING_ENAME 
    FROM EMP WHERE LENGTH(ENAME) >= 5 AND LENGTH(ENAME) < 6;