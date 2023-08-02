-- INDEX
-- 인덱스 : 책의 목차
-- 데이터 검색 방식
    -- 1. table full scan
    -- 2. index scan
-- 모든 데이터를 읽는 것보다 데이터 검색의 성능 향상이 필요할 때 INDEX를 사용한다.

-- 사용자 계정이 소유한 인덱스 정보 확인
SELECT * FROM USER_INDEXES;

-- 사용자 계정이 소유한 인덱스 컬럼 확인   
SELECT * FROM USER_IND_COLUMNS;   

-- 사용자가 INDEX를 만들 수 있지만, 컬럼이 기본키(PK) 고유키(UK)일 때 자동 생성

-- 인덱스 생성하기
CREATE INDEX 인덱스 이름
    ON 테이블이름(열이름1 [ASC/DESC],
                열이름1 [ASC/DESC], .... );
                
CREATE INDEX IDX_EMP_SAL
    ON EMP(SAL);        -- 정렬 옵션 미지정시 기본 ASC
    
SELECT * FROM USER_IND_COLUMNS;

-- WHERE 조건에 SAL 컬럼(INDEX) 지정한 컬럼이 있을 경우 검색 속도 빨라짐.

-- 서비스에서 자주 조회하는 컬럼이 있을 때 인덱스를 생성하면 속도 향상
-- 인덱스를 지정한다고 데이터 조회가 반드시 빨라지는 것은 아님.
-- 인덱스를 지정할 열의 선정 : 데이터 구조, 데이터 분포, 서비스 이용.

-- 인덱스 삭제
DROP INDEX 인덱스이름;

DROP INDEX IDX_EMP_SAL;

SELECT * FROM USER_IND_COLUMNS;

-- 인덱스를 생성할때 정확한 데이터 분석이 필요
-- 무분별한 인덱스 생성은 오히려 성능을 떨어뜨리는 원인이 되기도 함.
-- SQL 튜닝

SELECT * FROM EMP;
SELECT * FROM DEPT;
