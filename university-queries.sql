-- نام و تاریخ تولد دانشجو های بدشناسی که در روز تولدشان امتحان پایانترم داشته یا دارند
select stname from STT s1
join STCOT s2 on s1.stid = s2.stid 
and s1.stbmonth = s2.finalmonth 
and s1.stbday = s2.finalday;

-- میخواهیم برای استاد و دانشجو های یک رشته که در یک روز و ماه متولد شده اند تولد بگیریم.نام هردو و تاریخ تولد را پیدا کنید.
select st.stname, pf.profname, st.stbmonth, st.stbday
 from STT st
 join PROFT pf on st.stdepid = pf.profdepid
and st.stbmonth = pf.profbmonth
and st.stbday = pf.profbday;

-- سوال قبلی را برای دو دانشجو متولد یک روز و ماه که از یک رشته نباشند حل کنید.
select s1.stname, s2.stname, s1.stbmonth, s2.stbday
 from STT s1
 join STT s2 on s1.stmjr <> s2.stmjr
and s1.stbmonth = s2.stbmonth
and s1.stbday = s2.stbday;

-- دانشجو های کامپیوتری که تا حاال درس پایگاه داده را اخذ نکرده اند.
select stname from (select coid from COT where cotitle = 'Databases 1') as co
	natural join STCOT stco
    right join (select stid, stname from STT where stmjr = 'COMPUTER') as st
    on st.stid = stco.stid
where co.coid is null;

-- اسامی دانشجویان کامپیوتری که تا حاال بیشترین بار درس شیرین ریاضی 1 را افتاده اند!)اسطوره ها(
select st.stname, count(st.stid) as oftedeCount from (select coid from COT where cotitle = 'Calculus 1') as co
	left join STCOT stco on stco.coid = co.coid and stco.grade < 10
    inner join STT st where st.stid = stco.stid and st.stmjr = 'COMPUTER'
group by stco.stid
having count(st.stid) = (
	select count(st.stid) as dc 
    from (select * from STT where stmjr = 'COMPUTER') as st
	inner join STCOT stco on stco.stid = st.stid 
    and stco.coid = (select coid from COT where cotitle = 'Calculus 1')
	where stco.grade < 10.0
    group by st.stid
	limit 1
	)

select st.stname, count(st.stid) as oftedeCount 
from STCOT stco
    inner join STT st 
    on st.stid = stco.stid 
    and st.stmjr = 'COMPUTER'
    and stco.coid = 'MATH1211'
    and stco.grade < 10
group by stco.stid
having count(st.stid) = (
	select count(st.stid) from STT st
	inner join STCOT stco 
    on st.stmjr = 'COMPUTER'
    and stco.stid = st.stid
    and stco.coid = 'MATH1211'
	and stco.grade < 10.0
    group by st.stid
	limit 1
)    

-- میانگین نمره های داده شده توسط هر استاد در هر درس چند است
select prof.profname, co.cotitle, avg(stco.grade) as avgGrade
 from PROFT prof
	inner join STCOT stco on stco.profid = prof.profid
    inner join COT co on co.coid = stco.coid
group by stco.profid, stco.coid
order by prof.profid desc;

-- میانگین نمره کسب شده توسط دانشجویان هر درس چند است.
select co.cotitle, avg(stco.grade) as avgGrade from COT co
inner join STCOT stco on co.coid = stco.coid
group by stco.coid;

-- دانشجویانی که اطالعات تماسی برای آنها ثبت نشده اند.)دانشجو یک موجودیت ضعیف به نام اطالعات تماس به صورت n-1 دارد(
select st.stname from STPT sp
	right join STT st on st.stid = sp.stid
where sp.stphone is null;

-- نام اساتیدی که در بیشتر از یک گروه درس ارائه داده اند. )مثال استادی که به دانشجو های مختلف رشته های مختلف درس هایی مثل آمار، ریزپردازنده،سیگنال ارائه میدهد.(
select pf.profid, pf.profname from PROFT pf
join (select sc.profid, co.codep from STCOT sc 
join COT co on sc.coid = co.coid
group by sc.profid, co.codep) as pfcodep
on pfcodep.profid = pf.profid
group by pf.profid, pf.profname
having count(pfcodep.codep) > 1

--- 
create table UselessTable (
    
);