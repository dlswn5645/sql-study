-- # 계층형 쿼리 추가 예제
SELECT
    employee_id,first_name,manager_id
FROM employees;

SELECT
    employee_id,
    LPAD(' ', 4*(LEVEL-1)) || first_name || ' ' || last_name AS "NAME",
    LEVEL
FROM employees
START WITH manager_id IS NULL
-- CONNECT BY PRIOR 자식 = 부모
    CONNECT BY PRIOR employee_id = manager_id
ORDER SIBLINGS BY first_name;

-- # 실습문제 
-- 1번
SELECT employee_id, first_name FROM employees WHERE hire_date LIKE '04%'
UNION
SELECT employee_id, first_name FROM employees WHERE department_id = 20;

SELECT employee_id, first_name FROM employees WHERE hire_date LIKE '04%'
UNION ALL
SELECT employee_id, first_name FROM employees WHERE department_id = 20;

-- 2번 
SELECT employee_id, first_name FROM employees WHERE hire_date LIKE '04%'
INTERSECT
SELECT employee_id, first_name FROM employees WHERE department_id = 20;

-- 3번
SELECT employee_id, first_name FROM employees WHERE hire_date LIKE '04%'
MINUS
SELECT employee_id, first_name FROM employees WHERE department_id = 20;

