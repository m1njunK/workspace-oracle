-- 데이터 조작어 (DML)

-- 테이블을 생성하는 DDL
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;
    
SELECT * FROM DEPT_TEMP;

-- 테이블에 데이터를 추가 INSERT
-- INSERT INTO 테이블 이름 (열이름1, 열이름2, ....)
-- VALUES (열이름1에 들어갈 데이터, 열이름2에 들어갈 데이터, .... )

INSERT INTO DEPT_TEMP (deptno, DNAME, LOC)
               VALUES (50, 'DATABASE', 'SEOUL');
               
SELECT * FROM DEPT_TEMP;               
DESC DEPT_TEMP;
-- 에러 상황 : 데이터타입에 맞지 않거나, 길이가 맞지 않거나, 열보다 데이터를 많이 넣거나
-- INSERT INTO DEPT_TEMP (deptno, DNAME, LOC)
--                VALUES (123, 'DATABASE', 'SEOUL', 'ABCD');

-- 열 이름 없이도 INSERT문이 수행되지만 생략하지 않는 편이 좋다.
INSERT INTO DEPT_TEMP 
               VALUES (60, 'NETWORK', 'BUSAN');
SELECT * FROM DEPT_TEMP;               

--- NULL 값 넣기
INSERT INTO DEPT_TEMP 
               VALUES (70, 'WEB', NULL);
SELECT * FROM DEPT_TEMP;               
-- 실무에서는 데이터베이스에 익숙하지 않은 사람이 보아도 헷갈리지 않게
-- 명시적으로 NULL을 사용한다.
INSERT INTO DEPT_TEMP 
               VALUES (80, 'MOBILE', '');
SELECT * FROM DEPT_TEMP;

-- 열 값을 입력하지 않으면 NULL이 채워진다.
INSERT INTO DEPT_TEMP (DEPTNO, DNAME)
               VALUES (90, 'MOBILE');
SELECT * FROM DEPT_TEMP;

-- EMP 테이블 생성
CREATE TABLE EMP_TEMP
    AS SELECT * FROM EMP WHERE 1 != 1;
SELECT * FROM EMP_TEMP;

DESC EMP_TEMP;
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
              VALUES (9999, '홍길동', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);
-- DATE 타입을 삽입할 때 형식 'YYYY/MM/DD', 'YYYY-MM-DD'
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
              VALUES (1111, '성춘향', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);
SELECT * FROM EMP_TEMP;
-- 날짜데이터 입력할때 주의점 'DD/MM/YYYY' <- 이렇게 순서를 바꾸면 오류가 발생한다.
-- TO_DATE 함수로 입력하는 형식을 바꿀 수 있다.
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
              VALUES (2111, '이순신', 'MANAGER', 9999, TO_DATE('07/01/2001', 'DD/MM/YYYY'), 4000, NULL, 20);
SELECT * FROM EMP_TEMP;
-- 시스템 날짜 입력(지금 시점)
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
              VALUES (3111, '심청이', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);
SELECT * FROM EMP_TEMP;