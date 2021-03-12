
-- # 다중 행 서브쿼리 연산자 정리 
-- 1. IN: 목록의 어떤 값과 같은지 확인 
-- 2. ANY, SOME: 값을 서브쿼리에 의해 리턴된 값 목록과 비교하는데 하나라도 만족하면 됨 
-- 3. ALL: 값을 서브쿼리에 의해 리턴된 값 목록과 비교하는데 모든 값을 만족해야함 
-- 4. EXISTS: 결과를 만족하는 값이 존재하는지의 여부를 확인 

-- ## ALL과 ANY의 차이점 
-- * < ANY: 가장 큰 값보다 작으면 됨
-- * > ANY: 가장 작은 값보다 크면 됨
-- * < ALL: 가장 작은 값보다 작으면 됨
-- * > ALL: 가장 큰 값보다 크면 됨
-- * = ANY: IN과 같은 역할

-- 아무 David중에 4800(가장 작은 값)보다 큰 값은 보여줌
SELECT first_name, salary
FROM employees
WHERE salary > ANY (
                 SELECT salary
                 FROM employees
                 WHERE first_name = 'David'
                );
-- 아무 David중에 9500(가장 큰 값)보다 큰 값은 보여줌
SELECT first_name, salary
FROM employees
WHERE salary > ALL (
                 SELECT salary
                 FROM employees
                 WHERE first_name = 'David'
                );

-- 스칼라 서브쿼리 추가예제 
-- 모든 사원의 이름과 부서이름을 조회
SELECT E.first_name, D.department_name
FROM employees E
JOIN departments D
ON E.department_id = D.department_id;

SELECT 
    E.first_name, 
    (SELECT D.department_name FROM departments D WHERE E.department_id = D.department_id) AS dept_name
FROM employees E;

-- 실습 문제 
-- 1번
SELECT first_name, salary
FROM employees
WHERE salary > (
                 SELECT salary
                 FROM employees
                 WHERE first_name = 'Nancy'
                );
                
-- 2번 
SELECT first_name, job_id, department_id
FROM employees
WHERE department_id IN(
                        SELECT department_id
                        FROM employees
                        WHERE first_name = 'David'
                    );
