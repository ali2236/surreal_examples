-- tables and data by Ali Ghanbari
drop table if exists DEPT;
drop table if exists COT;
drop table if exists STT;
drop table if exists STPT;
drop table if exists PROFT;
drop table if exists STCOT;

create table STT(
    stid char(10) primary key,
    stname char(60) not null,
    stlvl char(3) not null default 'bs',
    stmjr char(20) not null,
    stbyear integer,
    stbmonth integer,
    stbday integer,
    stdepid char(6) references DEPT(depid)
);

create table COT(
    coid char(8) primary key,
    cotitle char(60) not null,
    credit int not null check(1 <= credit <= 3),
    cotype char(1) not null check(cotype in ('t','p')),
    codep char(6) not null references DEPT(depid)
);

create table DEPT(
    depid char(6) primary key,
    depname char(60) not null
);

create table PROFT(
    profid integer primary key,
    profname char(60) not null,
    profbyear integer not null,
    profbmonth integer not null,
    profbday integer not null,
    profdepid char(6) references DEPT(depid)
);

create table STCOT(
    stid char(10) not null references STT(stid),
    coid char(8) not null references COT(coid),
    profid integer not null references PROFT(profid),
    yr integer not null,
    tr integer not null,
    grade real,
    finalyear integer not null,
    finalmonth integer not null,
    finalday integer not null,
    primary key(stid, coid, yr, tr)
);

create table STPT (
    stid char(10) not null references STT(stid),
    stphone char(13) not null
);

insert into DEPT (depid, depname) values 
    ('ENGNDP', 'Departmant of engineering'),
    ('DATASC', 'Departmant of Data Scince'),
    ('KEMSDP', 'Departmant of chemestry'),
    ('ARKDCE', 'Departmant of architecture')
;

insert into STT (stid, stname, stmjr, stbyear, stbmonth, stbday, stdepid) values
   ('960544752', 'Ali Alawi', 'MATHEMATICS', 1377, 3, 21, 'DATASC'),
   ('960544753', 'Ali Alawian', 'MATHEMATICS', 1377, 9, 26, 'DATASC'),
   ('970544754', 'Ali Alipour', 'MATHEMATICS', 1378, 3, 14, 'DATASC'),
   ('980544755', 'Ali Ali zadeh', 'MATHEMATICS', 1380, 10, 2, 'DATASC'),

   ('960214712', 'Amin Amini', 'COMPUTER', 1377, 12, 24, 'DATASC'),
   ('960214114', 'Amin khaki', 'COMPUTER', 1378, 9, 29, 'DATASC'),
   ('950214718', 'Amin Abi', 'COMPUTER', 1376, 3, 2, 'DATASC'),
   ('970214745', 'Amin Zamini', 'COMPUTER', 1379, 5, 18, 'DATASC'),
   ('970214464', 'Amin Asmani', 'COMPUTER', 1379, 4, 4, 'DATASC'),
   ('980214772', 'Amin Havaie', 'COMPUTER', 1379, 10, 1, 'DATASC'),
   ('990214772', 'Amin Atashi', 'COMPUTER', 1381, 1, 12, 'DATASC'),

   ('970845269', 'Amir Amiri', 'CIVIL', 1378, 9, 29, 'ARKDCE'),
   ('980845278', 'Amir Sanati', 'CIVIL', 1379, 10, 3, 'ARKDCE'),
   ('960845299', 'Amir Sonnati', 'CIVIL', 1378, 3, 4, 'ARKDCE'),
   ('990845285', 'Amir Alaska', 'CIVIL', 1380, 9, 30, 'ARKDCE'),
   ('950845201', 'Amir Bastani', 'CIVIL', 1376, 10, 26, 'ARKDCE'),

   ('960216644', 'Homan Hamidpour', 'COMPUTER', 1378, 2, 29, 'DATASC'),
   ('970216657', 'Ali Memezadegan', 'COMPUTER', 1379, 6, 26, 'DATASC');

insert into PROFT (profid, profname, profbyear, profbmonth, profbday, profdepid) values
 (1, 'Maryam 1', 1372, 2, 2, 'DATASC'),
 (2, 'Maryam 2', 1370, 11, 8, 'DATASC'),
 (3, 'Maryam 3', 1371, 12, 24, 'DATASC'),
 (4, 'Maryam 4', 1369, 4, 4, 'DATASC'),
 
 (5, 'Reza 1', 1367, 5, 15, 'DATASC'),
 (6, 'Reza 2', 1361, 7, 7, 'ARKDCE'),
 (7, 'Reza 3', 1358, 12, 4, 'ARKDCE'),
 (8, 'Reza 4', 1353, 2, 14, 'DATASC'),

 (9, 'Sina 1', 1358, 11, 1, 'ARKDCE'),
 (10, 'Sina 2', 1358, 12, 4, 'ARKDCE'),
 (11, 'Sina 3', 1358, 1, 12, 'ARKDCE'),
 (12, 'Sina 4', 1358, 7, 10, 'ARKDCE');

insert into COT (coid, cotitle, credit, cotype, codep) values 
('CS1101','Programming Fundementals', 3, 't', 'DATASC'),
('CS1102','Advanced Programming', 3, 't', 'DATASC'),
('CS2203','Databases 1', 3, 't', 'DATASC'),
('CS2301', 'Operating Systems', 3, 't', 'DATASC'),
('CS2401','Software Engneering 1', 3, 't', 'DATASC'),
('CS3303','Data Structures', 3, 't', 'DATASC'),
('CS4403','Software Engneering 2', 3, 't', 'DATASC'),
('CS3306','Databases 2', 3, 't', 'DATASC'),

('MATH1211', 'Calculus 1', 3, 't', 'DATASC'),
('MATH2211', 'Calculus 2', 3, 't', 'DATASC'),
('MATH3211', 'Calculus 3', 3, 't', 'DATASC'),

('CE2110', 'Applied Mechanics I', 3, 't', 'ARKDCE'),
('CE2120', 'Applied Mechanics II', 3, 't', 'ARKDCE'),
('CE2211', 'Engineering Economics I', 1, 't', 'ARKDCE'),
('CE2310', 'Environmental Engineering Fundamentals', 3, 't', 'ARKDCE'),
('CE3110', 'Mechanics of Materials', 3, 't', 'ARKDCE')
;

insert into STCOT (stid, coid, profid, yr, tr, finalyear, finalmonth, finalday, grade) values
('960216644', 'MATH1211', 5, 1396, 1, 1396, 9, 29, 9.75),
('960214712', 'MATH1211', 5, 1396, 1, 1396, 9, 29, 15.5),
('960214114', 'MATH1211', 10, 1396, 1, 1396, 9, 29, 11),
('950214718', 'MATH1211', 10, 1396, 1, 1396, 9, 29, 10),
('960845299', 'MATH1211', 9, 1396, 1, 1396, 9, 29, 9.75),

('960216644', 'MATH1211', 10, 1396, 2, 1397, 3, 1, 9.75),
('960845299', 'MATH1211', 10, 1396, 2, 1397, 3, 1, 10.25),

('960216644', 'MATH1211', 9, 1397, 1, 1397, 10, 2, 11),
('970214745', 'MATH1211', 9, 1397, 1, 1397, 10, 2, 0),
('970214464', 'MATH1211', 5, 1397, 1, 1397, 10, 2, 9.75),
('970845269', 'MATH1211', 5, 1397, 1, 1397, 10, 2, 12.5),
('970216657', 'MATH1211', 10, 1397, 1, 1397, 10, 2, 16),

('970214745', 'MATH1211', 5, 1397, 2, 1398, 2, 27, 20),
('970214464', 'MATH1211', 5, 1397, 2, 1398, 2, 27, 7),

('970214464', 'MATH1211', 9, 1398, 1, 1398, 10, 3, 10),
('980214772', 'MATH1211', 9, 1398, 1, 1398, 10, 3, 11.5),
('980845278', 'MATH1211', 5, 1398, 1, 1398, 10, 3, 9.75),

('980845278', 'MATH1211', 5, 1398, 2, 1399, 2, 5, 14.5),

('990214772', 'MATH1211', 10, 1399, 1, 1399, 10, 26, 20),
('990845285', 'MATH1211', 10, 1399, 1, 1399, 10, 26, 20),

('960216644', 'CS2203', 2, 1398, 1, 1398, 11, 5, 18),
('960214712', 'CS2203', 2, 1398, 1, 1398, 11, 5, 12),
('970216657', 'CS2203', 3, 1399, 1, 1399, 11, 7, null),

('970845269', 'CE2110', 9, 1397, 1, 1397, 11, 4, 18.5),
('970845269', 'CE2120', 10, 1397, 2, 1398, 3, 4, 14.5);

insert into STPT (stid, stphone) values 
('960544753','989172581463'),
('980214772','989142541441'),
('950845201','989262478145'),
('970216657','989324581447'),
('960216644','989885421746'),
('980845278','989445521458'),
('960845299','989124578521'),
('980544755','989173541565');