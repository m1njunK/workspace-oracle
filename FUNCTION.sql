-- 함수
-- 대소문자를 바꿔주는 함수
SELECT UPPER(ENAME),LOWER(ENAME), INITCAP(ENAME) FROM EMP;

-- 예시
-- SELECT * FROM 게시판
-- WHERE 게시판제목 LIKE '%oracle%';
-- 이렇게 했을 때 Oracle ORACLE 등의 정보는 검색이 되지 않는다.

SELECT ENAME FROM EMP WHERE ENAME = upper('smith');

-- Smith SMITH smith sMiTh
-- 다양한 데이터가 대소문자 구분 없이 들어와도
-- SQL문 조회에서 대소문자 함수를 사용하면 모든 종류의 데이터를 검색할 수 있다

-- 문자열의 길이 구하기
SELECT ENAME, LENGTH(ENAME) FROM EMP;
-- Q1. 사원 이름 길이가 5이상인 사람 출력하기
SELECT ENAME, LENGTH(ENAME) FROM EMP WHERE LENGTH(ENAME) >= 5;
-- Q2. 직책 이름 길이가 6이상인 데이터만 출력하기
SELECT * FROM EMP WHERE LENGTH(job) >= 6;