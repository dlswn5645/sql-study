

-- �ǽ�����3
-- 1��
SELECT
   department_id AS "�μ���ȣ",
   ROUND(AVG(salary),2) AS "��ձ޿�"
FROM employees
GROUP BY department_id;

-- 2��
SELECT
    department_id AS "�μ���ȣ",
    COUNT(*) AS "�ѻ����"
FROM employees
GROUP BY department_id;

-- 3��
SELECT
    department_id AS "�μ���ȣ",
    ROUND(AVG(salary),2) AS "�޿����"
FROM employees
GROUP BY department_id
HAVING ROUND(AVG(salary),2) > 8000;

-- 4�� 
SELECT
    job_id AS "�����̸�",
    ROUND(AVG(salary),2) AS "�޿����"
FROM employees
WHERE job_id NOT LIKE 'SA%'
GROUP BY job_id
HAVING ROUND(AVG(salary),2) > 8000
ORDER BY "�޿����" DESC;

-- �߰�����
-- COUNT(*) �� NULL�� ������ ���� �� 
-- ������ �����Լ��� NULL�� ���� ���
SELECT * FROM employees;
SELECT COUNT(*) FROM employees;
SELECT COUNT(commission_pct) AS "null����" FROM employees;

-- ��ü ����� ���ʽ������ �ƴϰ� ���ʽ��� ���� ����� ����� ��
SELECT
    ROUND(AVG(salary * commission_pct),2) AS avg_bonus
FROM employees;

-- null�� 0���� ��ģ ���� ��ü ����� ���ʽ� ����� ���Ѵ�
SELECT
    ROUND(AVG(NVL(salary * commission_pct,0)),2) AS avg_bonus
FROM employees;

