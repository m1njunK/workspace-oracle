-- SEQUENCE
-- 순서, 순번을 생성하기 위한 객체
CREATE SEQUENCE 시퀀스이름
[INCREMENT BY n] -- 얼마씩 증가할 것인지
[START WITH n]   -- 몇번부터 시작할것인지
[MAXVALUE n | NO...]     -- 최대값을 얼마로 할거냐
[MINVALUE n | NO...]     -- 최소값을 얼마로 할거냐
[CYCLE | NOCYCLE]   -- 최대값에 도달했을 때 처음부터 다시 시작할 것인지       
[CACHE n | NOCACHE] -- 메모리에 할당한 수를 쓸 것인지 

CREATE TABLE DEPT_SEQ
    AS SELECT * FROM DEPT WHERE 1 != 1;

SELECT * FROM DEPT_SEQ;

CREATE SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 10
    START WITH 10
    MAXVALUE 90
    NOCYCLE
    CACHE 2;
    
SELECT * FROM USER_SEQUENCES;

-- 시퀀스를 사용하여 데이터 삽입하기
-- 시퀀스 생성 확인하기
INSERT INTO DEPT_SEQ (DEPTNO, DNAME, LOC)
    VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');
    
SELECT * FROM DEPT_SEQ;

-- 가장 마지막으로 생성된 시퀀스 확인하기
SELECT SEQ_DEPT_SEQUENCE.CURRVAL;

ALTER SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 3
    MAXVALUE 99
    CYCLE;
    
SELECT * FROM USER_SEQUENCES;

-- 시퀀스 삭제 : 시퀀스가 삭제되어도 시퀀스로 생성된 순서 데이터는 남아있다.
DROP SEQUENCE SEQ_DEPT_SEQUENCE;
SELECT * FROM USER_SEQUENCES;
SELECT * FROM DEPT_SEQ;