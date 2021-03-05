

-- CASE 표현과 DECODE함수
SELECT
    CASE WHEN sal_cd = '100001' THEN '기본급'
         WHEN sal_cd = '100002' THEN '상여급'
         WHEN sal_cd = '100003' THEN '특별상여급'
         WHEN sal_cd = '100004' THEN '야근수당'
         WHEN sal_cd = '100005' THEN '주말수당'
         WHEN sal_cd = '100006' THEN '점심식대'
         WHEN sal_cd = '100007' THEN '복지포인트'
         ELSE '유효하지 않음'
         END SAL_NAME
FROM tb_sal;

SELECT
    DECODE(sal_cd,'100001','기본급','100002','상여급','기타')
FROM tb_sal;

-- # 널 관련함수
-- NVL(expr1,expr2)
-- expr1: Null을 포함할 수 있는 값이나 표현식 
-- expr2: expr1이 Null일 경우 사용할 값
SELECT
    NVL(direct_manager_emp_no,'최상위자') AS 관리자
FROM tb_emp
WHERE direct_manager_emp_no IS NULL;

SELECT
    NVL(upper_dept_cd,'최상위자부서') AS 상위부서
FROM tb_dept
WHERE upper_dept_cd IS NULL;

-- 공집합대신 NULL이 나오게 하기위해 MAX사용 그래야 존재하는 유무를 앎
SELECT
   NVL(MAX(emp_nm),'존재하지 않음') AS EMP_NM
FROM tb_emp
WHERE emp_nm = '박찬호';

-- NVL2(expr1,expr2,expr3)
-- expr1의 값이 null아니면 expr2를 반환, null이 이면 expr3를 반환 
SELECT
    emp_nm,
    NVL2(direct_manager_emp_no,'일반사원','회장님') AS 직위
FROM tb_emp;

-- COALESCE(expr1,...)
-- 많은 표현식 중 NULL이 아닌 값이 최초로 발견되면 해당 값을 리턴 
SELECT
    COALESCE(NULL,NULL,0) AS SAL
FROM DUAL;

SELECT
    COALESCE(5000,NULL,0) AS SAL
FROM DUAL;

SELECT
    COALESCE(NULL,6000,0) AS SAL
FROM DUAL;

-- NULLIF(expr1,expr2)
-- 두 값이 같으면 NULL리턴, 다르면 expr1 리턴
SELECT
    NULLIF('박찬호','박지성') AS "다름"
FROM DUAL;

SELECT
    NULLIF('박찬호','박찬호') AS "같음"
FROM DUAL;


-- GROUP BY, HAVING절 
-- 1. 집계함수
SELECT
    MAX(birth_de) AS "가장 어린 사람",
    MIN(birth_de) AS "가장 나이 많은 사람",
    COUNT(*) AS "총 사원 수"
FROM tb_emp;

-- 2. GORUP BY절
-- 별칭 사용 불가
SELECT
    A.dept_cd,
    (SELECT L.dept_nm FROM tb_dept L WHERE L.dept_cd = A.dept_cd) AS dept_nm,
    MAX(birth_de) AS "가장 어린 사람",
    MIN(birth_de) AS "가장 나이 많은 사람",
    COUNT(*) AS "총 사원 수"
FROM tb_emp A
GROUP BY A.dept_cd
ORDER BY A.dept_cd ASC;

-- 3. HAVING절
SELECT
    A.dept_cd,
    (SELECT L.dept_nm FROM tb_dept L WHERE L.dept_cd = A.dept_cd) AS dept_nm,
    MAX(birth_de) AS "가장 어린 사람",
    MIN(birth_de) AS "가장 나이 많은 사람",
    COUNT(*) AS "총 사원 수"
FROM tb_emp A
GROUP BY A.dept_cd
HAVING COUNT(*) >= 2
ORDER BY A.dept_cd ASC;

SELECT
    A.emp_no,
    (SELECT L.emp_nm FROM tb_emp L WHERE L.emp_no = A.emp_no) AS emp_nm,
    MAX(A.pay_amt) AS MAX_PAY_AMT,
    MIN(A.pay_amt) AS MIN_PAY_AMT,
    ROUND(AVG(A.pay_amt),2) AS AVG_PAY_AMT
FROM tb_sal_his A 
WHERE a.pay_de BETWEEN '20190101' AND '20191231'
GROUP BY A.emp_no
HAVING ROUND(AVG(A.pay_amt),2) >= 4700000
ORDER BY A.emp_no;

SELECT * FROM tb_sal_his ORDER BY emp_no;

SELECT 1,2 FROM DUAL WHERE 1=2;
SELECT NVL(1,0) FROM DUAL WHERE 1=2;
SELECT NVL(MAX(1),1) FROM DUAL WHERE 1=2;
SELECT MAX(NVL(1,1)) FROM DUAL WHERE 1=2;