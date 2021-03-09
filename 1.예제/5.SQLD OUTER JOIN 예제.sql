
-- 3���� ���̺� ���� 
SELECT
    A.emp_no, A.emp_nm, A.addr,
    B.dept_cd, B.dept_nm, C.certi_cd
FROM tb_emp A, tb_dept B, tb_emp_certi C
WHERE A.dept_cd = B.dept_cd 
    AND A.emp_no = C.emp_no
    AND A.addr LIKE '%����%'; 
    
SELECT
    A.emp_no, A.emp_nm, A.addr, B.dept_nm,
    B.dept_cd, B.dept_nm, C.certi_cd
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd 
JOIN tb_emp_certi C
ON A.emp_no = C.emp_no
WHERE A.addr LIKE '%����%'; 


-- 4���� ���̺� ���� 
SELECT
    A.emp_no, A.emp_nm, A.addr,
    B.dept_cd, B.dept_nm, C.certi_cd, D.certi_nm
FROM tb_emp A, tb_dept B, tb_emp_certi C, tb_certi D
WHERE A.dept_cd = B.dept_cd 
    AND A.emp_no = C.emp_no
    AND C.certi_cd = D.certi_cd
    AND A.addr LIKE '%����%'; 

SELECT
    A.emp_no, A.emp_nm, A.addr, B.dept_nm,
    B.dept_cd, B.dept_nm, C.certi_cd, D.certi_nm
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd 
JOIN tb_emp_certi C
ON A.emp_no = C.emp_no
JOIN tb_certi D
ON C.certi_cd = D.certi_cd
WHERE A.addr LIKE '%����%';

-- #SELF JOIN
-- 1. SELF JOIN�� �ڱ� �ڽ��� ���̺��� �����ϴ� ����
-- 2. �ڱ� ���̺��� �÷����� ��Ī�Ͽ� ��ȸ�ϴ� ���
SELECT
    A.emp_no, A.emp_nm, A.direct_manager_emp_no,
    B.emp_nm AS "����̸�"
FROM tb_emp A, tb_emp B
WHERE A.direct_manager_emp_no = B.emp_no
--    AND A.emp_nm = '�質��'
ORDER BY emp_no;

-- OUTER JOIN �ǽ�ȯ�� ����
INSERT INTO TB_DEPT VALUES('100014','4�����������','999999');
INSERT INTO TB_DEPT VALUES('100015','����Ʈ�ڷγ���','999999');
COMMIT;

SELECT
    *
FROM TB_DEPT;

ALTER TABLE TB_EMP DROP CONSTRAINT FK_TB_EMP01;


INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000041', '�̼���', '19811201', '1', '��⵵ ���ν� ������ ����1�� 435', '010-5656-7878',
        NULL, '006', '003', '114-554-223433', '000000', 'N');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000042', '�����', '19820402', '1', '��⵵ ���� ���籸 ȭ���� 231', '010-4054-6547',
        NULL, '004', '001', '110-223-553453', '000000', 'Y');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000043', '������', '19850611', '1', '��⵵ ������ �ȴޱ� ��ź�� 553', '010-1254-1116',
        NULL, '004', '001', '100-233-664234', '000000', 'N');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000044', '�庸��', '19870102', '1', '��⵵ ������ �д籸 ���ڵ� 776', '010-1215-8784',
        NULL, '004', '002', '180-345-556634', '000000', 'Y');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000045', '������', '19880824', '1', '��⵵ ���� �ϻ꼭�� �鼮�� 474', '010-3687-1245',
        NULL, '004', '002', '325-344-45345', '000000', 'Y');
        
COMMIT;

SELECT * FROM tb_emp ORDER BY emp_no DESC;

SELECT * FROM tb_dept;

-- #OUTER JOIN
-- 1. ���� ������ �������� �ʴ� ��鵵 ��ȸ�ϱ� ���� ��� 
-- 2. OUTER JOIN �����ڴ� ���ϱ� ��ȣ (+)�Դϴ�.
-- 3. EQUI JOIN�� ���� ������ �������� ������ �ش� ���� ������� �ʴ´�
--      �׷��� OUTER ������ ���� (LEFT, RIGHT)�� �°� ���ǿ� ��Ī���� ���� ��鵵 ��� NULL���� �����ؼ� ����մϴ�.


-- #LEFT OUTER JOIN 
-- ���� ���̺� ������ ��� ��ȸ�ϰ� ������ ���̺��� �������ǿ� ��Ī�� �͸� ��ȸ
SELECT
    A.emp_no, A.emp_nm, B.dept_cd, B.dept_nm
FROM tb_emp A
LEFT OUTER JOIN tb_dept B
ON A.dept_cd = B.dept_cd
WHERE A.dept_cd IN('000000','100003');

-- #RIGHT OUTER JOIN 
-- ������ ���̺� ������ ��� ��ȸ�ϰ� ���� ���̺��� �������ǿ� ��Ī�� �͸� ��ȸ
SELECT * FROM tb_dept;

-- ��� �μ��� ��ȸ�ϰ� ������ Ȥ�� �ش� �μ��� ��������� ������ �� �������� ����ʹ�.
SELECT
    A.emp_no, A.emp_nm,
    B.dept_cd, B.dept_nm
FROM tb_emp A 
RIGHT OUTER JOIN tb_dept B 
ON A.dept_cd = B.dept_cd;

-- FULL OUTER JOIN 
SELECT
    A.emp_no, A.emp_nm,
    B.dept_cd, B.dept_nm
FROM tb_emp A 
FULL OUTER JOIN tb_dept B
ON A.dept_cd = B.dept_cd
ORDER BY B.dept_cd DESC, A.emp_no DESC;

-- �ǽ� ���� �� ó��
DELETE FROM TB_DEPT WHERE DEPT_CD IN('100014','100015');

DELETE FROM TB_EMP WHERE EMP_NO IN('1000000041','1000000042','1000000043','1000000044','1000000045');

COMMIT;

ALTER TABLE TB_EMP
ADD CONSTRAINT FK_TB_EMP01
FOREIGN KEY (DEPT_CD)
REFERENCES TB_DEPT(DEPT_CD);
