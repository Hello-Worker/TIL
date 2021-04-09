/* **************************************************************************
����(Aggregation) �Լ��� GROUP BY, HAVING
************************************************************************** */

/* ************************************************************
�����Լ�, �׷��Լ�, ������ �Լ�
- �μ�(argument)�� �÷�.
  - sum(): ��ü�հ�
  - avg(): ���
  - min(): �ּҰ�
  - max(): �ִ밪
  - stddev(): ǥ������
  - variance(): �л�
  - count(): ����
        - �μ�: 
            - �÷���: null�� ������ ����
            -  *: �� ���(null�� ����)

- count(*) �� �����ϰ� ��� �����Լ��� null�� ���� ����Ѵ�.
- sum, avg, stddev, variance: number Ÿ�Կ��� ��밡��.
- min, max, count :  ��� Ÿ�Կ� �� ��밡��.
************************************************************* */

-- EMP ���̺��� �޿�(salary)�� ���հ�, ���, �ּҰ�, �ִ밪, ǥ������, �л�, ���������� ��ȸ 
select  sum(salary) "���հ�",
        round(avg(salary), 2) "���", 
        min(salary) "�ּҰ�",
        max(salary) "�ִ밪",
        round(stddev(salary),2) "ǥ������",
        round(variance(salary),2) "�л�",
        count(*) "�����"
from    emp;


-- EMP ���̺��� ���� �ֱ� �Ի���(hire_date)�� ���� ������ �Ի����� ��ȸ
select  max(hire_date),
        min(hire_date)
from    emp;        


-- EMP ���̺��� �μ�(dept_name) �� ������ ��ȸ
select count(dept_name)
from   emp;


-- emp ���̺��� job ������ ���� ��ȸ
select count(distinct job)
from emp;

select  count(distinct nvl(dept_name, '�̹�ġ'))
from emp;

--TODO:  Ŀ�̼� ����(comm_pct)�� �ִ� ������ ���� ��ȸ


--TODO: Ŀ�̼� ����(comm_pct)�� ���� ������ ���� ��ȸ


--TODO: ���� ū Ŀ�̼Ǻ���(comm_pct)�� �� ���� ���� Ŀ�̼Ǻ����� ��ȸ



--TODO:  Ŀ�̼� ����(comm_pct)�� ����� ��ȸ. 
--�Ҽ��� ���� 2�ڸ����� ���



--TODO: ���� �̸�(emp_name) �� ���������� �����Ҷ� ���� ���߿� ��ġ�� �̸��� ��ȸ.



--TODO: �޿�(salary)���� �ְ� �޿��װ� ���� �޿����� ������ ���



--TODO: ���� �� �̸�(emp_name)�� ����� ���� ��ȸ.




--TODO: EMP ���̺��� �μ�(dept_name)�� �������� �ִ��� ��ȸ. 
-- ���������� ����




/* *****************************************************
group by ��
- Ư�� �÷�(��)�� ������ ���� ������ �� ������ �����÷��� �����ϴ� ����.
	- ��) ������ �޿����. �μ�-������ �޿� �հ�. ���� �������
- ����: group by �÷��� [, �÷���]
	- �÷�: �з���(������, �����) - �μ��� �޿� ���, ���� �޿� �հ�
	- select�� where �� ������ ����Ѵ�.
	- select ������ group by ���� ������ �÷��鸸 �����Լ��� ���� �� �� �ִ�
*******************************************************/

-- ����(job)�� �޿��� ���հ�, ���, �ּҰ�, �ִ밪, ǥ������, �л�, �������� ��ȸ
select  job,
        sum(salary) "SUM",
        round(avg(salary), 2) "AVG",
        min(salary) "MIN",
        max(salary) "MAX",
        round(stddev(salary), 2) "STDDEV",
        round(variance(salary), 2) "VAR",
        count(*) "COUNT"
from    emp
group by job;

select distinct job from emp;


-- �Ի翬�� �� �������� �޿� ���.
select  extract(year from hire_date) year,
        round(avg(salary), 2) sal_avg
from    emp
group by extract(year from hire_date)
order by 1;



-- �μ���(dept_name) �� 'Sales'�̰ų� 'Purchasing' �� �������� ������ (job) �������� ��ȸ
select  dept_name,
        job, 
        count(*) as "������"
from    emp
where   dept_name in ('Sales', 'Purchasing')
group by dept_name, job
order by 1 desc;


-- �μ�(dept_name), ����(job) �� �ִ� ��ձ޿�(salary)�� ��ȸ.
select  dept_name,
        job,
        max(salary) "�ִ�޿�"
from    emp
group by dept_name, job
order by dept_name;


-- �޿�(salary) ������ �������� ���. �޿� ������ 10000 �̸�,  10000�̻� �� ����.

select  case when salary >= 10000 then '10000�̻�' else '10000�̸�' end "�޿����",
        count(*)
from    emp
group by case when salary >= 10000 then '10000�̻�' else '10000�̸�' end;


select salary, case when salary >= 10000 then '10000�̻�' else '10000�̸�' end
from emp;


--TODO: �μ���(dept_name) �������� ��ȸ



--TODO: ������(job) �������� ��ȸ. �������� ���� �ͺ��� ����.



--TODO: �μ���(dept_name), ����(job)�� ������, �ְ�޿�(salary)�� ��ȸ. �μ��̸����� �������� ����.



--TODO: EMP ���̺��� �Ի翬����(hire_date) �� �޿�(salary)�� �հ��� ��ȸ. 
--(�޿� �հ�� �ڸ������� , �� �����ÿ�. ex: 2,000,000)



--TODO: ����(job)�� �Ի�⵵(hire_date)�� ��� �޿�(salary)�� ��ȸ



--TODO: �μ���(dept_name) ������ ��ȸ�ϴµ� �μ���(dept_name)�� null�� ���� �����ϰ� ��ȸ.



--TODO �޿� ������ �������� ���. �޿� ������ 5000 �̸�, 5000�̻� 10000 �̸�, 10000�̻� 20000�̸�, 20000�̻�. 


/* **************************************************************
having ��
- �������� ���� �� ���� ����
- group by ���� order by ���� �´�.
- ����
    having ��������  --�����ڴ� where���� �����ڸ� ����Ѵ�. �ǿ����ڴ� �����Լ�(�� ���)
************************************************************** */


-- �������� 10 �̻��� �μ��� �μ���(dept_name)�� �������� ��ȸ
select dept_name,
        count(*) "������"
from    emp
group by dept_name
having count(*) >= 10
order by 2 desc;


-- �������� 10�� �̻��� �μ��� �μ��� �޿��� �հ�
select  dept_name,
        to_char(sum(salary), '$999,999') "�޿��հ�"
from    emp
group by dept_name
having count(*) >= 10
order by 2 desc;

--TODO: 15�� �̻��� �Ի��� �⵵�� (�� �ؿ�) �Ի��� �������� ��ȸ.




--TODO: �� ����(job)�� ����ϴ� ������ ���� 10�� �̻��� ����(job)��� ��� �������� ��ȸ




--TODO: ��� �޿���(salary) $5000�̻��� �μ��� �̸�(dept_name)�� ��� �޿�(salary), �������� ��ȸ




--TODO: ��ձ޿��� $5,000 �̻��̰� �ѱ޿��� $50,000 �̻��� �μ��� �μ���(dept_name), ��ձ޿��� �ѱ޿��� ��ȸ




--TODO ������ 2�� �̻��� �μ����� �̸��� �޿��� ǥ�������� ��ȸ




/* **************************************************************
- rollup : group by�� Ȯ��.
  - �ΰ� �̻��� �÷��� group by�� ���� ��� ��������(�߰����質 ������)�� �κ� ���迡 �߰��ؼ� ��ȸ�Ѵ�.
  - ���� : group by rollup(�÷��� [,�÷���,..])



- grouping(), grouping_id()
  - rollup �̿��� ����� �÷��� �� ���� ���迡 �����ߴ��� ���θ� ��ȯ�ϴ� �Լ�.
  - case/decode�� �̿��� ���̺��� �ٿ� �������� ���� �� �ִ�.
  - ��ȯ��
	- 0 : ������ ���
	- 1 : ���� ���� ���.
 

- grouping() �Լ� 
 - ����: grouping(groupby�÷�)
 - select ���� ���Ǹ� rollup�̳� cube�� �Բ� ����ؾ� �Ѵ�.
 - group by�� �÷��� �����Լ��� ���迡 �����ߴ��� ���θ� ��ȯ
	- ��ȯ�� 0 : ������(�κ������Լ� ���), ��ȯ�� 1: ���� ����(���������� ���)
 - ���� �������� �κ������� ��������� �˷��ִ� �� �� �ִ�. 



- grouping_id()
  - ����: grouping_id(groupby �÷�, ..)
  - ������ �÷��� ���迡 ���Ǿ����� ���� 2����(0: ���� ����, 1: ������)�� ��ȯ �ѵ� 10������ ��ȯ�ؼ� ��ȯ�Ѵ�.
 
************************************************************** */

-- EMP ���̺��� ����(job) �� �޿�(salary)�� ��հ� ����� �Ѱ赵 ���̳������� ��ȸ.
select  job,
        count(*) "�������հ�",
        round(avg(salary), 2) "���������"
from    emp
group by rollup(job);



-- EMP ���̺��� ����(JOB) �� �޿�(salary)�� ��հ� ����� �Ѱ赵 ���̳������� ��ȸ.
-- ���� �÷���  �Ұ質 �Ѱ��̸� '�����'��  �Ϲ� �����̸� ����(job)�� ���
select  decode(grouping(job),0,job,
                             1,'�����') job,
        count(*) "�������հ�",
        round(avg(salary), 2) "���������"
from    emp
group by rollup(job);

select  decode(grouping_id(job),0,job,
                             1,'�����') job,
        count(*) "�������հ�",
        round(avg(salary), 2) "���������"
from    emp
group by rollup(job);



  

-- EMP ���̺��� �μ�(dept_name), ����(job) �� salary�� �հ�� �������� �Ұ�� �Ѱ谡 �������� ��ȸ
select  decode(grouping_id(dept_name, job), 0, nvl(dept_name,'�̹�ġ')||'-'||job,
                                            1, nvl(dept_name,'�̹�ġ')||' �Ұ�',
                                            3, '�Ѱ�') "Label",
        grouping_id(dept_name, job),
        count(*) "�������հ�",
        round(avg(salary), 2) "���������"
from    emp
group by rollup(dept_name, job);




--# �Ѱ�/�Ұ� ���� ��� :  �Ѱ�� '�Ѱ�', �߰������ '��' �� ���
--TODO: �μ���(dept_name) �� �ִ� salary�� �ּ� salary�� ��ȸ




--TODO: ���_id(mgr_id) �� ������ ���� �Ѱ踦 ��ȸ�Ͻÿ�.


       

--TODO: �Ի翬��(hire_date�� year)�� �������� ���� ���� �հ� �׸��� �Ѱ谡 ���� ��µǵ��� ��ȸ.




--TODO: �μ���(dept_name), �Ի�⵵�� ��� �޿�(salary) ��ȸ. �μ��� ����� �����谡 ���� �������� ��ȸ



