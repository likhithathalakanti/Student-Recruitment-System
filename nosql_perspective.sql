-- ORM from a NoSQL Perspective
-- The StudentID entities are nested within the Student and Profile entities to enhance the Student and Profile tables.
-- Students and Login entities nest within the StudentID entity in the Student and Login tables.
-- Universities entity is nested in Courses to extend CourseID.
-- The ProfileID entity is extended by nesting Profiles and Major(or Registration).

-- Steps:
-- Created Three Buckets

-- Creating primary index

-- Query: create primary index on Universities:
create primary index on Universities;

-- create primary index on Student:
create primary index on Student;

-- create primary index on Registration:
create primary index on Registration;

-- JSON Documents

-- Few sample documents that are to be inserted into the buckets:

-- Student
insert into Student(key, value) values
('101', { 'regid': '101', 'name': 'std1', 'uniname': 'ASU', 'wrkexp': '2' }),
('201', { 'regid': '201', 'name': 'std2', 'uniname': 'UTAM', 'wrkexp': '0' }),
('301', { 'regid': '301', 'name': 'std3', 'uniname': 'CSTU', 'wrkexp': '10' }),
('401', { 'regid': '401', 'name': 'std4', 'uniname': 'WSU', 'wrkexp': '7' }),
('501', { 'regid': '501', 'name': 'student5', 'uniname': 'CSAU', 'wrkexp': '3' }),
('6', { 'regid': '6', 'name': 'student6', 'uniname': 'FSTU', 'wrkexp': '3' }),
('7', { 'regid': '7', 'name': 'student7', 'uniname': 'AMGT', 'wrkexp': '0' }),
('8', { 'regid': '8', 'name': 'student8', 'uniname': 'BMWU', 'wrkexp': '0' }),
('9', { 'regid': '9', 'name': 'student9', 'uniname': 'AUDI', 'wrkexp': '0' }),
('10', { 'regid': '10', 'name': 'student10', 'uniname': 'JSTU', 'wrkexp': '3' });

-- Major (alias Registration) Data Entry
insert into Registration(key, value) values
('1011', { 'rid': '1011', 'regid': '101', 'uniid': '121', 'regtype': 'UG', 'regstatus': 'SUCCESS' }),
('1021', { 'rid': '1021', 'regid': '101', 'uniid': '122', 'regtype': 'G', 'regstatus': 'SUCCESS' }),
('1031', { 'rid': '1031', 'regid': '101', 'uniid': '123', 'regtype': 'G', 'regstatus': 'FAILURE' }),
('1062', { 'rid': '1062', 'regid': '201', 'uniid': '126', 'regtype': 'UG', 'regstatus': 'SUCCESS' }),
('1072', { 'rid': '1072', 'regid': '201', 'uniid': '127', 'regtype': 'G', 'regstatus': 'FAILURE' }),
('1032', { 'rid': '1032', 'regid': '301', 'uniid': '123', 'regtype': 'UG', 'regstatus': 'FAILURE' }),
('1042', { 'rid': '1242', 'regid': '201', 'uniid': '124', 'regtype': 'G', 'regstatus': 'SUCCESS' }),
('1053', { 'rid': '1053', 'regid': '301', 'uniid': '125', 'regtype': 'G', 'regstatus': 'FAILURE' }),
('1063', { 'rid': '1063', 'regid': '301', 'uniid': '126', 'regtype': 'G', 'regstatus': 'SUCCESS' }),
('1023', { 'rid': '1023', 'regid': '401', 'uniid': '122', 'regtype': 'UG', 'regstatus': 'SUCCESS' }),
('1083', { 'rid': '1083', 'regid': '401', 'uniid': '128', 'regtype': 'G', 'regstatus': 'SUCCESS' }),
('1013', { 'rid': '1013', 'regid': '401', 'uniid': '121', 'regtype': 'G', 'regstatus': 'SUCCESS' }),
('1015', { 'rid': '1015', 'regid': '501', 'uniid': '121', 'regtype': 'G', 'regstatus': 'FAILURE' }),
('1025', { 'rid': '1025', 'regid': '501', 'uniid': '122', 'regtype': 'G', 'regstatus': 'SUCCESS' }),
('1035', { 'rid': '1035', 'regid': '601', 'uniid': '123', 'regtype': 'UG', 'regstatus': 'SUCCESS' }),
('1046', { 'rid': '1046', 'regid': '601', 'uniid': '124', 'regtype': 'G', 'regstatus': 'SUCCESS' });

-- Universities
insert into Universities(key, value) values
('121', { 'uniid': '121', 'uniname': 'ASU', 'rank': '5', 'tutitionfee': '55749', 'courses': { 'c1': 'C S', 'c2': 'I T', 'c3': 'ARTS', 'c4': 'CNT', 'c5': 'S E', 'c6': 'B A' } }),
('122', { 'uniid': '122', 'uniname': 'BSU', 'rank': '50', 'tutitionfee': '60000', 'courses': { 'c1': 'C S', 'c2': 'I T', 'c3': 'M E', 'c4': 'CNT', 'c5': 'S E', 'c6': 'B A' } }),
('123', { 'uniid': '123', 'uniname': 'STU', 'rank': '2', 'tutitionfee': '40000', 'courses': { 'c1': 'C S', 'c2': 'I T', 'c3': 'ARTS', 'c4': 'CNT', 'c5': 'S E', 'c6': 'B A' } }),
('124', { 'uniid': '124', 'uniname': 'SEATTLE UNIVERSITY', 'rank': '12', 'tutitionfee': '35000', 'courses': { 'c1': 'C S', 'c2': 'I T', 'c3': 'LIT', 'c4': 'CNT', 'c5': 'S E', 'c6': 'B A' } }),
('125', { 'uniid': '125', 'uniname': 'UTA', 'rank': '22', 'tutitionfee': '41560', 'courses': { 'c1': 'C S', 'c2': 'I T', 'c3': 'S E', 'c4': 'B A' } }),
('126', { 'uniid': '126', 'uniname': 'UNT', 'rank': '39', 'tutitionfee': '38000', 'courses': { 'c1': 'C S', 'c2': 'I T', 'c3': 'S E', 'c4': 'B A' } }),
('127', { 'uniid': '127', 'uniname': 'USF', 'rank': '27', 'tutitionfee': '29056', 'courses': { 'c1': 'C S', 'c2': 'I T', 'c3': 'S E', 'c4': 'B A', 'c5': 'C E' } }),
('128', { 'uniid': '128', 'uniname': 'UMBC', 'rank': '18', 'tutitionfee': '39078', 'courses': { 'c1': 'C S', 'c2': 'I T', 'c3': 'S E', 'c4': 'B A', 'c5': 'C E' } });

