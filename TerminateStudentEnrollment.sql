CREATE DEFINER=`root`@`localhost` PROCEDURE `terminate_student_enrollment`(
  StudentID_in varchar(45),
  CourseCode_in varchar(45),
  Section_in varchar(45),
  EndDate_in date
)
BEGIN
UPDATE classparticipant
SET EndDate = EndDate_in
WHERE ID_Student = StudentID_in
AND
ID_Class = (
	SELECT ID_Class FROM class c
    INNER JOIN course co ON c.ID_Course = co.ID_Course
    WHERE co.CourseCode = CourseCode_In
    AND c.Section = Section_in
);
END