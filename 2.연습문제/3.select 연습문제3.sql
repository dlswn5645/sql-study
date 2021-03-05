

-- 실습문제3
-- 1번
SELECT
   department_id AS "부서번호",
   ROUND(AVG(salary),2) AS "평균급여"
FROM employees
GROUP BY department_id;

-- 2번
SELECT
    department_id AS "부서번호",
    COUNT(*) AS "총사원수"
FROM employees
GROUP BY department_id;

-- 3번
SELECT
    department_id AS "부서번호",
    ROUND(AVG(salary),2) AS "급여평균"
FROM employees
GROUP BY department_id
HAVING ROUND(AVG(salary),2) > 8000;

-- 4번 
SELECT
    job_id AS "직무이름",
    ROUND(AVG(salary),2) AS "급여평균"
FROM employees
WHERE job_id NOT LIKE 'SA%'
GROUP BY job_id
HAVING ROUND(AVG(salary),2) > 8000
ORDER BY "급여평균" DESC;

-- 추가사항
-- COUNT(*) 은 NULL을 포함한 수를 셈 
-- 나머지 집계함수는 NULL을 빼고 계산
SELECT * FROM employees;
SELECT COUNT(*) FROM employees;
SELECT COUNT(commission_pct) AS "null제외" FROM employees;

-- 전체 사원의 보너스평균이 아니고 보너스를 받은 사람만 평균을 냄
SELECT
    ROUND(AVG(salary * commission_pct),2) AS avg_bonus
FROM employees;

-- null을 0으로 고친 다음 전체 사원의 보너스 평균을 구한다
SELECT
    ROUND(AVG(NVL(salary * commission_pct,0)),2) AS avg_bonus
FROM employees;

