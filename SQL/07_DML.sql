/* *********************************************************************
DML - ������(��)�� �ٷ�� SQL��
    - insert:���� (Create)
    - select:��ȸ (Read,Retrieve): DQL (Query)
    - update:���� (Update)
    - delete:���� (Delete)


INSERT �� - �� �߰�
����
 - �����߰� :
   - INSERT INTO ���̺�� (�÷� [, �÷�]) VALUES (�� [, ��[])
   - ��� �÷��� ���� ���� ��� �÷� ���������� ���� �� �� �ִ�.

 - ��ȸ����� INSERT �ϱ� (subquery �̿�)
   - INSERT INTO ���̺�� (�÷� [, �÷�])  SELECT ����
	- INSERT�� �÷��� ��ȸ��(subquery) �÷��� ������ Ÿ���� �¾ƾ� �Ѵ�.
	- ��� �÷��� �� ���� ��� �÷� ������ ������ �� �ִ�.
************************************************************************ */
desc dept;
insert into dept (dept_id, dept_name, loc) values (1000, '��ȹ��', '����');
insert into dept values (1100, '���ź�', '�λ�');
commit;

insert into dept values (1110, '���ź�', '�λ�');
insert into dept values (1200, '���ź�', '�λ�');
insert into dept values (1300, '���ź�', '�λ�');
commit;  -- commit�� �ϱ� �������� �ӽ÷� ó���� ����. commit ���� ó��.
rollback; --insert/update/delete�ϱ� �� ���·� ������.(������ commit ���·� �����ش�.)

desc emp;

insert into emp values(1000, 'ȫ�浿', 'FI_ACCOUNT', 100, '2017/10/20', 5000, 0.1, 20);
insert into emp (emp_id, emp_name, hire_date, salary) values(1100, '�̼���', '2000/01/05', 6000);
insert into emp values (1200, '�ڿ���', 'FI_ACCOUNT',null, '2020/01/02', 7000, null, 10);
insert into emp values (1300, '�ڿ���', 'FI_ACCOUNT',null, to_date('2020/01', 'yyyy/mm'), 7000, null, 10);

insert into emp values (1000, '�迵��', 'FI_ACCOUNT', 100, '2021/01/06', 1000, 0.1, 20);--�̹� �ִ� PK���� insert
insert into emp values (1500, null, 'FI_ACCOUNT', 100, '2021/01/06', 1000, 0.1, 20);--not null �÷��� null�� ���� ������.
insert into emp values (1000, '�迵��', 'ȸ��', 100, '2021/01/06', 1000, 0.1, 20); --emp�� job_id �� FK �÷� -> �θ����̺�(job)�� PK �÷�(job_id)�� �ִ� ���� ���� �� �ִ�.

-- �÷� ������ Ÿ���� ũ�⺸�� �� ū ���� �ִ� ��� ����.
insert into emp values (1000, '�迵���迵���迵��', 'FI_ACCOUNT', 100, '2021/01/06', 1000, 0.1, 20);
insert into emp values (1000000, '�迵��', 'FI_ACCOUNT', 100, '2021/01/06', 1000, 0.1, 20);

commit;
-999999 ~ 999999

select job_id from job;
desc emp;

SELECT * FROM emp ORDER BY emp_id DESC;

select * from dept order by dept_id desc;


create table emp_copy(
    emp_id number(6),
    emp_name varchar2(20),
    salary number(7,2)
);

insert into emp_copy (emp_id, emp_name, salary)
select  emp_id, 
        emp_name,
        salary
from   emp
where  dept_id = 10;

select * from emp_copy;

--TODO: �μ��� ������ �޿��� ���� ��� ���̺� ����. 
--      ��ȸ����� insert. ����: �հ�, ���, �ִ�, �ּ�, �л�, ǥ������
create table salary_stat(
    dept_id number(6),
    salary_sum number(15,2),
    salary_avg number(10, 2),
    salary_max number(7,2),
    salary_min number(7,2),
    salary_var number(20,2),
    salary_stddev number(7,2)
);

insert into salary_stat --(dept_id, salary_sum, ...)
select  dept_id,
        sum(salary),
        round(avg(salary),2),
        max(salary),
        min(salary),
        round(variance(salary),2),
        round(stddev(salary),2)
from   emp
group by dept_id
order by dept_id;

rollback;
select * from salary_stat;
/* *********************************************************************
UPDATE : ���̺��� �÷��� ���� ����

UPDATE ���̺��
SET    ������ �÷� = ������ ��  [, ������ �÷� = ������ ��]
[WHERE ��������]

 - UPDATE: ������ ���̺� ����
 - SET: ������ �÷��� ���� ����
 - WHERE: ������ ���� ����. 
************************************************************************ */


-- ���� ID�� 200�� ������ �޿��� 5000���� ���� (��: 4400)
select * from emp where emp_id=200;

update emp
set salary = 5000
where emp_id = 200;
commit;
rollback;
select * from emp;

-- ���� ID�� 200�� ������ �޿��� 10% �λ��� ������ ����. salary * 1.1
select * from emp where emp_id=200;

update emp
set   salary=salary*1.1
where  emp_id = 200;

-- �μ� ID�� 100�� ������ Ŀ�̼� ������ 0.2�� salary�� 3000�� ���� ������, ���_id�� 100 ����.
select * from emp where emp_id=100;
update emp
set    comm_pct = 0.2,
       salary = salary + 3000,
       mgr_id = 100
where  emp_id = 100;       
commit;

update emp, dept --�ѹ��� �����̺� ó��.
set    emp.salary = 2000,
       dept.dept_name = 'A';


-- TODO: �μ� ID�� 100�� �������� �޿��� 100% �λ�

select * from emp where dept_id = 100;

update emp
set    salary = salary * 2
where  dept_id = 100;

-- TODO: IT �μ��� �������� �޿��� 3�� �λ�
9000
6000
4800
4800
4200
select * from emp where dept_id =60;
select * from dept;

update  emp
set     salary = salary * 3
where   dept_id in (select dept_id from dept where dept_name = 'IT');
commit;
-- TODO: EMP ���̺��� ��� �����͸� MGR_ID�� NULL�� HIRE_DATE �� �����Ͻ÷� COMM_PCT�� 0.5�� ����.
update  emp
set    mgr_id = null,
       hire_date = sysdate,
       comm_pct = 0.5;

select * from emp;

-- TODO: COMM_PCT �� 0.3�̻��� �������� COMM_PCT�� NULL �� ����.
update emp
set    comm_pct = null
where  comm_pct >= 0.3;

-- TODO: ��ü ��ձ޿����� ���� �޴� �������� �޿��� 50% �λ�.

select * from emp
where salary < (select avg(salary) from emp);

update emp
set    salary = salary * 1.5
where  salary < (select avg(salary) from emp);

rollback;
/* *********************************************************************
DELETE : ���̺��� ���� ����
���� 
 - DELETE FROM ���̺�� [WHERE ��������]
   - WHERE: ������ ���� ����
************************************************************************ */
delete from emp;
select * from emp;
rollback;
-- �μ����̺��� �μ�_ID�� 200�� �μ� ����
select * from dept;
delete from dept where dept_id = 200;

-- �μ����̺��� �μ�_ID�� 10�� �μ� ����
-- 200,1200,1300
select * from emp where dept_id = 220;
select * from emp where emp_id in ( 200,1200,1300);
delete from dept where dept_id = 20;
delete from dept where dept_id = 220;
rollback;

delete from emp, dept;--�� ���̺� �����θ� ó��

--delete * from emp;


-- TODO: �μ� ID�� ���� �������� ����
select * from emp where dept_id is null;

delete from emp where dept_id is null;

-- TODO: ��� ����(emp.job_id)�� 'SA_MAN'�̰� �޿�(emp.salary) �� 12000 �̸��� �������� ����.
select * from emp where job_id = 'SA_MAN' and salary < 12000;

delete from emp where job_id = 'SA_MAN' and salary < 12000;

-- TODO: comm_pct �� null�̰� job_id �� IT_PROG�� �������� ����
select * from emp where comm_pct is null and job_id = 'IT_PROG';

delete from emp  where comm_pct is null and job_id = 'IT_PROG';


-- TODO: job_id�� CLERK�� �� ������ �ϴ� ������ ����
select * from emp where job_id like '%CLERK%';

delete from emp where job_id like '%CLERK%';

commit;
rollback;

select * from emp where emp_id = 100;
--job_id �� �����.=> update
update emp
set    job_id = null
where emp_id = 100;