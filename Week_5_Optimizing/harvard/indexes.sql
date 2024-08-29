CREATE INDEX 'find_by_std_id' ON 'enrollments' ('student_id');
CREATE INDEX 'find_by_course_id' ON 'enrollments' ('course_id');
CREATE INDEX 'find_by_course_num' ON 'courses' ('number');
CREATE INDEX 'find_by_course_sem' ON 'courses' ('semester');
CREATE INDEX 'find_by_satisfies_course_id' ON 'satisfies' ('course_id');
