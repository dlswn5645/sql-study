

-- 문자열 비교 
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

-- 삼수와의 비교 
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


-- # 단일행 함수
-- ## 문자열 함수
SELECT 
    LOWER('SQL Developper') AS "LOWER('SQL Developer')", -- 전부 소문자를 변환 
    UPPER('SQL Developper') AS "UPPER('SQL Developer')", -- 전부 대문자로 변환 
    ASCII('A') AS "ASCII('A')", -- 문자를 아스키코드로 변환
    CHR('65') AS "CHR('65')", -- 아스키코드를 문자로 변환
    CONCAT('SQL','Developper') AS "CONCAT('SQL','Developer')", -- 문자열을 연결 
    SUBSTR('SQL Developper',1,3) AS "SUBSTR('SQL Developer',1,3)", -- 위치부터 개수만큼 자름(위치는 1부터 시작)
    LENGTH('SQL') AS "LENGTH('SQL')", -- 문자열의 길이르 반환  
    LTRIM('SQL') AS "LTRIM(' SQL')", -- 왼쪽 공백을 제거 
    RTRIM('SQL') AS "RTRIM('SQL ')", --  오른쪽 공백을 제거
    RPAD('Steve',10,'-') AS "RPAD('Steve',10,'-')", -- 오른쪽에 주어진 문자로 채움 
    LPAD('Steve',10,'*') AS "LPAD('Steve',10,'*')", -- 왼쪽에 주어진 문자로 채움
    REPLACE('Java Programmer','Java','BigData') AS "REPLACE" -- 문자를 교체함
FROM DUAL;

-- ## 숫자형 함수
SELECT
    MOD(27,5) AS MOD,-- 나머지값 반환
    CEIL(38.678) AS CEIL, -- 올림값 반환 
    FLOOR(38.678) AS FLOOR, -- 내림값 반환
    ROUND(38.678, 2) AS ROUND, -- 자리수까지 반올림
    TRUNC(38.678, 2) AS TRUNC -- 자리수 이하를 절삭
FROM DUAL;

-- ## 날짜형함수
-- 현재 날짜를 출력 
SELECT
    SYSDATE
FROM DUAL;

-- 현재 날짜와 시간 조회
SELECT
    SYSTIMESTAMP
FROM DUAL;

SELECT
    *
FROM td_emp;

-- 날짜 연산 
-- 날짜 + 숫자 - 날짜 -> 일(day)수를 날짜에 더함 
-- 날짜 - 숫자 - 날짜 -> 날짜에서 일수를 뺌
-- 날짜 - 날짜 = 일수 -> 어떤 날짜에서 다른 날짜를 뺀 함수
-- 날짜 + 숫자/24 = 날짜 -> 날짜에 시간을 더함 

SELECT
    SYSDATE - 1 AS "SYSDATE - 1",
    (SYSDATE + 10) - SYSDATE AS "날짜 - 날짜",
    SYSTIMESTAMP - (1/24) AS "1시간차감",
    SYSTIMESTAMP - (100/24/60) AS "100분차감",
    SYSTIMESTAMP - (1/24/60/60) * 30 AS "30초차감"
FROM DUAL;

-- ## 변환 함수 
-- 날짜를 문자로 변환 (TO_CHAR함수)
-- 날짜의 문자포맷형식 : Y - 연도, MM - 두자리 월, D - 일수
-- 시간의 문자포맷형식 : HH12 - (1-12), HH24(0-24),MI - 분, SS - 초, AM PM - 오전 오후 
SELECT
    TO_CHAR(SYSDATE,'MM - DD') AS "날짜(월,일)",
    TO_CHAR(SYSDATE,'YYYY/MM/DD') AS "날짜(년,월,일)",
    TO_CHAR(SYSDATE,'YYYY"년" MM"월" DD"일"') AS "날짜-한글포함",
    TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS') AS "날짜와 시간",
    TO_CHAR(SYSDATE,'YYYY/MM/DD AM HH12:MI:SS') AS "날짜와 시간2"
FROM DUAL;

-- 숫자를 문자로 변환 
-- 숫자 포맷 형식 
-- $: 달러 기호, L: 지역화폐기호, .: 소수점 표시, ,: 콤마표시
SELECT
    TO_CHAR(9500,'$999,999') AS "달러",
    TO_CHAR(1350000,'999,999,999L') AS "원화"
FROM DUAL;

-- # 숫자 변환 함수 TO_NUMBER
SELECT
    TO_NUMBER('$5,500','$999,999')- 4000 AS "계산결과"
FROM DUAL;