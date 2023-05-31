-- Step 1: mini tables:   
-- Address table
CREATE TABLE address (   
	address_id INTEGER PRIMARY KEY AUTOINCREMENT,   
	address_type TEXT, 
	address_abv TEXT 
);   
    
INSERT INTO address(address_type, address_abv)   
SELECT DISTINCT address, address  
FROM student_temp;   
    
UPDATE address  
SET address_type = 'Urban'   
WHERE address_abv = 'U';   
   
UPDATE address   
SET address_type = 'Rural'   
WHERE address_abv = 'R';   
   
-- Studytime table
CREATE TABLE studytime (   
	studytime_id INTEGER PRIMARY KEY AUTOINCREMENT,   
	time_hr TEXT   
);   
    
INSERT INTO studytime(time_hr)   
SELECT DISTINCT studytime   
FROM student_temp;   
   
UPDATE studytime   
SET time_hr = '<2 hours'   
WHERE time_hr = '1';   
   
UPDATE studytime   
SET time_hr = '2 to 5 hours'  
WHERE time_hr=  '2';   
   
UPDATE studytime   
SET time_hr = '5 - 10 hours'   
WHERE time_hr = '3';   
   
UPDATE studytime   
SET time_hr = '>10 hours'   
WHERE time_hr = '4';   
   
   
-- Nursery table
CREATE TABLE nursery (   
    nursery_id INTEGER PRIMARY KEY AUTOINCREMENT,   
    nursery_ans TEXT   
);   
    
INSERT INTO nursery(nursery_ans)   
SELECT DISTINCT nursery   
FROM student_temp;   
   
-- Higher table
CREATE TABLE higher (   
    higher_id INTEGER PRIMARY KEY AUTOINCREMENT,   
    higher_ans TEXT   
);   
    
INSERT INTO higher(higher_ans)   
SELECT DISTINCT higher   
FROM student_temp;   
   
   
-- Internet table 
CREATE TABLE internet (   
    internet_id INTEGER PRIMARY KEY AUTOINCREMENT,   
    internet_ans TEXT   
);   
    
INSERT INTO internet(internet_ans)   
SELECT DISTINCT internet   
FROM student_temp;   
   
   
-- Paidclasses table
CREATE TABLE paidclasses (   
	paid_id INTEGER PRIMARY KEY AUTOINCREMENT,   
	paid TEXT    
);   
    
INSERT INTO paidclasses(paid)   
SELECT DISTINCT paid   
FROM student_temp;   
   
-- Health_category table
CREATE TABLE health_category (   
	health_id INTEGER PRIMARY KEY,   
	category TEXT   
);   
  
INSERT INTO health_category(health_id, category)   
VALUES (1, 'Very bad');   
   
INSERT INTO health_category(health_id, category)   
VALUES (2, 'Bad');   
   
INSERT INTO health_category(health_id, category)   
VALUES (3, 'Neutral');   
   
INSERT INTO health_category(health_id, category)   
VALUES (4, 'Good');   
   
INSERT INTO health_category(health_id, category)   
VALUES (5, 'Very good');   
   
   
-- Alc_goout_freetime_category table
CREATE TABLE alc_goout_freetime_category (   
	category_id INTEGER PRIMARY KEY,   
	category TEXT   
);   
   
INSERT INTO alc_goout_freetime_category(category_id, category)   
VALUES (1, 'Very low');   
   
INSERT INTO alc_goout_freetime_category(category_id, category)   
VALUES (2, 'Low');   
   
INSERT INTO alc_goout_freetime_category(category_id, category)   
VALUES (3, 'Medium');   
   
INSERT INTO alc_goout_freetime_category(category_id, category)   
VALUES (4, 'High');   
   
INSERT INTO alc_goout_freetime_category(category_id, category)   
VALUES (5, 'Very high');  
  
  
  
  
  
  
  
-- Step 2: Creating the mini tables for linked tables
-- Parent_info link table:
-- Edu mini table
CREATE TABLE edu (   
	edu_id INTEGER PRIMARY KEY,  
	edu_level TEXT  
);   
   
INSERT INTO edu(edu_id, edu_level)   
VALUES (0, 'None');  
   
INSERT INTO edu(edu_id, edu_level)   
VALUES (1, 'Primary Education (4th Grade)');  
   
INSERT INTO edu(edu_id, edu_level)   
VALUES (2, '5th to 9th grade');  
   
INSERT INTO edu(edu_id, edu_level)   
VALUES (3, 'Secondary education');  
   
INSERT INTO edu(edu_id, edu_level)   
VALUES (4, 'Higher education');  
   
--Job mini table
CREATE TABLE job (   
	job_id INTEGER PRIMARY KEY AUTOINCREMENT,   
	job_type TEXT   
);   
  
INSERT INTO job(job_type)   
SELECT DISTINCT mjob   
FROM student_temp;   
   
   
-- Family_info linking table
-- Famsize mini table
CREATE TABLE famsize(   
	famsize_id INTEGER PRIMARY KEY AUTOINCREMENT,   
	famsize_num TEXT, 
	famsize_abv TEXT 
);   
   
INSERT INTO famsize(famsize_num, famsize_abv)   
SELECT DISTINCT famsize, famsize   
FROM student_temp;   
   
UPDATE famsize  
SET famsize_num = 'Greater than 3'  
WHERE famsize_abv = 'GT3';  
   
UPDATE famsize  
SET famsize_num = 'Less than or equal to 3'  
WHERE famsize_abv = 'LE3';  
  
   
-- Pstatus mini table
CREATE TABLE pstatus(   
	pstatus_id INTEGER PRIMARY KEY AUTOINCREMENT,   
	pstatus_type TEXT, 
	pstatus_abv TEXT 
);   
   
INSERT INTO pstatus(pstatus_type, pstatus_abv)   
SELECT DISTINCT pstatus, pstatus 
FROM student_temp;   
   
UPDATE pstatus   
SET pstatus_type = 'Living together'   
WHERE pstatus_abv = 'T';   
   
UPDATE pstatus   
SET pstatus_type = 'Living apart'   
WHERE pstatus_abv = 'A';   
   
-- Guardian  mini table  
CREATE TABLE guardian (   
	guardian_id INTEGER PRIMARY KEY AUTOINCREMENT,   
	guardian_type TEXT   
);   
  
INSERT INTO guardian(guardian_type)   
SELECT DISTINCT guardian   
FROM student_temp;   
   
-- Famsup mini table
CREATE TABLE famsup (   
	famsup_id INTEGER PRIMARY KEY AUTOINCREMENT,   
	famsup_ans TEXT   
);   
  
INSERT INTO famsup(famsup_ans)   
SELECT DISTINCT famsup   
FROM student_temp;   
   
   
-- Famrel_category mini table
CREATE TABLE famrel_category (   
	famrel_id INTEGER PRIMARY KEY,   
	category TEXT   
);   

INSERT INTO famrel_category(famrel_id, category)   
VALUES (1, 'Very bad');   
   
INSERT INTO famrel_category(famrel_id, category)   
VALUES (2, 'Bad');   
   
INSERT INTO famrel_category(famrel_id, category)   
VALUES (3, 'Neutral');   
   
INSERT INTO famrel_category(famrel_id, category)   
VALUES (4, 'Good');   
   
INSERT INTO famrel_category(famrel_id, category)   
VALUES (5, 'Excellent');   
   
  
   
--School_info linking table
--School mini table
CREATE TABLE school (   
	school_id INTEGER PRIMARY KEY AUTOINCREMENT,   
	school_name TEXT, 
	school_abv TEXT 
);   
   
INSERT INTO school(school_name, school_abv)   
SELECT DISTINCT school, school 
FROM student_temp;   
 
UPDATE school   
SET school_name = 'Gabriel Pereira'   
WHERE school_name = 'GP';   
   
UPDATE school   
SET school_name = 'Mousinho da Silveira'  
WHERE school_name = 'MS';  
  
   
-- Schoolsup mini table
CREATE TABLE schoolsup(   
	schoolsup_id INTEGER PRIMARY KEY AUTOINCREMENT,   
	schoolsup_ans TEXT   
);   
   
INSERT INTO schoolsup(schoolsup_ans)   
SELECT DISTINCT schoolsup   
FROM student_temp;  
   
-- Reason mini table
CREATE TABLE reason (   
	reason_id INTEGER PRIMARY KEY AUTOINCREMENT,   
	reason_ans TEXT   
);   
   
INSERT INTO reason(reason_ans)   
SELECT DISTINCT reason   
FROM student_temp;   
   
   
-- Traveltime mini table
CREATE TABLE traveltime (   
	traveltime_id INTEGER PRIMARY KEY,   
	traveltime_hr TEXT   
);   
   
INSERT INTO traveltime(traveltime_id, traveltime_hr)   
VALUES(1, '<15 min');   
   
INSERT INTO traveltime(traveltime_id, traveltime_hr)   
VALUES(2, '15 to 30 min');   
   
INSERT INTO traveltime(traveltime_id, traveltime_hr)   
VALUES(3, '30 min to 1 hour');   
   
INSERT INTO traveltime(traveltime_id, traveltime_hr)   
VALUES(4, '>1 hour');  
  
  
  
-- Step 3: Creating student primary key in another temp table 
CREATE TABLE student_temp2 (  
	student_id INTEGER PRIMARY KEY AUTOINCREMENT,  
	school TEXT,  
	sex TEXT,  
	age INTEGER,  
	address TEXT,  
	famsize TEXT,  
	pstatus TEXT,  
	medu INTEGER,  
	fedu INTEGER,  
	mjob TEXT,  
	fjob TEXT,  
	reason TEXT,   
	guardian TEXT,  
	traveltime INTEGER,  
	studytime INTEGER,  
	failures INTEGER,  
	schoolsup TEXT,   
	famsup TEXT,  
	paid TEXT,  
	activities TEXT,   
	nursery TEXT,  
	higher TEXT,  
	internet TEXT,  
	romantic TEXT,  
	famrel INTEGER,  
	freetime INTEGER,  
	goout INTEGER,  
	dalc INTEGER,  
	walc INTEGER,  
	health INTEGER,  
	absences INTEGER,  
	G1 INTEGER,  
	G2 INTEGER,  
	G3 INTEGER  
);  
   
INSERT INTO student_temp2(school, sex, age, address, famsize, pstatus, medu, fedu, mjob, fjob,   
reason,  guardian, traveltime, studytime, failures, schoolsup, famsup, paid, activities, nursery, higher,  
internet, romantic, famrel, freetime, goout, dalc, walc, health, absences, G1, G2, G3)  
SELECT school, sex, age, address, famsize, Pstatus, Medu, Fedu, Mjob, Fjob,   
reason,  guardian, traveltime, studytime, failures, schoolsup, famsup, paid, activities, nursery, higher,  
internet, romantic, famrel, freetime, goout, Dalc, Walc, health, absences, G1, G2, G3  
FROM student_temp;  
  
  
-- Step 4: Finalizing Student table  (adding the foreign keys)
CREATE TABLE student ( 
	student_id INTEGER PRIMARY KEY, 
	sex TEXT, 
	age INTEGER, 
	address_id INTEGER, 
	studytime_id INTEGER, 
	failures INTEGER, 
	paid_id INTEGER, 
	nursery_id INTEGER, 
	higher_id INTEGER, 
	internet_id INTEGER, 
	health_id INTEGER, 
	absences INTEGER, 
	FOREIGN KEY (address_id) REFERENCES address(address_id), 
	FOREIGN KEY (studytime_id) REFERENCES studytime(studytime_id), 
	FOREIGN KEY (paid_id) REFERENCES paidclasses(paid_id), 
	FOREIGN KEY (nursery_id) REFERENCES nursery(nursery_id), 
	FOREIGN KEY (higher_id) REFERENCES higher(higher_id), 
	FOREIGN KEY (internet_id) REFERENCES internet(internet_id), 
	FOREIGN KEY (health_id) REFERENCES health_category(health_id) 
); 
  
INSERT INTO student(student_id, sex, age, address_id, studytime_id, failures, paid_id, nursery_id, higher_id, 
	internet_id, health_id, absences) 
SELECT student_temp2.student_id, student_temp2.sex, student_temp2.age, address.address_id, 
	studytime.studytime_id, student_temp2.failures, paidclasses.paid_id, nursery.nursery_id, higher.higher_id,  
	internet.internet_id, health_category.health_id, student_temp2.absences 
FROM student_temp2 
JOIN address 
ON student_temp2.address = address.address_abv 
JOIN studytime 
ON student_temp2.studytime = studytime.studytime_id 
JOIN paidclasses 
ON student_temp2.paid = paidclasses.paid 
JOIN nursery 
ON student_temp2.nursery = nursery.nursery_ans 
JOIN higher 
ON student_temp2.higher = higher.higher_ans 
JOIN internet 
ON student_temp2.internet = internet.internet_ans 
JOIN health_category 
ON student_temp2.health = health_category.health_id; 
  
  
  
-- Step 5: Making Linking Tables   
-- Parent_info table
CREATE TABLE parent_info (   
	student_id INTEGER,   
	medu INTEGER, 
	fedu INTEGER, 
	mjob INTEGER, 
	fjob INTEGER, 
	FOREIGN KEY (student_id) REFERENCES student(student_id), 
	FOREIGN KEY (medu) REFERENCES edu(edu_id), 
	FOREIGN KEY (fedu) REFERENCES edu(edu_id), 
	FOREIGN KEY (mjob) REFERENCES job(job_id), 
	FOREIGN KEY (fjob) REFERENCES job(job_id) 
);	   
  
CREATE TABLE mom_info_temp AS 
SELECT student_temp2.student_id, edu.edu_id, job.job_id 
FROM student_temp2 
JOIN edu 
ON student_temp2.medu = edu.edu_id 
JOIN job 
ON student_temp2.mjob = job.job_type; 
  
CREATE TABLE dad_info_temp AS 
SELECT student_temp2.student_id, edu.edu_id, job.job_id 
FROM student_temp2 
JOIN edu 
ON student_temp2.fedu = edu.edu_id 
JOIN job 
ON student_temp2.fjob = job.job_type; 
  
INSERT INTO parent_info(student_id, medu, fedu, mjob, fjob) 
SELECT student_temp2.student_id, mom_info_temp.edu_id, dad_info_temp.edu_id, 
	mom_info_temp.job_id, dad_info_temp.job_id 
FROM student_temp2 
JOIN mom_info_temp 
ON student_temp2.student_id = mom_info_temp.student_id 
JOIN dad_info_temp 
ON student_temp2.student_id = dad_info_temp.student_id; 
  
   
-- Family_info linking table
CREATE TABLE family_info (   
	student_id INTEGER,   
	famsize_id INTEGER,   
	pstatus_id INTEGER,   
	guardian_id INTEGER,   
	famsup_id INTEGER,   
	famrel INTEGER, 
	FOREIGN KEY (student_id) REFERENCES student(student_id),   
	FOREIGN KEY (famsize_id) REFERENCES famsize(famsize_id),   
	FOREIGN KEY (pstatus_id) REFERENCES pstatus(pstatus_id),   
	FOREIGN KEY (guardian_id) REFERENCES guardian(guardian_id),   
	FOREIGN KEY (famsup_id) REFERENCES famsup(famsup_id),   
	FOREIGN KEY (famrel) REFERENCES famrel_category(famrel_id) 
);   
  
INSERT INTO family_info(student_id, famsize_id, pstatus_id, guardian_id, famsup_id, famrel) 
SELECT student_temp2.student_id, famsize.famsize_id, pstatus.pstatus_id, guardian.guardian_id, famsup.famsup_id, famrel_category.famrel_id 
FROM student_temp2 
JOIN famsize 
ON student_temp2.famsize = famsize.famsize_abv 
JOIN pstatus 
ON student_temp2.pstatus = pstatus.pstatus_abv 
JOIN guardian 
ON student_temp2.guardian = guardian.guardian_type 
JOIN famsup 
ON student_temp2.famsup = famsup.famsup_ans 
JOIN famrel_category 
ON student_temp2.famrel = famrel_category.famrel_id; 
  
  
   
-- Social linking table
CREATE TABLE social (   
	student_id INTEGER, 
	activities TEXT,   
	freetime INTEGER,  
	goout INTEGER,  
	romantic TEXT, 
	walc INTEGER, 
	dalc INTEGER, 
	FOREIGN KEY (student_id) REFERENCES student(student_id), 
	FOREIGN KEY (freetime) REFERENCES alc_goout_freetime_category(category_id), 
	FOREIGN KEY (goout) REFERENCES alc_goout_freetime_category(category_id), 
	FOREIGN KEY (walc) REFERENCES alc_goout_freetime_category(category_id), 
	FOREIGN KEY (dalc) REFERENCES alc_goout_freetime_category(category_id) 
);   
  
-- Creating 4 temp tables to insert values into social table
CREATE TABLE student_freetime( 
	student_id INTEGER, 
	freetime INTEGER, 
	category_id INTEGER, 
	FOREIGN KEY (student_id) REFERENCES student_temp2(student_id), 
	FOREIGN KEY (category_id) REFERENCES alc_goout_freetime_category(category_id) 
); 
  
INSERT INTO student_freetime(student_id, freetime, category_id) 
SELECT student_temp2.student_id, student_temp2.freetime, alc_goout_freetime_category.category_id 
FROM student_temp2 
JOIN alc_goout_freetime_category 
ON student_temp2.freetime = alc_goout_freetime_category.category_id; 
  
CREATE TABLE student_goout( 
	student_id INTEGER, 
	goout INTEGER, 
	category_id INTEGER, 
	FOREIGN KEY (student_id) REFERENCES student_temp2(student_id), 
	FOREIGN KEY (category_id) REFERENCES alc_goout_freetime_category(category_id) 
); 
  
INSERT INTO student_goout(student_id, goout, category_id) 
SELECT student_temp2.student_id, student_temp2.goout, alc_goout_freetime_category.category_id 
FROM student_temp2 
JOIN alc_goout_freetime_category 
ON student_temp2.goout = alc_goout_freetime_category.category_id; 
  
CREATE TABLE student_walc( 
	student_id INTEGER, 
	walc INTEGER, 
	category_id INTEGER, 
	FOREIGN KEY (student_id) REFERENCES student_temp2(student_id), 
	FOREIGN KEY (category_id) REFERENCES alc_goout_freetime_category(category_id) 
); 
  
INSERT INTO student_walc(student_id, walc, category_id) 
SELECT student_temp2.student_id, student_temp2.walc, alc_goout_freetime_category.category_id 
FROM student_temp2 
JOIN alc_goout_freetime_category 
ON student_temp2.walc = alc_goout_freetime_category.category_id; 
  
CREATE TABLE student_dalc( 
	student_id INTEGER, 
	dalc INTEGER, 
	category_id INTEGER, 
	FOREIGN KEY (student_id) REFERENCES student_temp2(student_id), 
	FOREIGN KEY (category_id) REFERENCES alc_goout_freetime_category(category_id) 
); 
  
INSERT INTO student_dalc(student_id, dalc, category_id) 
SELECT student_temp2.student_id, student_temp2.dalc, alc_goout_freetime_category.category_id 
FROM student_temp2 
JOIN alc_goout_freetime_category 
ON student_temp2.dalc = alc_goout_freetime_category.category_id; 
  
   
-- Inserting values into social from temp tables
INSERT INTO social(student_id, activities, freetime, goout, romantic, walc, dalc)  
SELECT student.student_id, student_temp2.activities, student_freetime.category_id,  
	student_goout.category_id, student_temp2.romantic, student_walc.category_id, 
	student_dalc.category_id 
FROM student 
JOIN student_temp2 
ON student.student_id = student_temp2.student_id 
JOIN student_freetime 
ON student_temp2.student_id = student_freetime.student_id 
JOIN student_goout 
ON student_temp2.student_id = student_goout.student_id 
JOIN student_walc 
ON student_temp2.student_id = student_walc.student_id 
JOIN student_dalc 
ON student_temp2.student_id = student_dalc.student_id;   
  
   
-- School_info linking table
CREATE TABLE school_info (   
	student_id INTEGER,   
	school_id INTEGER,   
	schoolsup_id INTEGER,   
	reason_id INTEGER,  
	traveltime_id INTEGER,  
	FOREIGN KEY (student_id) REFERENCES student(student_id),   
	FOREIGN KEY (school_id) REFERENCES school(school_id),   
	FOREIGN KEY (schoolsup_id) REFERENCES schoolsup(schoolsup_id),   
	FOREIGN KEY (reason_id) REFERENCES reason(reason_id),   
	FOREIGN KEY (traveltime_id) REFERENCES traveltime(traveltime_id)  
); 
  
   
INSERT INTO school_info(student_id, school_id, schoolsup_id, reason_id, traveltime_id)  
SELECT student_temp2.student_id, school.school_id, schoolsup.schoolsup_id, reason.reason_id, traveltime.traveltime_id 
FROM student_temp2 
JOIN school 
ON student_temp2.school = school.school_abv  
JOIN schoolsup 
ON student_temp2.schoolsup = schoolsup.schoolsup_ans 
JOIN reason  
ON student_temp2.reason = reason.reason_ans 
JOIN traveltime 
ON student_temp2.traveltime = traveltime.traveltime_id; 
  
  
   
-- Grade_category mini table
CREATE TABLE grade_category ( 
	grade_type_id INTEGER PRIMARY KEY, 
	grade_type TEXT 
); 
  
INSERT INTO grade_category(grade_type_id, grade_type) 
VALUES ('1', 'G1'); 
  
INSERT INTO grade_category(grade_type_id, grade_type) 
VALUES ('2', 'G2'); 
  
INSERT INTO grade_category(grade_type_id, grade_type) 
VALUES ('3', 'G3'); 
  
  
 -- Creating student_grade linking table
CREATE TABLE student_grade ( 
	student_id INTEGER, 
	grade_type_id INTEGER, 
	grade_val INTEGER, 
	FOREIGN KEY (student_id) REFERENCES student(student_id), 
	FOREIGN KEY (grade_type_id) REFERENCES grade_category(grade_type_id) 
); 
  
  
INSERT INTO student_grade(student_id, grade_val) 
SELECT student_temp2.student_id, student_temp2.G1 
FROM student_temp2; 
  
UPDATE student_grade   
SET grade_type_id = '1'   
WHERE grade_type_id IS NULL;   
  
INSERT INTO student_grade(student_id, grade_val) 
SELECT student_temp2.student_id, student_temp2.G2 
FROM student_temp2; 
  
UPDATE student_grade   
SET grade_type_id = '2'   
WHERE grade_type_id IS NULL;   
  
INSERT INTO student_grade(student_id, grade_val) 
SELECT student_temp2.student_id, student_temp2.G3 
FROM student_temp2; 
  
UPDATE student_grade   
SET grade_type_id = '3'   
WHERE grade_type_id IS NULL;   
  
  
  
-- Step 6: Drop extra tables
-- drop student_temp, student_temp2, student_freetime, student_dalc, student_goout, student_walc 
DROP TABLE student_temp; 
  
DROP TABLE student_freetime; 
  
DROP TABLE student_dalc; 
  
DROP TABLE student_goout; 
  
DROP TABLE student_walc; 
  
DROP TABLE mom_info_temp; 
  
DROP TABLE dad_info_temp; 
  
DROP TABLE student_temp2; 
