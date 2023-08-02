-- OBJECT
-- DATA DICTIONARY
-- 특수 테이블 (데이터베이스 생성할 때 자동으로 만들어지는 테이블)
-- 데이터베이스 운영에 중요한 데이터가 보관되어 있습니다.

-- 접두어에 따른 분류
-- USER_    : 사용자가 소유한 객체 정보
-- ALL_     : 사용 허가가 있는 모든 객체 정보
-- DBA_     : 데이터베이스 관리 권한을 가진 정보
-- V$_      : 데이터베이스 성능 관련 정보

SELECT * FROM DICTIONARY;

-- 사용자가 사용할 수 있는 테이블 확인
SELECT TABLE_NAME FROM USER_TABLES;

-- 접근 가능한 모든 테이블 확인
SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

-- DBA 관리권한 테이블 확인 
-- (보안땜에 안알려줌)
SELECT * FROM DBA_TABLES;
SELECT * FROM DBA_USERS WHERE USERNAME = 'SCOTT';