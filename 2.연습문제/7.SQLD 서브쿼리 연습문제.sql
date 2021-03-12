
-- # ���� �� �������� ������ ���� 
-- 1. IN: ����� � ���� ������ Ȯ�� 
-- 2. ANY, SOME: ���� ���������� ���� ���ϵ� �� ��ϰ� ���ϴµ� �ϳ��� �����ϸ� �� 
-- 3. ALL: ���� ���������� ���� ���ϵ� �� ��ϰ� ���ϴµ� ��� ���� �����ؾ��� 
-- 4. EXISTS: ����� �����ϴ� ���� �����ϴ����� ���θ� Ȯ�� 

-- ## ALL�� ANY�� ������ 
-- * < ANY: ���� ū ������ ������ ��
-- * > ANY: ���� ���� ������ ũ�� ��
-- * < ALL: ���� ���� ������ ������ ��
-- * > ALL: ���� ū ������ ũ�� ��
-- * = ANY: IN�� ���� ����

-- �ƹ� David�߿� 4800(���� ���� ��)���� ū ���� ������
SELECT first_name, salary
FROM employees
WHERE salary > ANY (
                 SELECT salary
                 FROM employees
                 WHERE first_name = 'David'
                );
-- �ƹ� David�߿� 9500(���� ū ��)���� ū ���� ������
SELECT first_name, salary
FROM employees
WHERE salary > ALL (
                 SELECT salary
                 FROM employees
                 WHERE first_name = 'David'
                );

-- ��Į�� �������� �߰����� 
-- ��� ����� �̸��� �μ��̸��� ��ȸ
SELECT E.first_name, D.department_name
FROM employees E
JOIN departments D
ON E.department_id = D.department_id;

SELECT 
    E.first_name, 
    (SELECT D.department_name FROM departments D WHERE E.department_id = D.department_id) AS dept_name
FROM employees E;

-- �ǽ� ���� 
-- 1��
SELECT first_name, salary
FROM employees
WHERE salary > (
                 SELECT salary
                 FROM employees
                 WHERE first_name = 'Nancy'
                );
                
-- 2�� 
SELECT first_name, job_id, department_id
FROM employees
WHERE department_id IN(
                        SELECT department_id
                        FROM employees
                        WHERE first_name = 'David'
                    );
