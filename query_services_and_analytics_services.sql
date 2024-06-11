-- Query Services and Analytics Services

-- Running SQL++ queries:

-- Display the inserted data for Student, Application and University
SELECT * FROM Student;

SELECT * FROM Universities;

SELECT * FROM Registration;

-- Query 1: Displaying the registrationid and universityid where application status is FAILURE
SELECT rid, uniid
FROM Registration
WHERE regstatus = 'FAILURE';

-- Query 2: Displaying the university id, university name, tuition fee, rank and university ordering university tuition fee
SELECT uniid, uniname, rank, tutitionfee
FROM Universities
ORDER BY tutitionfee;

-- Query 3: Displaying the registrationid and workexperience of the students whose registrationid is less than 600
SELECT regid, wrkexp
FROM Student
WHERE regid < 600;

-- Query 4: Displaying registration status, University name, University ID, and Registration ID in the order of Registration ID and University ID
FROM Universities AS u
LEFT OUTER JOIN Registration AS r ON u.uniid = r.uniid
SELECT u.uniid, u.uniname, r.regstatus, r.rid
ORDER BY u.uniid, r.rid;

-- Query 5: Displaying tuition fees of university based on work experience
FROM Universities AS u
GROUP BY u.tutitionfee AS fee
SELECT fee, ROUND(AVG(u.wrkexp)) AS exp
ORDER BY fee;

