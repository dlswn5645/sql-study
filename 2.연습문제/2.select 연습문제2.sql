

SELECT * 
FROM employees
WHERE LOWER(first_name) = 'david';

-- �ǽ�3 
-- 1��
SELECT
    first_name,
    LENGTH(first_name) AS LENGTH
FROM employees;

-- 2��
SELECT
    first_name,
    last_name,
    CONCAT(first_name,last_name) AS NAME
FROM employees;

-- 3��
SELECT
    RPAD(SUBSTR(first_name,1,3),LENGTH(first_name),'*') AS name,
    LPAD(salary,10,'*') AS salary
FROM employees
WHERE LOWER(job_id) = 'it_prog';