-- ORDER BY ����
SELECT 
    certi_cd, certi_nm, issue_insti_nm
FROM tb_certi
ORDER BY certi_nm DESC
;

SELECT 
    certi_cd, certi_nm, issue_insti_nm
FROM tb_certi
ORDER BY 2 DESC
;


SELECT
    emp_no, emp_nm, birth_de, addr, tel_no, 
    direct_manager_emp_no
FROM tb_emp
WHERE birth_de LIKE '196%'
ORDER BY direct_manager_emp_no DESC;


SELECT 
    certi_cd,
    issue_insti_nm
FROM tb_certi
ORDER BY certi_nm DESC;


SELECT * FROM tb_emp;
SELECT * FROM tb_dept;
SELECT * FROM tb_emp_certi;


-- ���� ����
SELECT 
    A.emp_no,
    A.emp_nm,
    A.dept_cd,
    B.dept_nm
FROM tb_emp A, tb_dept B
WHERE A.dept_cd = B.dept_cd
    AND B.dept_nm = '��ȹ��'
;


SELECT 
    A.emp_no,
    A.emp_nm,
    B.dept_nm,
    C.certi_cd
FROM 
    tb_emp A, 
    tb_dept B, 
    tb_emp_certi C
WHERE A.dept_cd = B.dept_cd
    AND A.emp_no = C.emp_no
    AND B.dept_nm = '��������';


SELECT 
    A.emp_no,
    A.emp_nm,
    B.dept_nm,
    C.certi_cd,
    D.certi_nm
FROM 
    tb_emp A, 
    tb_dept B, 
    tb_emp_certi C,
    tb_certi D
WHERE A.dept_cd = B.dept_cd
    AND A.emp_no = C.emp_no
    AND C.certi_cd = D.certi_cd
    AND B.dept_nm = '��������';

SELECT 
  A.emp_nm, A.emp_no, A.dept_cd, B.dept_nm
FROM tb_emp A, tb_dept B
WHERE A.dept_cd = B.dept_cd
ORDER BY birth_de;



-- # INNER JOIN = EQUI JOIN
-- 1. 2�� �̻��� ���̺��� ����Ǵ� �÷��� ���� �������� ���յǴ� ���α���Դϴ�.
-- 2. WHERE���� ���� �÷����� �������(=)�� ���� �񱳵˴ϴ�.

SELECT
    A.emp_no, A.emp_nm, A.addr,
    B.dept_cd, B.dept_nm
FROM tb_emp A, tb_dept B
WHERE A.dept_cd = B.dept_cd 
    AND A.addr LIKE '%�ϻ�%'
ORDER BY A.emp_no
;


-- # NATURAL JOIN
-- 1. NATURAL JOIN�� ������ �̸��� ���� �÷��鿡 ���� ������ �մϴ�.
-- 2. �� �ڵ����� �� ���̺��� ���� �̸��� ���� �÷��� ���� INNER������ �����մϴ�.
-- 3. �� �� ���� �÷��� ������ Ÿ���� ���ƾ� �ϸ�, ALIAS�̳� ���̺� ��� ���� ���λ縦 ���� �� �����ϴ�.
-- 4. SELECT * ������ ����ϸ�, ���� �÷���� �ڵ� �����ϸ�,
--    ���� �÷����� ��� ���տ��� �� ���� ǥ���˴ϴ�.

SELECT * FROM tb_emp;
SELECT * FROM tb_dept;

SELECT 
    *
FROM tb_emp A NATURAL JOIN tb_dept B
;

SELECT 
    A.emp_no, A.emp_nm, dept_cd, B.dept_nm
FROM tb_emp A NATURAL JOIN tb_dept B
;

SELECT 
    A.emp_no, A.emp_nm, B.dept_nm
FROM tb_emp A NATURAL JOIN tb_dept B
;


-- # USING �� ����
-- 1. Natural���ο����� �ڵ����� �̸��� ��ġ�ϴ� ��� �÷��鿡 ���� ������ �̷��������,
--    USING ���� ����ϸ� ���ϴ� �÷��� ���ؼ��� ���������� EQUI������ �����մϴ�.
-- 2. USING�������� ���� �÷��� ���ؼ� ALIAS�� ���̺� ��� ���� ���λ縦 ���� �� �����ϴ�.

SELECT 
    A.emp_no,
    A.emp_nm,
    A.addr,
    dept_cd,
    B.dept_nm
FROM tb_emp A 
JOIN tb_dept B USING (dept_cd);



-- # JOIN ON ��
-- 1. ���� ���� ������(ON��) �Ϲ� ���� ������(WHERE��)�� �и��ؼ� �ۼ��ϱ� ���� ����Դϴ�.
-- 2. ON���� ����ϸ� JOIN���Ŀ� �� �����̳� ���������� ���� �߰� ������ �� �� �ֽ��ϴ�.
SELECT
    A.emp_no, A.emp_nm, A.addr,
    B.dept_cd, B.dept_nm
FROM tb_emp A
JOIN tb_dept B 
ON A.dept_cd = B.dept_cd
WHERE A.addr LIKE '%�ϻ�%'
ORDER BY A.emp_no
;