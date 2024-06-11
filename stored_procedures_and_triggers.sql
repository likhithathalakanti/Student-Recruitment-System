-- Stored Procedure 1:
CREATE PROC SCHOLARSHIP AS
SELECT * FROM UNIVERSITY
WHERE ((SELECT COUNT(*) FROM STUDENTS JOIN ST_PROFILE ON STUDENTS.STUDENT_ID = ST_PROFILE.STUDENT_ID
WHERE ST_PROFILE.WORK_EXPERIENCE > 3) > 0)
ORDER BY FEES
GO

EXEC SCHOLARSHIP

-- Stored Procedure 2:
CREATE PROC STOPCOURSES AS
SELECT * FROM STUDENTS JOIN UNIVERSITY ON STUDENTS.STUDENT_ID = UNIVERSITY.STUDENT_ID
WHERE UNIVERSITY.FEES > 2000
GO

EXEC STOPCOURSES

-- Trigger 1:
CREATE TRIGGER STUDENT_JOINING ON STUDENTS AFTER INSERT AS
DECLARE @NAME VARCHAR(20)
SELECT @NAME = NAME FROM INSERTED

BEGIN
IF (@NAME IS NULL)
UPDATE STUDENTS SET NAME = 'TEMP_STU1'
WHERE STUDENT_ID = (SELECT STUDENT_ID FROM INSERTED)
END

INSERT INTO STUDENTS (STUDENT_ID, NAME, DATEOFBIRTH, COUNTRY, MG_BALANCE, GENDER)
VALUES (6, 'Dpu', '2000-06-11', 'IND', 25, 'MALE')
SELECT * FROM STUDENTS

-- Trigger 2:
CREATE TRIGGER STUDENTPROFILE_CHANGE ON ST_PROFILE INSTEAD OF UPDATE AS
DECLARE @WORKEXP INT
SELECT @WORKEXP = WORK_EXPERIENCE FROM INSERTED

BEGIN
IF @WORKEXP = 0
THROW 50001, 'Student should have minimum work experience', 1
ELSE
UPDATE ST_PROFILE SET WORK_EXPERIENCE = @WORKEXP WHERE STUDENT_ID = (SELECT STUDENT_ID FROM INSERTED)
END

UPDATE ST_PROFILE
SET WORK_EXPERIENCE = 3
WHERE STUDENT_ID = 2
SELECT * FROM ST_PROFILE
