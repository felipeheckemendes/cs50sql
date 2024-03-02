-- For enrollments table
-- 1. We have queries (2 and 3) which use the course_id on WHERE(2) or JOIN(3) statements
-- 2. We have queries (1 and 6) which use the student_id on JOIN(1) or WHERE(6) statements
-- For this reason, we need to create 2 indexes, one for each column
CREATE INDEX "enrollments_index_course"
ON "enrollments" ("course_id");

CREATE INDEX "enrollments_index_student"
ON "enrollments" ("student_id");

-- For the courses table
-- 1. We have queries (2 and 4) which use DEPARTMENT, NUMBER and SEMESTER toghether on WHERE statements [query 4 uses only DEPARTMENT and SEMESTER].
-- 2. We have queries (5 and 7) which use TITLE and SEMESTER on WHERE statements
-- For this reason, we chose to create two different composite indexes, one appopriate for each query.
-- Another option would have been to create 4 separate queries, one for each column on the table. However, I understand that 4 indexes of a single column could take more space than 2 composite indexes, so I chose the latter option.
CREATE INDEX "courses_index_d_n_s"
ON "courses" ("department", "number", "semester");

CREATE INDEX "courses_index_t_s"
ON "courses" ("title", "semester");

-- For the satisfies table
-- Only the column course_id is used on queries (5 and 6) for the satisfies table, so it is necessary to create only one query.
CREATE INDEX "satisfies_index_course"
ON "satisfies" ("course_id");