

-- CASE ǥ���� DECODE�Լ�
SELECT
    CASE WHEN sal_cd = '100001' THEN '�⺻��'
         WHEN sal_cd = '100002' THEN '�󿩱�'
         WHEN sal_cd = '100003' THEN 'Ư���󿩱�'
         WHEN sal_cd = '100004' THEN '�߱ټ���'
         WHEN sal_cd = '100005' THEN '�ָ�����'
         WHEN sal_cd = '100006' THEN '���ɽĴ�'
         WHEN sal_cd = '100007' THEN '��������Ʈ'
         ELSE '��ȿ���� ����'
         END SAL_NAME
FROM tb_sal;

SELECT
    DECODE(sal_cd,'100001','�⺻��','100002','�󿩱�','��Ÿ')
FROM tb_sal;

-- # �� �����Լ�
-- NVL(expr1,expr2)
-- expr1: Null�� ������ �� �ִ� ���̳� ǥ���� 
-- expr2: expr1�� Null�� ��� ����� ��
SELECT
    NVL(direct_manager_emp_no,'�ֻ�����') AS ������
FROM tb_emp
WHERE direct_manager_emp_no IS NULL;

SELECT
    NVL(upper_dept_cd,'�ֻ����ںμ�') AS �����μ�
FROM tb_dept
WHERE upper_dept_cd IS NULL;

-- �����մ�� NULL�� ������ �ϱ����� MAX��� �׷��� �����ϴ� ������ ��
SELECT
   NVL(MAX(emp_nm),'�������� ����') AS EMP_NM
FROM tb_emp
WHERE emp_nm = '����ȣ';

-- NVL2(expr1,expr2,expr3)
-- expr1�� ���� null�ƴϸ� expr2�� ��ȯ, null�� �̸� expr3�� ��ȯ 
SELECT
    emp_nm,
    NVL2(direct_manager_emp_no,'�Ϲݻ��','ȸ���') AS ����
FROM tb_emp;

-- COALESCE(expr1,...)
-- ���� ǥ���� �� NULL�� �ƴ� ���� ���ʷ� �߰ߵǸ� �ش� ���� ���� 
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
-- �� ���� ������ NULL����, �ٸ��� expr1 ����
SELECT
    NULLIF('����ȣ','������') AS "�ٸ�"
FROM DUAL;

SELECT
    NULLIF('����ȣ','����ȣ') AS "����"
FROM DUAL;


-- GROUP BY, HAVING�� 
-- 1. �����Լ�
SELECT
    MAX(birth_de) AS "���� � ���",
    MIN(birth_de) AS "���� ���� ���� ���",
    COUNT(*) AS "�� ��� ��"
FROM tb_emp;

-- 2. GORUP BY��
-- ��Ī ��� �Ұ�
SELECT
    A.dept_cd,
    (SELECT L.dept_nm FROM tb_dept L WHERE L.dept_cd = A.dept_cd) AS dept_nm,
    MAX(birth_de) AS "���� � ���",
    MIN(birth_de) AS "���� ���� ���� ���",
    COUNT(*) AS "�� ��� ��"
FROM tb_emp A
GROUP BY A.dept_cd
ORDER BY A.dept_cd ASC;

-- 3. HAVING��
SELECT
    A.dept_cd,
    (SELECT L.dept_nm FROM tb_dept L WHERE L.dept_cd = A.dept_cd) AS dept_nm,
    MAX(birth_de) AS "���� � ���",
    MIN(birth_de) AS "���� ���� ���� ���",
    COUNT(*) AS "�� ��� ��"
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