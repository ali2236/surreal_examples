-- نام و تاریخ تولد دانشجو های بدشناسی که در روز تولدشان امتحان پایانترم داشته یا دارند
select stname from student 
where (->studentCourse.finalday ?= stbday) 
&& (->studentCourse.finalmonth ?= stbmonth);

select stname from stt 
where (->stcot.finalday ?= stbday) 
&& (->stcot.finalmonth ?= stbmonth);

-- میخواهیم برای استاد و دانشجو های یک رشته که در یک روز و ماه متولد شده اند تولد بگیریم.نام هردو و تاریخ تولد را پیدا کنید.
select stname, profs.profname as profname from (select stname, stbday, stbmonth, ->stdep->dep<-profdep<-prof as profs from student) where profs.profbday ?= stbday and profs.profbmonth ?= stbmonth;

select * from (select ->stdep->dep<-profdep<-prof from student);

select name from (select stname as name, stbmonth as bmonth, stbday as bday from student), (select profname as name, profbmonth as bmonth, profbday as bday from prof) group by bmonth, bday;
select stname, profname, bmonth, bday from (select stname, stbmonth as bmonth, stbday as bday from student), (select profname, profbmonth as bmonth, profbday as bday from prof) group by bmonth, bday; 
select stname, pf.profname, st.stbmonth, st.stbday
 from STT st
 join PROFT pf on st.stdepid = pf.profdepid
and st.stbmonth = pf.profbmonth
and st.stbday = pf.profbday;