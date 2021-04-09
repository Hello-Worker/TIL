/* **************************************************************************  
��������(Sub Query)
- ����(insert, delete, update, select)�ȿ��� select ������ ����ϴ� ��.
- ���� ���� - ��������

���������� ���Ǵ� ��
 - select��, from��, where��, having��
 
���������� ����
- ��� ������ ���Ǿ������� ���� ����
    - ��Į�� �������� - select ���� ���. �ݵ�� �������� ����� 1�� 1��(�� �ϳ�-��Į��) 0���� ��ȸ�Ǹ� null�� ��ȯ
    - �ζ��� �� - from ���� ���Ǿ� ���̺��� ������ �Ѵ�.
�������� ��ȸ��� ����� ���� ����
    - ������ �������� - ���������� ��ȸ��� ���� ������ ��.
    - ������ �������� - ���������� ��ȸ��� ���� �������� ��.
���� ��Ŀ� ���� ����
    - ����(�񿬰�) �������� - ���������� ���������� �÷��� ������ �ʴ´�. ���������� ����� ���� ���������� �����ϴ� ������ �Ѵ�.
    - ���(����) �������� - ������������ ���������� �÷��� ����Ѵ�. 
                            ���������� ���� ����Ǿ� ������ �����͸� ������������ ������ �´��� Ȯ���ϰ��� �Ҷ� �ַ� ����Ѵ�.

- ���������� �ݵ�� ( ) �� ������� �Ѵ�.
************************************************************************** */
--������ ��������

-- ����_ID(emp.emp_id)�� 120���� ������ ���� ����(emp.job_id)���� 
-- ������ id(emp_id),�̸�(emp.emp_name), ����(emp.job_id), �޿�(emp.salary) ��ȸ
select  emp_id,
        emp_name,
        job_id,
        salary
from    emp
where   job_id = (select  job_id
                  from   emp
                  where   emp_id = 120);


-- ����_id(emp.emp_id)�� 115���� ������ ���� ����(emp.job_id)�� �ϰ� ���� �μ�(emp.dept_id)�� ���� �������� ��ȸ�Ͻÿ�.
select  job_id, dept_id
from    emp
where   emp_id = 115;

select * from emp
where  job_id = 'PU_MAN'
and    dept_id = 30;

--pair ��� ��������
select * from emp
where  (job_id, dept_id) = (select job_id, dept_id
                            from  emp 
                            where emp_id = 115);


-- ������ �� �޿�(emp.salary)�� ��ü ������ ��� �޿����� ���� 
-- �������� id(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary)�� ��ȸ. �޿�(emp.salary) �������� ����.

select avg(salary) from emp;

select  emp_id,
        emp_name,
        salary
from    emp
where   salary < (select avg(salary) from emp)
order by salary desc;

-- �μ���  �̸�(dept.dept_name), �Ҽ��������� ��� �޿�(emp.salary) ���. 
-- ��ձ޿��� �Ҽ��� 2�ڸ����� ������ ��ȭǥ��($)�� ���� ������ ���

select  d.dept_name,
        to_char(round(avg(e.salary), 2), '$99,999') "��ձ޿�"
from    emp e left join dept d on e.dept_id = d.dept_id
group by d.dept_name
having avg(salary) > (select avg(salary) from emp)
order by avg(salary);


-- TODO: ������ ID(emp.emp_id)�� 145�� �������� ���� ������ �޴� �������� �̸�(emp.emp_name)�� �޿�(emp.salary) ��ȸ.
-- �޿��� ū ������� ��ȸ
select  emp_name, salary
from    emp
where   salary > (select salary from emp where emp_id=145)
order by salary;


-- TODO: ������ ID(emp.emp_id)�� 150�� ������ ���� ����(emp.job_id)�� �ϰ� ���� ���(emp.mgr_id)�� ���� �������� 
-- id(emp.emp_id), �̸�(emp.emp_name), ����(emp.job_id), ���(emp.mgr_id) �� ��ȸ
select  emp_id,
        emp_name,
        job_id,
        mgr_id
from   emp
where  (job_id, mgr_id) = (select job_id, mgr_id from emp where emp_id = 150);



-- TODO : EMP ���̺��� ���� �̸���(emp.emp_name)��  'John'�� ������ �߿��� �޿�(emp.salary)�� ���� ���� ������ 
--       salary(emp.salary)���� ���� �޴� 
-- �������� id(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary)�� ���� ID(emp.emp_id) ������������ ��ȸ.
select  emp_id,
        emp_name,
        salary
from    emp
where   salary > (select max(salary)
                  from emp
                  where  emp_name = 'John')
order by salary;

select  emp_id,
        emp_name,
        salary
from    emp
where   salary > all(select salary
                  from emp
                  where  emp_name = 'John')
order by salary;
-- TODO: �޿�(emp.salary)�� ���� ���� ������ ���� �μ��� �̸�(dept.dept_name), ��ġ(dept.loc)�� ��ȸ.
select d.dept_id, d.dept_name, d.loc
from   emp e left join dept d on e.dept_id = d.dept_id
where  e.salary = (select max(salary) from emp);

select * from emp where salary = 24000;

-- TODO: �޿�(emp.salary)�� ���� ���� �޴� �������� �̸�(emp.emp_name), �μ���(dept.dept_name), �޿�(emp.salary) ��ȸ. 
--       �޿��� �տ� $�� ���̰� ���������� , �� ���
select  e.emp_name,
        d.dept_name,
        to_char(e.salary, 'fm$999,999') salary
from    emp e left join  dept d on e.dept_id = d.dept_id
where   salary = (select max(salary) from emp);


-- TODO: ��� ����ID(emp.job_id) �� 'ST_CLERK'�� �������� ��� �޿����� ���� �޿��� �޴� �������� ��� ������ ��ȸ. 
-- �� ���� ID�� 'ST_CLERK'�� �ƴ� �����鸸 ��ȸ. 
select  *
from   emp
where  salary < (select avg(salary) from emp where job_id='ST_CLERK')
and   (job_id <> 'ST_CLERK'
or    job_id is null);
--job_id�� null�̰ų� ST_CLERK�� �ƴ� �����߿��� salary�� ST_CLERK�� ��ձ޿����� ���� ����


select  *
from   emp
where  salary < (select avg(salary) from emp where job_id='ST_CLERK')
and   nvl(job_id, '�̹�ġ') <> 'ST_CLERK'
order by salary desc;


-- TODO: 30�� �μ�(emp.dept_id) �� ��� �޿�(emp.salary)���� �޿��� ���� �������� ��� ������ ��ȸ.
select *
from   emp
where  salary > (select avg(salary) from emp where dept_id=30)
order by salary;


-- TODO: EMP ���̺��� ����(emp.job_id)�� 'IT_PROG' �� �������� ��� �޿� �̻��� �޴� 
-- �������� id(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary)�� �޿� ������������ ��ȸ.
select  emp_id,
        emp_name,
        salary
from   emp
where   salary > (select avg(salary) from emp where job_id = 'IT_PROG')
order by salary desc;

-- TODO: 'IT' �μ�(dept.dept_name)�� �ִ� �޿����� ���� �޴� ������ ID(emp.emp_id), �̸�(emp.emp_name), �Ի���(emp.hire_date), �μ� ID(emp.dept_id), �޿�(emp.salary) ��ȸ
-- �Ի����� "yyyy�� mm�� dd��" �������� ���
-- �޿��� �տ� $�� ���̰� ���������� , �� ���
select  emp_id,
        emp_name,
        to_char(hire_date, 'yyyy"��" mm"��" dd"��"') hire_date,
        to_char(salary, 'fm$99,999') salary
from    emp
where   salary > (select max(e.salary) 
                  from emp e join dept d on e.dept_id = d.dept_id
                  where d.dept_name = 'IT')
order by salary                  ;

/* ----------------------------------------------
 ������ ��������
 - ���������� ��ȸ ����� �������� ���
 - where�� ������ ������
	- in 
	- �񱳿����� any : ��ȸ�� ���� �� �ϳ��� ���̸� �� (where �÷� > any(��������) )
	- �񱳿����� all : ��ȸ�� ���� ��ο� ���̸� �� (where �÷� > all(��������) )
------------------------------------------------*/



--'Alexander' �� �̸�(emp.emp_name)�� ���� ������(emp.mgr_id)�� 
-- ���� �������� ID(emp_id), �̸�(emp_name), ����(job_id), �Ի�⵵(hire_date-�⵵�����), �޿�(salary)�� ��ȸ
-- �޿��� �տ� $�� ���̰� ���������� , �� ���

select emp_id from emp
where  emp_name = 'Alexander';


select  emp_id,
        emp_name,
        job_id,
        to_char(hire_date, 'yyyy') hire_year,
        to_char(salary, '$99,999') salary
from    emp
where   mgr_id in (select emp_id from emp
                   where  emp_name = 'Alexander');



-- ���� ID(emp.emp_id)�� 101, 102, 103 �� ������ ���� �޿�(emp.salary)�� ���� �޴� ������ ��� ������ ��ȸ.
select salary 
from emp 
where emp_id in (101,102,103);

select  * from emp
where   salary >  all(select salary 
                    from emp 
                    where emp_id in (101,102,103));


select * from emp
where  salary > (select max(salary)
                 from emp
                 where emp_id in (101,102,103));


-- ���� ID(emp.emp_id)�� 101, 102, 103 �� ������ �� �޿��� ���� ���� �������� �޿��� ���� �޴� ������ ��� ������ ��ȸ.
select salary 
from emp 
where emp_id in (101,102,103);

select * from emp
where salary > any(select salary 
                    from emp 
                    where emp_id in (101,102,103))
order by salary ;

select * from emp
where salary > (select min(salary)
                from emp 
                where emp_id in (101,102,103))
order by salary ;

-- TODO : �μ� ��ġ(dept.loc) �� 'New York'�� �μ��� �Ҽӵ� ������ ID(emp.emp_id), �̸�(emp.emp_name), �μ�_id(emp.dept_id) �� sub query�� �̿��� ��ȸ.
select  emp_id,
        emp_name,
        dept_id
from    emp
where   dept_id in (select dept_id from dept where loc='New York');


-- TODO : �ִ� �޿�(job.max_salary)�� 6000������ ������ ����ϴ� ����(emp)�� ��� ������ sub query�� �̿��� ��ȸ.
select * from emp
where  job_id in (select job_id from job where max_salary <= 6000);

-- TODO: �μ�_ID(emp.dept_id)�� 20�� �μ��� ������ ���� �޿�(emp.salary)�� ���� �޴� �������� ������  sub query�� �̿��� ��ȸ.
select * from emp
--where  salary > all(select salary from emp where dept_id = 20);
where  salary > (select max(salary) from emp where dept_id = 20);


-- TODO: �μ��� �޿��� ����� ���� ���� �μ��� ��� �޿����� ���� ���� �޴� �������� �̸�, �޿�, ������ sub query�� �̿��� ��ȸ
select  emp_name,
        job_id,
        salary
from   emp
--where salary > (select min(avg(salary)) from emp group by dept_id);
where salary > any(select avg(salary) from emp group by dept_id);



-- TODO: ���� id(job_id)�� 'SA_REP' �� �������� ���� ���� �޿��� �޴� �������� ���� �޿��� �޴� 
-- �������� �̸�(emp_name), �޿�(salary), ����(job_id) �� sub query�� �̿��� ��ȸ.
select  emp_name,
        salary,
        job_id
from    emp        
where   salary > all(select salary from emp where job_id = 'SA_REP');


--�������� ���� ����: subquery ���� -> subquery�������� ������ main ������ ����.
/* ****************************************************************
���(����) ����
������������ ��ȸ���� ���������� ���ǿ��� ����ϴ� ����.
���������� �����ϰ� �� ����� �������� ���������� �������� ���Ѵ�.
* ****************************************************************/
-- �� �μ�����(DEPT) �޿�(emp.salary)�� ���� ���� �޴� �������� id(emp.emp_id), �̸�(emp.emp_name), ����(emp.salary), �ҼӺμ�ID(dept.dept_id) ��ȸ
select  e.emp_id,
        e.emp_name,
        e.salary,
        e.dept_id
from   emp e 
where  salary = "�ڱⰡ ���� �μ��� max salary"

select max(salary)
from   emp
where  dept_id = �ڱⰡ ���� �μ�ID;

select  main.emp_id,
        main.emp_name,
        main.salary,
        main.dept_id
from   emp  main
where  salary = (select max(salary)
                 from   emp
                 where  nvl(dept_id, 0) = nvl(main.dept_id, 0))
order by main.dept_id;

select distinct dept_id from emp order by 1;

/* ******************************************************************************************************************
EXISTS, NOT EXISTS ������ (���(����)������ ���� ���ȴ�)
-- ���������� ����� �����ϴ� ���� �����ϴ��� ���θ� Ȯ���ϴ� ����. ������ �����ϴ� ���� �������� ���ุ ������ ���̻� �˻����� �ʴ´�.

������ ���̺�(��, ���, ������ -�θ�) - Transaction(����) ���̺�(�ֹ�, �뿩, �뿩-�ڽ�)
-- �������̺��� ���������̺��� ���� �����ǰ� �ִ���(EXISTS) ������(NOT EXISTS)
-- ���߿� (�ѹ��̻�) �ֹ��� ��?
**********************************************************************************************************************/
-- ������ �Ѹ��̻� �ִ� �μ��� �μ�ID(dept.dept_id)�� �̸�(dept.dept_name), ��ġ(dept.loc)�� ��ȸ
select  d.dept_id,
        d.dept_name,
        d.loc
from    dept d        
where   exists (select salary from emp e where e.dept_id=d.dept_id)
order by 1;


select * from dept
where  dept_id in (select distinct dept_id from emp)
order by 1;


-- ������ �Ѹ� ���� �μ��� �μ�ID(dept.dept_id)�� �̸�(dept.dept_name), ��ġ(dept.loc)�� ��ȸ
select  d.dept_id,
        d.dept_name,
        d.loc
from    dept d        
where   not exists (select salary from emp e where e.dept_id=d.dept_id)
order by 1;

-- �μ�(dept)���� ����(emp.salary)�� 13000�̻��� �Ѹ��̶� �ִ� �μ��� �μ�ID(dept.dept_id)�� �̸�(dept.dept_name), ��ġ(dept.loc)�� ��ȸ
select * 
from   dept d
where  exists (select * from emp e where e.dept_id = d.dept_id and salary>=13000);


select * from emp
where 100 = emp_id;
emp_id =100

/* ******************************
�ֹ� ���� ���̺�� �̿�.
******************************* */
1. from 
2. where - �༱�� (������ �ະ�� üũ - True�� ���� ���)
--TODO: ��(customers) �� �ֹ�(orders)�� �ѹ� �̻� �� ������ ��ȸ.
select *
from   customers c
where  exists (select * from orders o where o.cust_id = c.cust_id);

--TODO: ��(customers) �� �ֹ�(orders)�� �ѹ��� ���� ���� ������ ��ȸ.
select *
from   customers c
where  not exists (select * from orders o where o.cust_id = c.cust_id);

--TODO: ��ǰ(products) �� �ѹ��̻� �ֹ��� ��ǰ ���� ��ȸ
select * 
from   products p
where  exists (select * from order_items oi where oi.product_id = p.product_id);

--TODO: ��ǰ(products)�� �ֹ��� �ѹ��� �ȵ� ��ǰ ���� ��ȸ
select * 
from   products p
where  not exists (select * from order_items oi where oi.product_id = p.product_id);

