

-- ���ڿ� �� 
CREATE TABLE CHAR_COMPARE (
    sn CHAR(10),
    char_compare_4 CHAR(4),
    char_compare_6 CHAR(6)
);

INSERT INTO char_compare
VALUES ('10001','SQLD','SQLD');


INSERT INTO char_compare
VALUES ('10002','SQLD','SQLA');

COMMIT;

SELECT 
    REPLACE(CHAR_COMPARE_4,' ','-') AS char_compare_4,
    REPLACE(CHAR_COMPARE_6,' ','-') AS char_compare_6
FROM char_compare
WHERE sn = '10001'
    AND char_compare_4 = char_compare_6;
    
SELECT 
    REPLACE(CHAR_COMPARE_4,' ','-') AS char_compare_4,
    REPLACE(CHAR_COMPARE_6,' ','-') AS char_compare_6
FROM char_compare
WHERE sn = '10002'
    AND char_compare_4 > char_compare_6;



CREATE TABLE VARCHAR_COMPARE (
    sn CHAR(10),
    char_compare_4 CHAR(4),
    varchar_compare_6 VARCHAR2(6)
);

INSERT INTO varchar_compare
VALUES ('10001','SQLD','SQLD  ');


INSERT INTO varchar_compare
VALUES ('10002','SQLD','SQLA  ');

COMMIT;

-- ������� �� 
SELECT 
    REPLACE(CHAR_COMPARE_4,' ','-') AS char_compare_4,
    REPLACE(VARCHAR_COMPARE_6,' ','-') AS varchar_compare_6
FROM varchar_compare
WHERE sn = '10001'
    AND char_compare_4 = 'SQLD';
    
    
SELECT 
    REPLACE(CHAR_COMPARE_4,' ','-') AS char_compare_4,
    REPLACE(VARCHAR_COMPARE_6,' ','-') AS varchar_compare_6
FROM varchar_compare
WHERE sn = '10001'
    AND varchar_compare_6 = 'SQLD';


-- # ������ �Լ�
-- ## ���ڿ� �Լ�
SELECT 
    LOWER('SQL Developper') AS "LOWER('SQL Developer')", -- ���� �ҹ��ڸ� ��ȯ 
    UPPER('SQL Developper') AS "UPPER('SQL Developer')", -- ���� �빮�ڷ� ��ȯ 
    ASCII('A') AS "ASCII('A')", -- ���ڸ� �ƽ�Ű�ڵ�� ��ȯ
    CHR('65') AS "CHR('65')", -- �ƽ�Ű�ڵ带 ���ڷ� ��ȯ
    CONCAT('SQL','Developper') AS "CONCAT('SQL','Developer')", -- ���ڿ��� ���� 
    SUBSTR('SQL Developper',1,3) AS "SUBSTR('SQL Developer',1,3)", -- ��ġ���� ������ŭ �ڸ�(��ġ�� 1���� ����)
    LENGTH('SQL') AS "LENGTH('SQL')", -- ���ڿ��� ���̸� ��ȯ  
    LTRIM('SQL') AS "LTRIM(' SQL')", -- ���� ������ ���� 
    RTRIM('SQL') AS "RTRIM('SQL ')", --  ������ ������ ����
    RPAD('Steve',10,'-') AS "RPAD('Steve',10,'-')", -- �����ʿ� �־��� ���ڷ� ä�� 
    LPAD('Steve',10,'*') AS "LPAD('Steve',10,'*')", -- ���ʿ� �־��� ���ڷ� ä��
    REPLACE('Java Programmer','Java','BigData') AS "REPLACE" -- ���ڸ� ��ü��
FROM DUAL;

-- ## ������ �Լ�
SELECT
    MOD(27,5) AS MOD,-- �������� ��ȯ
    CEIL(38.678) AS CEIL, -- �ø��� ��ȯ 
    FLOOR(38.678) AS FLOOR, -- ������ ��ȯ
    ROUND(38.678, 2) AS ROUND, -- �ڸ������� �ݿø�
    TRUNC(38.678, 2) AS TRUNC -- �ڸ��� ���ϸ� ����
FROM DUAL;

-- ## ��¥���Լ�
-- ���� ��¥�� ��� 
SELECT
    SYSDATE
FROM DUAL;

-- ���� ��¥�� �ð� ��ȸ
SELECT
    SYSTIMESTAMP
FROM DUAL;

SELECT
    *
FROM td_emp;

-- ��¥ ���� 
-- ��¥ + ���� - ��¥ -> ��(day)���� ��¥�� ���� 
-- ��¥ - ���� - ��¥ -> ��¥���� �ϼ��� ��
-- ��¥ - ��¥ = �ϼ� -> � ��¥���� �ٸ� ��¥�� �� �Լ�
-- ��¥ + ����/24 = ��¥ -> ��¥�� �ð��� ���� 

SELECT
    SYSDATE - 1 AS "SYSDATE - 1",
    (SYSDATE + 10) - SYSDATE AS "��¥ - ��¥",
    SYSTIMESTAMP - (1/24) AS "1�ð�����",
    SYSTIMESTAMP - (100/24/60) AS "100������",
    SYSTIMESTAMP - (1/24/60/60) * 30 AS "30������"
FROM DUAL;

-- ## ��ȯ �Լ� 
-- ��¥�� ���ڷ� ��ȯ (TO_CHAR�Լ�)
-- ��¥�� ������������ : Y - ����, MM - ���ڸ� ��, D - �ϼ�
-- �ð��� ������������ : HH12 - (1-12), HH24(0-24),MI - ��, SS - ��, AM PM - ���� ���� 
SELECT
    TO_CHAR(SYSDATE,'MM - DD') AS "��¥(��,��)",
    TO_CHAR(SYSDATE,'YYYY/MM/DD') AS "��¥(��,��,��)",
    TO_CHAR(SYSDATE,'YYYY"��" MM"��" DD"��"') AS "��¥-�ѱ�����",
    TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS') AS "��¥�� �ð�",
    TO_CHAR(SYSDATE,'YYYY/MM/DD AM HH12:MI:SS') AS "��¥�� �ð�2"
FROM DUAL;

-- ���ڸ� ���ڷ� ��ȯ 
-- ���� ���� ���� 
-- $: �޷� ��ȣ, L: ����ȭ���ȣ, .: �Ҽ��� ǥ��, ,: �޸�ǥ��
SELECT
    TO_CHAR(9500,'$999,999') AS "�޷�",
    TO_CHAR(1350000,'999,999,999L') AS "��ȭ"
FROM DUAL;

-- # ���� ��ȯ �Լ� TO_NUMBER
SELECT
    TO_NUMBER('$5,500','$999,999')- 4000 AS "�����"
FROM DUAL;