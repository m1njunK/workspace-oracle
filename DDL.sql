-- DDL (Data Definition Language)

-- OBJECT(객체)와 TABLE의 생성, 변경, 삭제 관련 기능을 수행합니다.
-- * DDL을 사용하게 될 경우 COMMIT 효과가 발생한다.
-- DML을 사용하고 DDL을 사용하면 커밋이 되어 영구히 데이터베이스에 반영

-- 테이블을 생성하는 CREATE

CREATE TABLE (소유계정).테이블이름(
    열1 이름 열1 자료형,
    열2 이름 열2 자료형,
    .....
);
DESC EMP;
-- 생성 규칙 : 문자로 시작해야 한다. 30Byte 이하, 계정에 같은 이름 중복불가
--            예약어(select, from ... ) 사용불가
CREATE TABLE EMP_DDL (
    EMPNO    NUMBER(4),
    ENAME    VARCHAR2(10),
    JOB      VARCHAR2(9),
    MGR      NUMBER(4),
    HIREDATE DATE,
    SAL      NUMBER(7,2),
    COMM     NUMBER(7,2),
    DEPTNO   NUMBER(2)
);
DESC EMP_DDL;
SELECT * FROM EMP_DDL;

-- AS문을 사용하여 기본 테이블 구조와 일부 데이터를 복사해서 생성하기
CREATE TABLE EMP_DDL_30
    AS SELECT * FROM EMP WHERE DEPTNO = 30;
SELECT * FROM EMP_DDL_30;

-- DDL ALTER 테이블을 변경
CREATE TABLE EMP_ALTER
    AS SELECT * FROM EMP;

SELECT * FROM EMP_ALTER;

-- [ ALTER ADD : 열(컬럼) 추가 ]
ALTER TABLE EMP_ALTER   -- 테이블명
ADD HP VARCHAR2(20);     -- 추가할 컬럼명 데이터타입

SELECT * FROM EMP_ALTER;

-- [ ALTER RENAME : 열(컬럼) 이름 변경 ]
ALTER TABLE EMP_ALTER
RENAME COLUMN HP TO TEL; 

SELECT * FROM EMP_ALTER;

DESC EMP_ALTER;
-- [ ALTER MODIFY : 열의 자료형을 변경 ]
ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(5);

-- [ ALTER DROP : 열을 삭제하기 ]
ALTER TABLE EMP_ALTER
DROP COLUMN TEL;

SELECT * FROM EMP_ALTER;

-- 테이블 이름 변경 RENAME
RENAME (테이블명) TO 변경할 테이블명;
RENAME EMP_ALTER TO EMP_RENAME;

SELECT * FROM EMP_RENAME;

-- 테이블 데이터 삭제하기 TRUNCATE
TRUNCATE TABLE EMP_RENAME;  -- DDL이기 때문에 COMMIT이 포함되어 롤백 불가.
ROLLBACK;

-- 테이블 자체를 삭제할 때 DROP
DROP TABLE EMP_RENAME; 