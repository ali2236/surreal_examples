-- نام و تاریخ تولد دانشجو های بدشناسی که در روز تولدشان امتحان پایانترم داشته یا دارند
select stname from student 
where (->studentCourse.finalday ?= stbday) 
&& (->studentCourse.finalmonth ?= stbmonth);

select stname from stt 
where (->stcot.finalday ?= stbday) 
&& (->stcot.finalmonth ?= stbmonth);

-- میخواهیم برای استاد و دانشجو های یک رشته که در یک روز و ماه متولد شده اند تولد بگیریم.نام هردو و تاریخ تولد را پیدا کنید.
select st.stname as stname, prof.profname as profname, st.stbmonth as bmonth, st.stbday as bday 
from (select id as st, ->stdep->dep<-profdep<-prof as prof 
from student split prof)
 where (prof.profbday == st.stbday) 
 and (prof.profbmonth == st.stbmonth);

-- سوال قبلی را برای دو دانشجو متولد یک روز و ماه که از یک رشته نباشند حل کنید.
select st1.stname as st1name, st2.stname as st2name, st1.stbmonth as bmonth, st1.stbday as bday
 from (select id as st1, (select id from student) as st2 from student split st2)
  where (st1.stmjr != st2.stmjr) 
  and (st1.stbmonth == st2.stbmonth) 
  and (st1.stbday == st2.stbday);