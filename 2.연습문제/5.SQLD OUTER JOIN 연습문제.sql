
-- OUTER JOIN �߰� ���� 
SELECT * FROM job_history; -- ���� ���� �̷�
SELECT * FROM employees;

-- ��� ����� ������ ��ȸ�Ұǵ� Ȥ�� ���� �����̷��� �ִٸ� �ش� ������ ���� ��ȸ�ϰ� �ʹ�.
-- ���� ���� �̷��� �ִ� ����� ��ȸ�ϰԵ�
SELECT
    E.employee_id, E.first_name, E.hire_date, E.job_id AS "cur_job_id",
    J.start_date,J.end_date, J.job_id, J.department_id
FROM employees E, job_history J
WHERE E.employee_id = J.employee_id
ORDER BY J.employee_id;

-- ���� OUTER JOIN 
SELECT
    E.employee_id, E.first_name, E.hire_date, E.job_id AS "cur_job_id",
    J.start_date,J.end_date, J.job_id, J.department_id
FROM employees E, job_history J
WHERE E.employee_id = J.employee_id(+)
ORDER BY J.employee_id;

SELECT
    E.employee_id, E.first_name, E.hire_date, E.job_id AS "cur_job_id",
    J.start_date,J.end_date, J.job_id, J.department_id
FROM employees E 
LEFT OUTER JOIN job_history J
ON E.employee_id = J.employee_id
ORDER BY J.employee_id;

-- �ǽ����� 
-- 1��
SELECT
    e.first_name AS employee_name, 
    m.first_name AS manager_name
FROM employees e , employees m
WHERE e.manager_id = m.employee_id
    AND e.employee_id = 103;
    
-- 2��
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;

SELECT
    E.first_name,
    D.department_name,
    L.street_address || ',' || L.city || ',' || L.state_province AS "address" 
FROM employees E
JOIN departments D
ON E.department_id = D.department_id
JOIN locations L
ON D.location_id = L.location_id;

SELECT
    E.first_name,
    D.department_name,
    L.street_address || ',' || L.city || ',' || L.state_province AS "address" 
FROM employees E
JOIN departments D
ON E.department_id = D.department_id
JOIN locations L
ON D.location_id = L.location_id
WHERE E.employee_id = 103;

SELECT
    E.first_name,
    D.department_name,
    L.street_address || ',' || L.city || ',' || L.state_province AS "address" 
FROM employees E
JOIN departments D
ON E.department_id = D.department_id
JOIN locations L
ON D.location_id = L.location_id
WHERE D.department_name LIKE 'IT%';

