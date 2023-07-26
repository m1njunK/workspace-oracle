-- �Լ�2
-- ���ڿ� ����
-- ���̸� �������� ������ ������ �����Ѵ�. substr(���ڿ�,������ġ)
SELECT job, substr(job,1,2), substr(job, 3,2), substr(job,5) from emp;
-- Q1. ��� �̸��� ����° ���ڿ��� ������ ��µǰ� ���ּ���.
SELECT substr(ename,3) FROM emp;
-- �ٸ� �Լ��� ���� ���
SELECT JOB, 
SUBSTR(JOB, -LENGTH(JOB)), 
SUBSTR(JOB, -LENGTH(JOB), 2),
SUBSTR(JOB, -2)
FROM EMP;

-- ���ڿ� �����Ϳ��� ��ġ�� ã�� �Լ� INSTR
-- INSTR(���ڿ� ������, ã������ ����,[������ġ �⺻��1],[������ġ���� ���°])
SELECT INSTR('HELLO, ORACLE!', 'L') as instr_l,
    INSTR('HELLO, ORACLE!', 'L', 5),
    INSTR('HELLO, ORACLE!', 'L', 2,2); -- �ι�° �����ϴ� ���ڿ� ã�� ������

-- WHERE ���� ����ϱ�
-- Q1. INSTR�Լ��� ����̸��� S�� �ִ� �÷��� ���ϱ�
SELECT * FROM emp WHERE ENAME LIKE '%S%';
SELECT * FROM emp WHERE INSTR(ename,'S') > 0;

-- REPLACE �Լ� : ���ڿ��� �ٲ۴�.
-- REPLACE(���ڿ�, ã�� ����, �ٲ� ����)
SELECT '010-1234-5678',
    REPLACE('010-1234-5678','-',' '),
    REPLACE('010-1234-5678', '-');
-- LPAD, RPAD
-- LPAD(���ڿ�, �ڸ���, [ä�� ����])
SELECT 'Oracle',
    LPAD('Oracle',10,'*'),
    LPAD('1234',10,'0'),
    RPAD('800101-1',14,'*'),
    RPAD('Oracle',10),
    LPAD('Oracle',10); -- ä�﹮�� ������ �⺻�� ����
    
-- CONCAT �Լ� : �� ���ڿ� ��ħ
SELECT CONCAT(EMPNO,ENAME) FROM EMP;
SELECT CONCAT(EMPNO, CONCAT(' : ', ENAME)) FROM EMP;

-- TRIM �Լ� LTRIM, RTRIM �Լ�
-- ��������
SELECT TRIM('   ORACLE    '),
    LTRIM('  ORACLE   '),
    RTRIM('  ORACLE   ');

-- EXCERCISE : ENAME�� 5���� �̻��̰�, 6���� �̸��� ��� ������ ���
-- MASKING_ENAME �̶�� �÷��� ����ϴ�. ����̸� ù���ڸ� ����� ������ *
-- �����ȣ, MASKIN_EMPNO �� �α��ڸ� ���ΰ� �ڴ� **
SELECT 
    EMPNO,
    RPAD(SUBSTR(EMPNO,1,2),LENGTH(EMPNO),'*') AS MASKING_EMPNO,
    ENAME,
    RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*') AS MASKING_ENAME 
    FROM EMP WHERE LENGTH(ENAME) >= 5 AND LENGTH(ENAME) < 6;