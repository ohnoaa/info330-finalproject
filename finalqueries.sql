-- Query 1 (Janis)
SELECT S.student_id, GC.grade_type, SG.grade_val, FI.famrel 
FROM student S 
JOIN student_grade SG ON  S.student_id = SG.student_id   
JOIN grade_category GC ON SG.grade_type_id = GC.grade_type_id  
JOIN family_info FI ON S.student_id = FI.student_id 
JOIN famrel_category FC ON FI.famrel = FC.famrel_id 
WHERE (famrel_id=1 OR famrel_id=2) AND GC.grade_type='G1'; 

-- Query 2 (Janis)
SELECT S.student_id, S.failures, GC.grade_type, SG.grade_val, PS.pstatus_abv  
FROM student S   
JOIN student_grade SG ON  S.student_id = SG.student_id   
JOIN grade_category GC ON SG.grade_type_id = GC.grade_type_id  
JOIN family_info FI ON S.student_id = FI.student_id   
JOIN pstatus PS ON FI.pstatus_id = PS.pstatus_id  
WHERE PS.pstatus_type ='Living apart' AND GC.grade_type='G1'; 

-- Query 3 (Noa)
CREATE TABLE f_g3_temp AS 
SELECT student.student_id, student.sex, studytime.time_hr, grade_category.grade_type, student_grade.grade_val 
FROM student 
JOIN studytime 
ON student.studytime_id = studytime.studytime_id 
JOIN student_grade 
ON student.student_id = student_grade.student_id 
JOIN grade_category 
ON student_grade.grade_type_id = grade_category.grade_type_id 
WHERE student.sex = 'F' 
AND (studytime.time_hr = '5 - 10 hours' 
OR studytime.time_hr = '>10 hours') 
AND grade_category.grade_type = 'G3'; 

-- Query 4 (Noa)
CREATE TABLE student_grade_activites_temp AS 
SELECT student.student_id, social.activities, social.freetime, social.goout, grade_category.grade_type, student_grade.grade_val 
FROM student 
JOIN student_grade 
ON student.student_id = student_grade.student_id 
JOIN grade_category 
ON student_grade.grade_type_id = grade_category.grade_type_id 
JOIN social 
ON student.student_id = social.student_id 
WHERE social.activities = 'no' 
AND social.goout = '5' 
AND social.freetime = '5'; 

-- Query 5 (Mari)
CREATE TABLE temp_job AS 
SELECT parent_info.*,  job.* 
FROM student 
JOIN parent_info ON parent_info.student_id = student.student_id 
JOIN job ON parent_info.mjob = job.job_id 
  
SELECT DISTINCT student.student_id, traveltime.traveltime_hr, internet.internet_ans, job.job_type AS fjob_type, temp_job.job_type AS mjob_type, student_grade.grade_val AS g3_grade  
FROM student  
JOIN school_info ON student.student_id = school_info.student_id  
JOIN traveltime ON school_info.traveltime_id = traveltime.traveltime_id  
JOIN internet ON student.internet_id = internet.internet_id  
JOIN parent_info ON student.student_id = parent_info.student_id  
JOIN job ON parent_info.fjob = job.job_id   
JOIN temp_job ON temp_job.mjob = parent_info.mjob  
JOIN student_grade ON student.student_id = student_grade.student_id  
WHERE student.address_id ='2'  
AND student_grade.grade_type_id = '3'; 

-- Query 6 (Mari)
SELECT student.student_id, higher.higher_ans, student_grade.grade_val AS g3_grade 
FROM student 
JOIN social ON student.student_id = social.student_id 
JOIN higher ON student.higher_id = higher.higher_id 
JOIN student_grade on student_grade.student_id = student.student_id 
WHERE age < '18' AND walc > '3' AND dalc > '3' AND grade_type_id = '3'; 

-- Query 7 (Amber)
CREATE TABLE top_students AS  
SELECT student.student_id, school.school_name, student.sex, student.age, student_grade.grade_val 
FROM school 
JOIN school_info ON school.school_id = school_info.school_id 
JOIN student ON school_info.student_id = student.student_id 
JOIN student_grade ON student.student_id = student_grade.student_id 
WHERE grade_type_id = '3' 
AND grade_val = '19'; 

-- Query 8 (Amber)
CREATE TABLE top_traits AS 
SELECT student.student_id, student.failures, studytime.time_hr 
FROM student 
JOIN studytime  
ON student.studytime_id = studytime.studytime_id 
WHERE student_id = '339' 
OR student_id = '637'; 