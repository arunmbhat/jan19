select ename,deptno,sal from emp e 
where sal=(select max(sal) from emp where deptno=e.deptno);
 
 select ename,sal,empno,mgr from emp
 where sal=(select max(sal) from emp)
 
select ename from emp where deptno=(select deptno from dept where loc='dallas')

select * from emp where comm is null;

select max(sal)  from emp where sal not in(select max(sal) from emp)

select deptno,count(*) empcount from emp group by deptno

select max(empcount) maximum from(select deptno,count(*) empcount from emp group by deptno) x

select deptno,count(*) maxcount from emp group by deptno 
having count(*)=(select max(empcount) maximum from(select deptno,count(*) empcount from emp group by deptno) x)

select deptno from (select deptno,count(*) maxcount from emp group by deptno 
having count(*)=(select max(empcount) maximum from(select deptno,count(*) empcount from emp group by deptno) x))y

select loc, deptno from dept
where deptno in (select deptno from (select deptno,count(*) maxcount from emp group by deptno 
having count(*)=(select max(empcount) maximum from(select deptno,count(*) empcount from emp group by deptno) x))y)

select max(cnt) maxximum from  (select year(hiredate) hd, count(*) cnt from emp group by year(hiredate)) y 

select * from (select e.deptno, e.job from emp e where e.deptno=deptno and e.job=job) y where job in any ( select e.deptno, e.job from emp e where e.job=job)

 select e.deptno, e.job from emp e where e.job=job


 select e.deptno, e.ENAME, d.job from emp e, emp d
   where e.deptno=d.deptno and e.job=d.job
   
  select emp.ename,emp.job,emp.deptno from emp ,(select deptno,job,count(*) ppl from emp group by job,deptno having count(*)>1) y
  where y.deptno=emp.deptno and y.job=emp.job

  select deptno,mgr,count(*) ppl from emp group by deptno,mgr having
  count(*) = (select max(ppl) maximum from (select mgr,deptno,count(*) ppl from emp group by deptno,mgr ) y)
 
select avg(sal) avgsal,deptno from emp group by deptno

select  a.* from emp a where a.sal>(select avg(sal) from emp b where a.deptno=b.deptno)  


select e1.deptno,sum(e2.deptno) summ from dept e1 join dept e2
on e1.deptno>=e2.deptno group by e1.deptno 


select max(sal)  from emp where sal<(select max(sal) from emp  where sal not in (select max(sal) from emp)) 

select max(sal) from emp

select  deptno,count(*) num from emp group by deptno 
having count(*)=(select max(num) from (select  deptno,count(*) num from emp group by deptno)x)

select year(getdate()),hiredate from emp
