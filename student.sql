/*
Script MySQL to create :
- testdb (a database)
- student_mat (table in testdb)
- student_por (table in testdb)
- student_meta (table in testdb, contain metadata associated to student_mat and sutdent_por)



Data taken from http://archive.ics.uci.edu/ml/

# Attributes for both student-mat.csv (Math course) and student-por.csv (Portuguese language course) datasets:
1 school - student's school (binary: "GP" - Gabriel Pereira or "MS" - Mousinho da Silveira)
2 sex - student's sex (binary: "F" - female or "M" - male)
3 age - student's age (numeric: from 15 to 22)
4 address - student's home address type (binary: "U" - urban or "R" - rural)
5 famsize - family size (binary: "LE3" - less or equal to 3 or "GT3" - greater than 3)
6 Pstatus - parent's cohabitation status (binary: "T" - living together or "A" - apart)
7 Medu - mother's education (numeric: 0 - none,  1 - primary education (4th grade), 2 � 5th to 9th grade, 3 � secondary education or 4 � higher education)
8 Fedu - father's education (numeric: 0 - none,  1 - primary education (4th grade), 2 � 5th to 9th grade, 3 � secondary education or 4 � higher education)
9 Mjob - mother's job (nominal: "teacher", "health" care related, civil "services" (e.g. administrative or police), "at_home" or "other")
10 Fjob - father's job (nominal: "teacher", "health" care related, civil "services" (e.g. administrative or police), "at_home" or "other")
11 reason - reason to choose this school (nominal: close to "home", school "reputation", "course" preference or "other")
12 guardian - student's guardian (nominal: "mother", "father" or "other")
13 traveltime - home to school travel time (numeric: 1 - <15 min., 2 - 15 to 30 min., 3 - 30 min. to 1 hour, or 4 - >1 hour)
14 studytime - weekly study time (numeric: 1 - <2 hours, 2 - 2 to 5 hours, 3 - 5 to 10 hours, or 4 - >10 hours)
15 failures - number of past class failures (numeric: n if 1<=n<3, else 4)
16 schoolsup - extra educational support (binary: yes or no)
17 famsup - family educational support (binary: yes or no)
18 paid - extra paid classes within the course subject (Math or Portuguese) (binary: yes or no)
19 activities - extra-curricular activities (binary: yes or no)
20 nursery - attended nursery school (binary: yes or no)
21 higher - wants to take higher education (binary: yes or no)
22 internet - Internet access at home (binary: yes or no)
23 romantic - with a romantic relationship (binary: yes or no)
24 famrel - quality of family relationships (numeric: from 1 - very bad to 5 - excellent)
25 freetime - free time after school (numeric: from 1 - very low to 5 - very high)
26 goout - going out with friends (numeric: from 1 - very low to 5 - very high)
27 Dalc - workday alcohol consumption (numeric: from 1 - very low to 5 - very high)
28 Walc - weekend alcohol consumption (numeric: from 1 - very low to 5 - very high)
29 health - current health status (numeric: from 1 - very bad to 5 - very good)
30 absences - number of school absences (numeric: from 0 to 93)

# these grades are related with the course subject, Math or Portuguese:
31 G1 - first period grade (numeric: from 0 to 20)
31 G2 - second period grade (numeric: from 0 to 20)
32 G3 - final grade (numeric: from 0 to 20, output target)
*/

DROP SCHEMA IF EXISTS testdb;
CREATE SCHEMA testdb;
USE testdb;
SET AUTOCOMMIT=0;

DROP TABLE IF EXISTS `student_meta`;
CREATE TABLE `student_meta`(
    `COLUMN_NAME` VARCHAR(50),
    `COLUMN_TYPE` ENUM('f','i','c','o') -- f for float i for int, c for cathegorical o for order class.
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;



INSERT INTO `student_meta` VALUES('school','c');
INSERT INTO `student_meta` VALUES('sex','c');
INSERT INTO `student_meta` VALUES('age','i');
INSERT INTO `student_meta` VALUES('address','c');
INSERT INTO `student_meta` VALUES('famsize','c');
INSERT INTO `student_meta` VALUES('Pstatus','c');
INSERT INTO `student_meta` VALUES('Medu','o');
INSERT INTO `student_meta` VALUES('Fedu','o');
INSERT INTO `student_meta` VALUES('Mjob','c');
INSERT INTO `student_meta` VALUES('Fjob','c');
INSERT INTO `student_meta` VALUES('reason','c');
INSERT INTO `student_meta` VALUES('guardian','c');
INSERT INTO `student_meta` VALUES('traveltime','c');
INSERT INTO `student_meta` VALUES('studytime','o');
INSERT INTO `student_meta` VALUES('failures','o');
INSERT INTO `student_meta` VALUES('schoolsup','c');
INSERT INTO `student_meta` VALUES('famsup','c');
INSERT INTO `student_meta` VALUES('paid','c');
INSERT INTO `student_meta` VALUES('activities','c');
INSERT INTO `student_meta` VALUES('nursery','c');
INSERT INTO `student_meta` VALUES('higher','c');
INSERT INTO `student_meta` VALUES('internet','c');
INSERT INTO `student_meta` VALUES('romantic','c');
INSERT INTO `student_meta` VALUES('famrel','o');
INSERT INTO `student_meta` VALUES('freetime','o');
INSERT INTO `student_meta` VALUES('goout','o');
INSERT INTO `student_meta` VALUES('Dalc','o');
INSERT INTO `student_meta` VALUES('Walc','o');
INSERT INTO `student_meta` VALUES('health','o');
INSERT INTO `student_meta` VALUES('absences','i');
INSERT INTO `student_meta` VALUES('G1','i');
INSERT INTO `student_meta` VALUES('G2','i');
INSERT INTO `student_meta` VALUES('G3','i');

COMMIT;



DROP TABLE IF EXISTS `student_mat`;



CREATE TABLE `student_mat` (
    `school` ENUM('GP','MS'),
    `sex` ENUM('M', 'F'),
    `age` INT(3),
    `address` ENUM('U','R'),
    `famsize` VARCHAR(10),
    `Pstatus` ENUM('T','A'),
    `Medu` INT(2),
    `Fedu` INT(2),
    `Mjob` VARCHAR(10),
    `Fjob` VARCHAR(10),
    `reason` VARCHAR(10),
    `guardian` ENUM('father','mother','other'),
    `traveltime` INT(1),
    `studytime` INT(1),
    `failures` INT(1),
    `schoolsup` ENUM('yes','no'),
    `famsup` ENUM('yes','no'),
    `paid` ENUM('yes','no'),
    `activities` ENUM('yes','no'),
    `nursery` ENUM('yes','no'),
    `higher` ENUM('yes','no'),
    `internet` ENUM('yes','no'),
    `romantic` ENUM('yes','no'),
    `famrel` INT(1),
    `freetime` INT(1),
    `goout` INT(1),
    `Dalc` INT(1),
    `Walc` INT(1),
    `health` INT(1),
    `absences` INT(2),
    `G1` INT(2),
    `G2` INT(2),
    `G3` INT(2)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;



INSERT INTO `student_mat` VALUES('GP','F',18,'U','GT3','A',4,4,'at_home','teacher','course','mother',2,2,0,'yes','no','no','no','yes','yes','no','no',4,3,4,1,1,3,6,'5','6',6);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',1,1,'at_home','other','course','father',1,2,0,'no','yes','no','no','no','yes','yes','no',5,3,3,1,1,3,4,'5','5',6);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','LE3','T',1,1,'at_home','other','other','mother',1,2,3,'yes','no','yes','no','yes','yes','yes','no',4,3,2,2,3,3,10,'7','8',10);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',4,2,'health','services','home','mother',1,3,0,'no','yes','yes','yes','yes','yes','yes','yes',3,2,2,1,1,5,2,'15','14',15);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',3,3,'other','other','home','father',1,2,0,'no','yes','yes','no','yes','yes','no','no',4,3,2,1,2,5,4,'6','10',10);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','LE3','T',4,3,'services','other','reputation','mother',1,2,0,'no','yes','yes','yes','yes','yes','yes','no',5,4,2,1,2,5,10,'15','15',15);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','LE3','T',2,2,'other','other','home','mother',1,2,0,'no','no','no','no','yes','yes','yes','no',4,4,4,1,1,3,0,'12','12',11);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','A',4,4,'other','teacher','home','mother',2,2,0,'yes','yes','no','no','yes','yes','no','no',4,1,4,1,1,1,6,'6','5',6);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','LE3','A',3,2,'services','other','home','mother',1,2,0,'no','yes','yes','no','yes','yes','yes','no',4,2,2,1,1,1,0,'16','18',19);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',3,4,'other','other','home','mother',1,2,0,'no','yes','yes','yes','yes','yes','yes','no',5,5,1,1,1,5,0,'14','15',15);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',4,4,'teacher','health','reputation','mother',1,2,0,'no','yes','yes','no','yes','yes','yes','no',3,3,3,1,2,2,0,'10','8',9);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',2,1,'services','other','reputation','father',3,3,0,'no','yes','no','yes','yes','yes','yes','no',5,2,2,1,1,4,4,'10','12',12);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','LE3','T',4,4,'health','services','course','father',1,1,0,'no','yes','yes','yes','yes','yes','yes','no',4,3,3,1,3,5,2,'14','14',14);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',4,3,'teacher','other','course','mother',2,2,0,'no','yes','yes','no','yes','yes','yes','no',5,4,3,1,2,3,2,'10','10',11);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','A',2,2,'other','other','home','other',1,3,0,'no','yes','no','no','yes','yes','yes','yes',4,5,2,1,1,3,0,'14','16',16);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',4,4,'health','other','home','mother',1,1,0,'no','yes','no','no','yes','yes','yes','no',4,4,4,1,2,2,4,'14','14',14);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',4,4,'services','services','reputation','mother',1,3,0,'no','yes','yes','yes','yes','yes','yes','no',3,2,3,1,2,2,6,'13','14',14);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',3,3,'other','other','reputation','mother',3,2,0,'yes','yes','no','yes','yes','yes','no','no',5,3,2,1,1,4,4,'8','10',10);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','GT3','T',3,2,'services','services','course','mother',1,1,3,'no','yes','no','yes','yes','yes','yes','no',5,5,5,2,4,5,16,'6','5',5);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','LE3','T',4,3,'health','other','home','father',1,1,0,'no','no','yes','yes','yes','yes','yes','no',3,1,3,1,3,5,4,'8','10',10);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',4,3,'teacher','other','reputation','mother',1,2,0,'no','no','no','no','yes','yes','yes','no',4,4,1,1,1,1,0,'13','14',15);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',4,4,'health','health','other','father',1,1,0,'no','yes','yes','no','yes','yes','yes','no',5,4,2,1,1,5,0,'12','15',15);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','LE3','T',4,2,'teacher','other','course','mother',1,2,0,'no','no','no','yes','yes','yes','yes','no',4,5,1,1,3,5,2,'15','15',16);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','LE3','T',2,2,'other','other','reputation','mother',2,2,0,'no','yes','no','yes','yes','yes','yes','no',5,4,4,2,4,5,0,'13','13',12);
INSERT INTO `student_mat` VALUES('GP','F',15,'R','GT3','T',2,4,'services','health','course','mother',1,3,0,'yes','yes','yes','yes','yes','yes','yes','no',4,3,2,1,1,5,2,'10','9',8);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',2,2,'services','services','home','mother',1,1,2,'no','yes','yes','no','no','yes','yes','no',1,2,2,1,3,5,14,'6','9',8);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',2,2,'other','other','home','mother',1,1,0,'no','yes','yes','no','yes','yes','yes','no',4,2,2,1,2,5,2,'12','12',11);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',4,2,'health','services','other','mother',1,1,0,'no','no','yes','no','yes','yes','yes','no',2,2,4,2,4,1,4,'15','16',15);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','LE3','A',3,4,'services','other','home','mother',1,2,0,'yes','yes','no','yes','yes','yes','yes','no',5,3,3,1,1,5,4,'11','11',11);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',4,4,'teacher','teacher','home','mother',1,2,0,'no','yes','yes','yes','yes','yes','yes','yes',4,4,5,5,5,5,16,'10','12',11);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',4,4,'health','services','home','mother',1,2,0,'no','yes','yes','no','no','yes','yes','no',5,4,2,3,4,5,0,'9','11',12);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',4,4,'services','services','reputation','mother',2,2,0,'no','yes','no','yes','yes','yes','yes','no',4,3,1,1,1,5,0,'17','16',17);
INSERT INTO `student_mat` VALUES('GP','M',15,'R','GT3','T',4,3,'teacher','at_home','course','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','yes',4,5,2,1,1,5,0,'17','16',16);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','LE3','T',3,3,'other','other','course','mother',1,2,0,'no','no','no','yes','no','yes','yes','no',5,3,2,1,1,2,0,'8','10',12);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',3,2,'other','other','home','mother',1,1,0,'no','yes','yes','no','no','yes','yes','no',5,4,3,1,1,5,0,'12','14',15);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',2,3,'other','other','other','father',2,1,0,'no','yes','no','yes','yes','yes','no','no',3,5,1,1,1,5,0,'8','7',6);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','LE3','T',4,3,'teacher','services','home','mother',1,3,0,'no','yes','no','yes','yes','yes','yes','no',5,4,3,1,1,4,2,'15','16',18);
INSERT INTO `student_mat` VALUES('GP','M',16,'R','GT3','A',4,4,'other','teacher','reputation','mother',2,3,0,'no','yes','no','yes','yes','yes','yes','yes',2,4,3,1,1,5,7,'15','16',15);
INSERT INTO `student_mat` VALUES('GP','F',15,'R','GT3','T',3,4,'services','health','course','mother',1,3,0,'yes','yes','yes','yes','yes','yes','yes','no',4,3,2,1,1,5,2,'12','12',11);
INSERT INTO `student_mat` VALUES('GP','F',15,'R','GT3','T',2,2,'at_home','other','reputation','mother',1,1,0,'yes','yes','yes','yes','yes','yes','no','no',4,3,1,1,1,2,8,'14','13',13);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','LE3','T',2,2,'other','other','home','mother',2,2,1,'no','yes','no','yes','no','yes','yes','yes',3,3,3,1,2,3,25,'7','10',11);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','LE3','T',4,4,'teacher','other','home','other',1,1,0,'no','yes','no','no','no','yes','yes','yes',5,4,3,2,4,5,8,'12','12',12);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',4,4,'services','teacher','course','father',1,2,0,'no','yes','no','yes','yes','yes','yes','no',4,3,3,1,1,5,2,'19','18',18);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',2,2,'services','services','course','father',1,1,0,'yes','yes','no','no','yes','yes','yes','no',5,4,1,1,1,1,0,'8','8',11);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','LE3','T',2,2,'other','at_home','course','father',2,2,1,'yes','no','no','yes','yes','yes','yes','no',4,3,3,2,2,5,14,'10','10',9);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','LE3','A',4,3,'other','other','course','mother',1,2,0,'yes','yes','yes','yes','yes','yes','yes','yes',5,2,2,1,1,5,8,'8','8',6);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','LE3','A',3,3,'other','services','home','mother',1,2,0,'no','yes','no','no','yes','yes','yes','no',2,3,5,1,4,3,12,'11','12',11);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',4,3,'health','services','reputation','mother',1,4,0,'no','no','no','yes','yes','yes','yes','no',4,2,2,1,1,2,4,'19','19',20);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',4,2,'teacher','other','home','mother',1,2,0,'no','yes','yes','no','yes','yes','no','no',4,3,3,2,2,5,2,'15','15',14);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',4,4,'services','teacher','other','father',1,2,1,'yes','yes','no','yes','no','yes','yes','no',4,4,4,1,1,3,2,'7','7',7);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','LE3','T',2,2,'services','services','course','mother',3,2,0,'no','yes','yes','no','yes','yes','yes','no',4,3,3,2,3,4,2,'12','13',13);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','LE3','T',4,2,'health','other','other','mother',1,2,0,'no','yes','yes','no','yes','yes','yes','no',4,3,3,1,1,5,2,'11','13',13);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','LE3','A',4,2,'health','health','other','father',2,1,1,'no','no','no','no','yes','yes','no','no',5,5,5,3,4,5,6,'11','11',10);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',4,4,'services','services','course','mother',1,1,0,'yes','yes','yes','no','yes','yes','yes','no',3,3,4,2,3,5,0,'8','10',11);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','LE3','A',3,3,'other','other','other','mother',1,1,0,'no','no','yes','no','yes','yes','yes','no',5,3,4,4,4,1,6,'10','13',13);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','A',2,1,'other','other','other','mother',1,2,0,'no','no','yes','yes','yes','yes','yes','yes',5,3,4,1,1,2,8,'8','9',10);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','A',4,3,'services','services','reputation','mother',1,2,0,'no','yes','yes','yes','yes','yes','yes','no',4,3,2,1,1,1,0,'14','15',15);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',4,4,'teacher','health','reputation','mother',1,2,0,'no','yes','no','yes','yes','yes','no','no',3,2,2,1,1,5,4,'14','15',15);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','LE3','T',1,2,'other','at_home','home','father',1,2,0,'yes','yes','no','yes','yes','yes','yes','no',4,3,2,1,1,5,2,'9','10',9);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',4,2,'services','other','course','mother',1,2,0,'no','yes','no','no','yes','yes','yes','no',4,2,3,1,1,5,2,'15','16',16);
INSERT INTO `student_mat` VALUES('GP','F',16,'R','GT3','T',4,4,'health','teacher','other','mother',1,2,0,'no','yes','no','yes','yes','yes','no','no',2,4,4,2,3,4,6,'10','11',11);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',1,1,'services','services','course','father',4,1,0,'yes','yes','no','yes','no','yes','yes','yes',5,5,5,5,5,5,6,'10','8',11);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','LE3','T',1,2,'other','services','reputation','father',1,2,0,'yes','no','no','yes','yes','yes','yes','no',4,4,3,1,1,1,4,'8','10',9);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',4,3,'teacher','health','home','mother',1,3,0,'yes','yes','yes','yes','yes','yes','yes','no',3,4,4,2,4,4,2,'10','9',9);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','LE3','T',4,3,'services','services','reputation','father',1,2,0,'yes','no','no','yes','yes','yes','yes','yes',4,4,4,2,4,2,0,'10','10',10);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','LE3','T',4,3,'teacher','services','course','mother',3,2,0,'no','yes','no','yes','yes','yes','yes','no',5,4,3,1,2,1,2,'16','15',15);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','A',4,4,'other','services','reputation','mother',1,4,0,'no','yes','no','yes','no','yes','yes','yes',1,3,3,5,5,3,4,'13','13',12);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',3,1,'services','other','course','mother',1,4,0,'yes','yes','yes','no','yes','yes','yes','no',4,3,3,1,2,5,4,'7','7',6);
INSERT INTO `student_mat` VALUES('GP','F',15,'R','LE3','T',2,2,'health','services','reputation','mother',2,2,0,'yes','yes','yes','no','yes','yes','yes','no',4,1,3,1,3,4,2,'8','9',8);
INSERT INTO `student_mat` VALUES('GP','F',15,'R','LE3','T',3,1,'other','other','reputation','father',2,4,0,'no','yes','no','no','no','yes','yes','no',4,4,2,2,3,3,12,'16','16',16);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',3,1,'other','other','reputation','father',2,4,0,'no','yes','yes','no','yes','yes','yes','no',4,3,2,1,1,5,0,'13','15',15);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',4,2,'other','other','course','mother',1,4,0,'no','no','no','no','yes','yes','yes','no',3,3,3,1,1,3,0,'10','10',10);
INSERT INTO `student_mat` VALUES('GP','F',15,'R','GT3','T',1,1,'other','other','reputation','mother',1,2,2,'yes','yes','no','no','no','yes','yes','yes',3,3,4,2,4,5,2,'8','6',5);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',3,1,'other','other','reputation','mother',1,1,0,'no','no','no','yes','yes','yes','no','no',5,3,2,2,2,5,2,'12','12',14);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',3,3,'other','services','home','mother',1,2,0,'yes','yes','yes','yes','yes','yes','yes','no',4,3,3,2,4,5,54,'11','12',11);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',4,3,'teacher','other','home','mother',1,2,0,'no','yes','yes','yes','yes','yes','yes','no',4,3,3,2,3,5,6,'9','9',10);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',4,0,'teacher','other','course','mother',2,4,0,'no','no','no','yes','yes','yes','yes','no',3,4,3,1,1,1,8,'11','11',10);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',2,2,'other','other','reputation','mother',1,4,0,'no','no','yes','no','yes','yes','yes','yes',5,2,3,1,3,3,0,'11','11',11);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','GT3','T',2,1,'other','other','home','mother',2,1,3,'yes','yes','no','yes','yes','no','yes','no',4,5,1,1,1,3,2,'8','8',10);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',3,4,'at_home','other','course','mother',1,2,0,'no','yes','no','no','yes','yes','yes','no',2,4,3,1,2,3,12,'5','5',5);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',2,3,'other','services','course','father',1,1,0,'yes','yes','yes','yes','no','yes','yes','yes',3,2,2,1,3,3,2,'10','12',12);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',2,3,'other','other','home','mother',1,3,0,'yes','no','yes','no','no','yes','yes','no',5,3,2,1,2,5,4,'11','10',11);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','LE3','T',3,2,'services','other','reputation','mother',1,2,0,'no','yes','yes','no','yes','yes','yes','no',4,4,4,1,1,5,10,'7','6',6);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','LE3','T',2,2,'services','services','home','mother',2,2,0,'no','no','yes','yes','yes','yes','yes','no',5,3,3,1,3,4,4,'15','15',15);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',1,1,'other','other','home','father',1,2,0,'no','yes','no','yes','no','yes','yes','no',4,3,2,2,3,4,2,'9','10',10);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',4,4,'services','services','reputation','father',2,2,2,'no','no','yes','no','yes','yes','yes','yes',4,4,4,2,3,5,6,'7','9',8);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','LE3','T',2,2,'at_home','other','course','mother',1,2,0,'no','yes','no','no','yes','yes','no','no',4,3,4,1,2,2,4,'8','7',6);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',4,2,'other','other','reputation','mother',1,3,0,'no','yes','no','yes','yes','yes','yes','no',5,3,3,1,3,1,4,'13','14',14);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',2,2,'services','other','reputation','father',2,2,1,'no','no','yes','yes','no','yes','yes','no',4,4,2,1,1,3,12,'11','10',10);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','LE3','A',4,4,'teacher','health','reputation','mother',1,2,0,'no','yes','no','no','yes','yes','no','no',4,1,3,3,5,5,18,'8','6',7);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',3,3,'other','other','home','mother',1,3,0,'no','yes','yes','no','yes','yes','yes','yes',4,3,3,1,3,4,0,'7','7',8);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',4,3,'services','other','reputation','mother',1,1,0,'no','no','yes','yes','yes','yes','yes','no',4,5,5,1,3,1,4,'16','17',18);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','LE3','T',3,1,'other','other','home','father',1,2,0,'yes','yes','no','no','yes','yes','no','no',3,3,3,2,3,2,4,'7','6',6);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',4,2,'teacher','services','home','mother',2,2,0,'no','yes','yes','yes','yes','yes','yes','no',5,3,3,1,1,1,0,'11','10',10);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','LE3','T',2,2,'services','health','reputation','mother',1,4,0,'no','yes','no','yes','yes','yes','yes','no',4,3,4,1,1,4,6,'11','13',14);
INSERT INTO `student_mat` VALUES('GP','F',15,'R','GT3','T',1,1,'at_home','other','home','mother',2,4,1,'yes','yes','yes','yes','yes','yes','yes','no',3,1,2,1,1,1,2,'7','10',10);
INSERT INTO `student_mat` VALUES('GP','M',16,'R','GT3','T',4,3,'services','other','reputation','mother',2,1,0,'yes','yes','no','yes','no','yes','yes','no',3,3,3,1,1,4,2,'11','15',15);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',2,1,'other','other','course','mother',1,2,0,'no','yes','yes','no','yes','yes','no','yes',4,3,5,1,1,5,2,'8','9',10);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',4,4,'other','other','reputation','mother',1,1,0,'no','no','no','yes','no','yes','yes','no',5,3,4,1,2,1,6,'11','14',14);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',4,3,'other','at_home','course','mother',1,3,0,'yes','yes','yes','no','yes','yes','yes','no',5,3,5,1,1,3,0,'7','9',8);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',4,4,'services','services','other','mother',1,1,0,'yes','yes','yes','yes','yes','yes','yes','no',4,5,5,5,5,4,14,'7','7',5);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',4,4,'services','teacher','other','father',1,3,0,'no','yes','no','yes','yes','yes','yes','yes',4,4,3,1,1,4,0,'16','17',17);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',4,4,'services','other','course','mother',1,1,0,'no','yes','no','yes','no','yes','yes','no',5,3,3,1,1,5,4,'10','13',14);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',3,2,'services','other','home','mother',2,2,0,'yes','yes','yes','no','yes','yes','yes','no',4,3,5,1,1,2,26,'7','6',6);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','A',3,4,'services','other','course','mother',1,2,0,'no','yes','yes','yes','yes','yes','yes','no',5,4,4,1,1,1,0,'16','18',18);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','A',3,3,'other','health','reputation','father',1,4,0,'yes','no','no','no','yes','yes','no','no',4,3,3,1,1,4,10,'10','11',11);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',2,2,'other','other','course','mother',1,4,0,'yes','yes','yes','no','yes','yes','yes','no',5,1,2,1,1,3,8,'7','8',8);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',3,3,'services','other','home','father',1,3,0,'no','yes','no','yes','yes','yes','yes','no',5,3,3,1,1,5,2,'16','18',18);
INSERT INTO `student_mat` VALUES('GP','M',15,'R','GT3','T',4,4,'other','other','home','father',4,4,0,'no','yes','yes','yes','yes','yes','yes','yes',1,3,5,3,5,1,6,'10','13',13);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','LE3','T',4,4,'health','health','other','mother',1,3,0,'no','yes','yes','yes','yes','yes','yes','yes',5,4,5,1,1,4,4,'14','15',16);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','LE3','A',4,4,'teacher','teacher','course','mother',1,1,0,'no','no','no','yes','yes','yes','yes','no',5,5,3,1,1,4,6,'18','19',19);
INSERT INTO `student_mat` VALUES('GP','F',16,'R','GT3','T',3,3,'services','other','reputation','father',1,3,1,'yes','yes','no','yes','yes','yes','yes','no',4,1,2,1,1,2,0,'7','10',10);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',2,2,'at_home','other','home','mother',1,2,1,'yes','no','no','yes','yes','yes','yes','no',3,1,2,1,1,5,6,'10','13',13);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','LE3','T',4,2,'teacher','other','course','mother',1,1,0,'no','no','no','no','yes','yes','yes','no',3,5,2,1,1,3,10,'18','19',19);
INSERT INTO `student_mat` VALUES('GP','M',15,'R','GT3','T',2,1,'health','services','reputation','mother',1,2,0,'no','no','no','yes','yes','yes','yes','yes',5,4,2,1,1,5,8,'9','9',9);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',4,4,'teacher','teacher','course','father',1,2,0,'no','yes','no','yes','yes','yes','yes','no',5,4,4,1,2,5,2,'15','15',16);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',4,4,'other','teacher','reputation','father',2,2,0,'no','yes','no','yes','yes','yes','no','no',4,4,3,1,1,2,2,'11','13',14);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',3,3,'other','services','home','father',2,1,0,'no','no','no','yes','yes','yes','yes','no',5,4,2,1,1,5,0,'13','14',13);
INSERT INTO `student_mat` VALUES('GP','M',17,'R','GT3','T',1,3,'other','other','course','father',3,2,1,'no','yes','no','yes','yes','yes','yes','no',5,2,4,1,4,5,20,'9','7',8);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',3,4,'other','other','reputation','father',1,1,0,'no','no','no','no','yes','yes','yes','no',3,4,3,1,2,4,6,'14','13',13);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',1,2,'at_home','services','course','mother',1,2,0,'no','no','no','no','no','yes','yes','no',3,2,3,1,2,1,2,'16','15',15);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',2,2,'services','services','home','father',1,4,0,'no','yes','yes','yes','yes','yes','yes','no',5,5,4,1,2,5,6,'16','14',15);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','LE3','T',2,4,'other','health','course','father',2,2,0,'no','yes','yes','yes','yes','yes','yes','yes',4,2,2,1,2,5,2,'13','13',13);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',4,4,'health','other','course','mother',1,1,0,'no','yes','no','yes','yes','yes','yes','no',3,4,4,1,4,5,18,'14','11',13);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',2,2,'other','other','home','mother',1,2,0,'no','no','yes','no','yes','yes','yes','yes',5,4,4,1,1,5,0,'8','7',8);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',3,4,'services','services','home','father',1,1,0,'yes','no','no','no','yes','yes','yes','no',5,5,5,3,2,5,0,'13','13',12);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','LE3','A',3,4,'other','other','home','mother',1,2,0,'yes','no','no','yes','yes','yes','yes','yes',5,3,2,1,1,1,0,'7','10',11);
INSERT INTO `student_mat` VALUES('GP','F',19,'U','GT3','T',0,1,'at_home','other','course','other',1,2,3,'no','yes','no','no','no','no','no','no',3,4,2,1,1,5,2,'7','8',9);
INSERT INTO `student_mat` VALUES('GP','M',18,'R','GT3','T',2,2,'services','other','reputation','mother',1,1,2,'no','yes','no','yes','yes','yes','yes','no',3,3,3,1,2,4,0,'7','4',0);
INSERT INTO `student_mat` VALUES('GP','M',16,'R','GT3','T',4,4,'teacher','teacher','course','mother',1,1,0,'no','no','yes','yes','yes','yes','yes','no',3,5,5,2,5,4,8,'18','18',18);
INSERT INTO `student_mat` VALUES('GP','F',15,'R','GT3','T',3,4,'services','teacher','course','father',2,3,2,'no','yes','no','no','yes','yes','yes','yes',4,2,2,2,2,5,0,'12','0',0);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',1,1,'at_home','other','course','mother',3,1,0,'no','yes','no','yes','no','yes','yes','yes',4,3,3,1,2,4,0,'8','0',0);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','LE3','T',2,2,'other','other','course','father',1,1,0,'no','yes','no','no','yes','yes','yes','yes',3,4,4,1,3,5,12,'10','13',12);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','A',3,4,'services','other','course','father',1,1,0,'no','no','no','no','yes','yes','yes','no',3,2,1,1,4,5,16,'12','11',11);
INSERT INTO `student_mat` VALUES('GP','M',15,'R','GT3','T',3,4,'at_home','teacher','course','mother',4,2,0,'no','yes','no','no','yes','yes','no','yes',5,3,3,1,1,5,0,'9','0',0);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',4,4,'services','at_home','course','mother',1,3,0,'no','yes','no','yes','yes','yes','yes','yes',4,3,3,1,1,5,0,'11','0',0);
INSERT INTO `student_mat` VALUES('GP','M',17,'R','GT3','T',3,4,'at_home','other','course','mother',3,2,0,'no','no','no','no','yes','yes','no','no',5,4,5,2,4,5,0,'10','0',0);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','A',3,3,'other','other','course','other',2,1,2,'no','yes','no','yes','no','yes','yes','yes',4,3,2,1,1,5,0,'4','0',0);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','LE3','T',1,1,'services','other','course','mother',1,2,1,'no','no','no','no','yes','yes','no','yes',4,4,4,1,3,5,0,'14','12',12);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',4,4,'teacher','teacher','course','mother',2,1,0,'no','no','no','yes','yes','yes','yes','no',4,3,2,1,1,5,0,'16','16',15);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','GT3','T',4,3,'teacher','services','course','father',2,4,0,'yes','yes','no','no','yes','yes','yes','no',2,2,2,1,1,3,0,'7','9',0);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','LE3','T',2,2,'services','services','reputation','father',2,1,2,'no','yes','no','yes','yes','yes','yes','no',2,3,3,2,2,2,8,'9','9',9);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',4,4,'teacher','services','course','mother',1,3,0,'no','yes','yes','yes','yes','yes','yes','no',4,2,2,1,1,5,2,'9','11',11);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','LE3','T',1,1,'at_home','at_home','course','mother',1,1,0,'no','no','no','no','yes','yes','yes','no',3,4,4,3,3,1,2,'14','14',13);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','GT3','T',2,1,'other','other','home','mother',1,1,3,'no','yes','no','no','yes','yes','yes','no',5,4,5,1,2,5,0,'5','0',0);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',1,1,'other','services','course','father',1,2,0,'no','yes','yes','no','yes','yes','yes','no',4,4,2,1,2,5,0,'8','11',11);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',3,2,'health','services','home','father',1,2,3,'no','yes','no','no','yes','yes','yes','no',3,3,2,1,1,3,0,'6','7',0);
INSERT INTO `student_mat` VALUES('GP','F',15,'U','GT3','T',1,2,'at_home','other','course','mother',1,2,0,'no','yes','yes','no','no','yes','yes','no',4,3,2,1,1,5,2,'10','11',11);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',4,4,'teacher','teacher','course','mother',1,1,0,'no','yes','no','no','yes','no','yes','yes',3,3,2,2,1,5,0,'7','6',0);
INSERT INTO `student_mat` VALUES('GP','M',15,'U','LE3','A',2,1,'services','other','course','mother',4,1,3,'no','no','no','no','yes','yes','yes','no',4,5,5,2,5,5,0,'8','9',10);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','LE3','T',1,1,'other','other','course','mother',1,1,3,'no','no','no','no','yes','no','yes','yes',2,3,5,2,5,4,0,'6','5',0);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','LE3','T',2,1,'at_home','other','course','mother',1,1,1,'no','no','no','yes','yes','yes','no','yes',4,4,4,3,5,5,6,'12','13',14);
INSERT INTO `student_mat` VALUES('GP','F',15,'R','GT3','T',3,3,'services','services','reputation','other',2,3,2,'no','yes','yes','yes','yes','yes','yes','yes',4,2,1,2,3,3,8,'10','10',10);
INSERT INTO `student_mat` VALUES('GP','M',19,'U','GT3','T',3,2,'services','at_home','home','mother',1,1,3,'no','yes','no','no','yes','no','yes','yes',4,5,4,1,1,4,0,'5','0',0);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',4,4,'other','teacher','course','mother',1,1,0,'yes','yes','no','no','yes','yes','no','yes',4,2,1,1,1,4,0,'11','11',12);
INSERT INTO `student_mat` VALUES('GP','M',15,'R','GT3','T',2,3,'at_home','services','course','mother',1,2,0,'yes','no','yes','yes','yes','yes','no','no',4,4,4,1,1,1,2,'11','8',8);
INSERT INTO `student_mat` VALUES('GP','M',17,'R','LE3','T',1,2,'other','other','reputation','mother',1,1,0,'no','no','no','no','yes','yes','no','no',2,2,2,3,3,5,8,'16','12',13);
INSERT INTO `student_mat` VALUES('GP','F',18,'R','GT3','T',1,1,'at_home','other','course','mother',3,1,3,'no','yes','no','yes','no','yes','no','no',5,2,5,1,5,4,6,'9','8',10);
INSERT INTO `student_mat` VALUES('GP','M',16,'R','GT3','T',2,2,'at_home','other','course','mother',3,1,0,'no','no','no','no','no','yes','no','no',4,2,2,1,2,3,2,'17','15',15);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',3,3,'other','services','course','father',1,2,1,'no','yes','yes','no','yes','yes','yes','yes',4,5,5,4,4,5,4,'10','12',12);
INSERT INTO `student_mat` VALUES('GP','M',17,'R','LE3','T',2,1,'at_home','other','course','mother',2,1,2,'no','no','no','yes','yes','no','yes','yes',3,3,2,2,2,5,0,'7','6',0);
INSERT INTO `student_mat` VALUES('GP','M',15,'R','GT3','T',3,2,'other','other','course','mother',2,2,2,'yes','yes','no','no','yes','yes','yes','yes',4,4,4,1,4,3,6,'5','9',7);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','LE3','T',1,2,'other','other','course','mother',2,1,1,'no','no','no','yes','yes','yes','no','no',4,4,4,2,4,5,0,'7','0',0);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','GT3','T',1,3,'at_home','services','course','father',1,1,0,'no','no','no','no','yes','no','yes','no',5,3,3,1,4,2,2,'10','10',10);
INSERT INTO `student_mat` VALUES('GP','M',17,'R','LE3','T',1,1,'other','services','course','mother',4,2,3,'no','no','no','yes','yes','no','no','yes',5,3,5,1,5,5,0,'5','8',7);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',3,2,'services','services','course','mother',2,1,1,'no','yes','no','yes','no','no','no','no',4,5,2,1,1,2,16,'12','11',12);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',2,2,'other','other','course','father',1,2,0,'no','no','no','no','yes','no','yes','no',4,3,5,2,4,4,4,'10','10',10);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',4,2,'health','services','home','father',1,2,0,'no','no','yes','no','yes','yes','yes','yes',4,2,3,1,1,3,0,'14','15',16);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',2,2,'other','other','home','mother',1,2,0,'no','yes','yes','no','no','yes','yes','no',5,1,5,1,1,4,0,'6','7',0);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',4,4,'health','health','reputation','mother',1,2,0,'no','yes','yes','no','yes','yes','yes','yes',4,4,2,1,1,3,0,'14','14',14);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',3,4,'other','other','course','father',3,1,2,'no','yes','no','yes','no','yes','yes','no',3,4,5,2,4,2,0,'6','5',0);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',1,0,'other','other','reputation','mother',2,2,0,'no','yes','yes','yes','yes','yes','yes','yes',4,3,2,1,1,3,2,'13','15',16);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','LE3','T',4,4,'teacher','other','reputation','mother',1,2,0,'no','yes','yes','yes','yes','yes','yes','no',4,4,4,1,3,5,0,'13','11',10);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',1,3,'at_home','services','home','mother',1,2,3,'no','no','no','yes','no','yes','yes','yes',4,3,5,1,1,3,0,'8','7',0);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','LE3','T',3,3,'other','other','reputation','mother',2,2,0,'no','yes','yes','yes','yes','yes','yes','no',4,4,5,1,1,4,4,'10','11',9);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','LE3','T',4,3,'teacher','other','course','mother',2,2,0,'no','no','yes','yes','yes','yes','yes','no',4,4,4,4,4,4,4,'10','9',9);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',2,2,'services','other','reputation','mother',2,2,0,'no','no','yes','yes','no','yes','yes','no',3,4,4,1,4,5,2,'13','13',11);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','GT3','T',3,3,'other','other','reputation','father',1,2,0,'no','no','no','yes','no','yes','yes','no',4,3,4,1,4,4,4,'6','5',6);
INSERT INTO `student_mat` VALUES('GP','M',16,'R','GT3','T',4,2,'teacher','services','other','mother',1,1,0,'no','yes','no','yes','yes','yes','yes','yes',4,3,3,3,4,3,10,'10','8',9);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','GT3','T',4,3,'other','other','course','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','yes',5,2,3,1,1,2,4,'10','10',11);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',4,3,'teacher','other','home','mother',1,2,0,'no','yes','yes','yes','yes','yes','yes','no',3,4,3,2,3,3,10,'9','8',8);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',3,3,'services','other','home','mother',1,2,0,'no','no','yes','yes','yes','yes','yes','yes',4,2,3,1,2,3,2,'12','13',12);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',2,4,'services','services','reputation','father',1,2,0,'no','yes','no','yes','yes','yes','no','no',5,4,2,2,3,5,0,'16','17',17);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','LE3','T',3,3,'other','other','reputation','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','yes',5,3,3,2,3,1,56,'9','9',8);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',3,2,'other','other','reputation','mother',1,2,0,'no','yes','yes','no','yes','yes','yes','no',1,2,2,1,2,1,14,'12','13',12);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','GT3','T',3,3,'services','services','other','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','yes',4,3,4,2,3,4,12,'12','12',11);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',1,2,'services','services','other','mother',1,1,0,'no','yes','yes','yes','yes','yes','yes','yes',3,3,3,1,2,3,2,'11','12',11);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','LE3','T',2,1,'other','other','course','mother',1,2,0,'no','no','yes','yes','yes','yes','yes','yes',4,2,3,1,2,5,0,'15','15',15);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','A',3,3,'health','other','reputation','mother',1,2,0,'no','yes','no','no','no','yes','yes','yes',3,3,3,1,3,3,6,'8','7',9);
INSERT INTO `student_mat` VALUES('GP','M',17,'R','GT3','T',1,2,'at_home','other','home','mother',1,2,0,'no','no','no','no','yes','yes','no','no',3,1,3,1,5,3,4,'8','9',10);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',2,3,'services','services','course','mother',1,2,0,'no','no','no','no','yes','yes','yes','no',4,3,3,1,1,2,10,'11','12',13);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',1,1,'at_home','services','course','mother',1,2,0,'no','no','no','yes','yes','yes','yes','no',5,3,3,1,1,3,0,'8','8',9);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','GT3','T',1,2,'at_home','services','other','other',2,2,0,'no','no','yes','yes','no','yes','yes','no',4,4,4,4,5,5,12,'7','8',8);
INSERT INTO `student_mat` VALUES('GP','M',16,'R','GT3','T',3,3,'services','services','reputation','mother',1,1,0,'no','yes','no','yes','yes','yes','yes','no',4,3,2,3,4,5,8,'8','9',10);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',2,3,'other','other','home','father',2,1,0,'no','no','no','no','yes','yes','yes','no',5,3,3,1,1,3,0,'13','14',14);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','LE3','T',2,4,'services','services','course','father',1,2,0,'no','no','no','yes','yes','yes','yes','yes',4,3,2,1,1,5,0,'14','15',15);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','GT3','T',4,4,'services','teacher','home','mother',1,1,0,'no','no','no','no','yes','yes','yes','no',5,2,3,1,2,5,4,'17','15',16);
INSERT INTO `student_mat` VALUES('GP','M',16,'R','LE3','T',3,3,'teacher','other','home','father',3,1,0,'no','yes','yes','yes','yes','yes','yes','no',3,3,4,3,5,3,8,'9','9',10);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',4,4,'services','teacher','home','mother',2,1,1,'no','yes','no','no','yes','yes','yes','no',4,2,4,2,3,2,24,'18','18',18);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','LE3','T',4,4,'teacher','teacher','reputation','mother',1,2,0,'no','yes','yes','no','yes','yes','yes','no',4,5,2,1,2,3,0,'9','9',10);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',4,3,'health','other','home','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','no',4,3,5,1,5,2,2,'16','16',16);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',2,3,'other','other','reputation','mother',1,2,0,'yes','yes','yes','yes','yes','yes','no','no',4,4,3,1,3,4,6,'8','10',10);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',1,1,'other','other','course','mother',1,2,0,'no','yes','yes','no','no','yes','no','no',4,4,4,1,3,1,4,'9','9',10);
INSERT INTO `student_mat` VALUES('GP','F',17,'R','GT3','T',2,2,'other','other','reputation','mother',1,1,0,'no','yes','no','no','yes','yes','yes','no',5,3,2,1,2,3,18,'7','6',6);
INSERT INTO `student_mat` VALUES('GP','F',16,'R','GT3','T',2,2,'services','services','reputation','mother',2,4,0,'no','yes','yes','yes','no','yes','yes','no',5,3,5,1,1,5,6,'10','10',11);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',3,4,'at_home','services','home','mother',1,3,1,'no','yes','yes','no','yes','yes','yes','yes',4,4,3,3,4,5,28,'10','9',9);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','A',3,1,'services','other','course','mother',1,2,3,'no','yes','yes','no','yes','yes','yes','no',2,3,3,2,2,4,5,'7','7',7);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',4,3,'teacher','other','other','mother',1,2,0,'no','no','yes','yes','yes','yes','yes','yes',1,3,2,1,1,1,10,'11','12',13);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',1,1,'at_home','other','home','mother',2,1,0,'no','yes','yes','no','yes','yes','no','no',4,3,2,1,4,5,6,'9','9',10);
INSERT INTO `student_mat` VALUES('GP','F',17,'R','GT3','T',4,3,'teacher','other','reputation','mother',2,3,0,'no','yes','yes','yes','yes','yes','yes','yes',4,4,2,1,1,4,6,'7','7',7);
INSERT INTO `student_mat` VALUES('GP','F',19,'U','GT3','T',3,3,'other','other','reputation','other',1,4,0,'no','yes','yes','yes','yes','yes','yes','no',4,3,3,1,2,3,10,'8','8',8);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','LE3','T',4,4,'services','other','home','mother',1,2,0,'no','yes','yes','no','yes','yes','yes','yes',5,3,5,4,5,3,13,'12','12',13);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','A',2,2,'other','other','reputation','mother',1,2,0,'yes','yes','yes','no','yes','yes','yes','no',3,3,4,1,1,4,0,'12','13',14);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','GT3','T',2,2,'services','other','home','mother',1,2,1,'no','yes','yes','yes','yes','yes','yes','no',4,4,4,2,4,5,15,'6','7',8);
INSERT INTO `student_mat` VALUES('GP','F',17,'R','LE3','T',4,4,'services','other','other','mother',1,1,0,'no','yes','yes','no','yes','yes','no','no',5,2,1,1,2,3,12,'8','10',10);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','LE3','T',3,2,'other','other','reputation','mother',2,2,0,'no','no','yes','no','yes','yes','yes','no',4,4,4,1,3,1,2,'14','15',15);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',4,3,'other','other','reputation','mother',1,2,2,'no','no','yes','no','yes','yes','yes','yes',3,4,5,2,4,1,22,'6','6',4);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','LE3','T',3,3,'services','health','home','father',1,2,1,'no','yes','yes','no','yes','yes','yes','no',3,2,4,2,4,4,13,'6','6',8);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',2,3,'at_home','other','home','father',2,1,0,'no','yes','yes','no','yes','yes','no','no',3,3,3,1,4,3,3,'7','7',8);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',2,2,'at_home','at_home','course','mother',1,3,0,'no','yes','yes','yes','yes','yes','yes','no',4,3,3,1,1,4,4,'9','10',10);
INSERT INTO `student_mat` VALUES('GP','F',17,'R','GT3','T',2,1,'at_home','services','reputation','mother',2,2,0,'no','yes','no','yes','yes','yes','yes','no',4,2,5,1,2,5,2,'6','6',6);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',1,1,'at_home','other','reputation','mother',1,3,1,'no','yes','no','yes','yes','yes','no','yes',4,3,4,1,1,5,0,'6','5',0);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',2,3,'services','teacher','other','mother',1,2,0,'yes','no','no','no','yes','yes','yes','no',2,3,1,1,1,3,2,'16','16',17);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','GT3','T',2,2,'other','other','home','mother',2,2,0,'no','yes','yes','no','yes','yes','yes','no',3,3,3,5,5,4,0,'12','13',13);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',4,4,'teacher','services','home','mother',1,3,0,'no','yes','no','yes','no','yes','yes','no',5,3,2,1,1,5,0,'13','13',14);
INSERT INTO `student_mat` VALUES('GP','F',18,'R','GT3','T',3,1,'other','other','reputation','mother',1,2,1,'no','no','no','yes','yes','yes','yes','yes',5,3,3,1,1,4,16,'9','8',7);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',3,2,'other','other','course','mother',1,2,0,'no','no','no','yes','no','yes','yes','no',5,3,4,1,3,3,10,'16','15',15);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','LE3','T',2,3,'services','services','reputation','father',1,2,0,'no','yes','yes','no','no','yes','yes','no',5,3,3,1,3,3,2,'12','11',12);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','LE3','T',2,1,'at_home','other','course','mother',4,2,0,'yes','yes','yes','yes','yes','yes','yes','yes',4,3,2,4,5,3,14,'10','8',9);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','A',2,1,'other','other','course','mother',2,3,0,'no','no','no','yes','yes','yes','yes','yes',3,2,3,1,2,3,10,'12','10',12);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','LE3','T',4,3,'health','other','reputation','father',1,2,0,'no','no','no','yes','yes','yes','yes','yes',3,2,3,1,2,3,14,'13','13',14);
INSERT INTO `student_mat` VALUES('GP','M',17,'R','GT3','T',2,2,'other','other','course','father',2,2,0,'no','yes','yes','yes','yes','yes','yes','no',4,5,2,1,1,1,4,'11','11',11);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','GT3','T',4,4,'teacher','teacher','reputation','mother',1,2,0,'yes','yes','no','yes','yes','yes','yes','yes',4,5,5,1,3,2,14,'11','9',9);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',4,4,'health','other','reputation','father',1,2,0,'no','yes','yes','yes','yes','yes','yes','no',4,2,4,2,4,1,2,'14','13',13);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','LE3','T',1,1,'other','other','home','mother',2,2,0,'no','yes','yes','no','yes','yes','yes','no',3,4,2,1,1,5,18,'9','7',6);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',3,2,'at_home','other','reputation','mother',2,3,0,'no','no','no','yes','yes','yes','yes','yes',5,3,3,1,3,2,10,'11','9',10);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','LE3','T',2,2,'other','other','home','father',1,2,0,'no','no','yes','yes','no','yes','yes','yes',4,4,2,5,5,4,4,'14','13',13);
INSERT INTO `student_mat` VALUES('GP','F',16,'U','GT3','T',2,1,'other','other','home','mother',1,1,0,'no','no','no','no','yes','yes','yes','yes',4,5,2,1,1,5,20,'13','12',12);
INSERT INTO `student_mat` VALUES('GP','F',17,'R','GT3','T',2,1,'at_home','services','course','mother',3,2,0,'no','no','no','yes','yes','yes','no','no',2,1,1,1,1,3,2,'13','11',11);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','GT3','T',2,2,'other','services','reputation','father',1,2,1,'no','no','no','no','yes','no','yes','no',5,5,4,3,5,2,0,'7','7',0);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','LE3','T',4,3,'health','other','course','mother',2,2,0,'no','no','no','yes','yes','yes','yes','yes',2,5,5,1,4,5,14,'12','12',12);
INSERT INTO `student_mat` VALUES('GP','M',17,'R','LE3','A',4,4,'teacher','other','course','mother',2,2,0,'no','yes','yes','no','yes','yes','yes','no',3,3,3,2,3,4,2,'10','11',12);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','LE3','T',4,3,'teacher','other','course','mother',1,1,0,'no','no','no','yes','no','yes','yes','no',5,4,5,1,1,3,0,'6','0',0);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',4,4,'services','services','course','mother',1,1,0,'no','no','no','yes','yes','yes','yes','no',5,3,2,1,2,5,0,'13','12',12);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','GT3','T',2,1,'other','other','course','other',2,3,0,'no','yes','yes','no','no','yes','yes','yes',4,4,4,1,1,3,0,'7','0',0);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',2,1,'other','other','course','mother',3,1,0,'no','no','no','no','yes','yes','yes','no',4,3,3,1,1,4,6,'18','18',18);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','GT3','T',2,3,'other','other','course','father',2,1,0,'no','no','no','no','yes','yes','yes','no',5,2,2,1,1,2,4,'12','12',13);
INSERT INTO `student_mat` VALUES('GP','M',22,'U','GT3','T',3,1,'services','services','other','mother',1,1,3,'no','no','no','no','no','no','yes','yes',5,4,5,5,5,1,16,'6','8',8);
INSERT INTO `student_mat` VALUES('GP','M',18,'R','LE3','T',3,3,'other','services','course','mother',1,2,1,'no','yes','no','no','yes','yes','yes','yes',4,3,3,1,3,5,8,'3','5',5);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',0,2,'other','other','other','mother',1,1,0,'no','no','yes','no','no','yes','yes','no',4,3,2,2,4,5,0,'13','15',15);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','GT3','T',3,2,'services','other','course','mother',2,1,1,'no','no','no','no','yes','no','yes','no',4,4,5,2,4,5,0,'6','8',8);
INSERT INTO `student_mat` VALUES('GP','M',16,'U','GT3','T',3,3,'at_home','other','reputation','other',3,2,0,'yes','yes','no','no','no','yes','yes','no',5,3,3,1,3,2,6,'7','10',10);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','GT3','T',2,1,'services','services','other','mother',1,1,1,'no','no','no','no','no','no','yes','no',3,2,5,2,5,5,4,'6','9',8);
INSERT INTO `student_mat` VALUES('GP','M',16,'R','GT3','T',2,1,'other','other','course','mother',2,1,0,'no','no','no','yes','no','yes','no','no',3,3,2,1,3,3,0,'8','9',8);
INSERT INTO `student_mat` VALUES('GP','M',17,'R','GT3','T',2,1,'other','other','course','mother',1,1,0,'no','no','no','no','no','yes','yes','no',4,4,2,2,4,5,0,'8','12',12);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','LE3','T',1,1,'health','other','course','mother',2,1,1,'no','yes','no','yes','yes','yes','yes','no',4,4,4,1,2,5,2,'7','9',8);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','LE3','T',4,2,'teacher','services','reputation','mother',1,4,0,'no','yes','yes','yes','yes','yes','yes','no',4,2,3,1,1,4,6,'14','12',13);
INSERT INTO `student_mat` VALUES('GP','M',19,'U','LE3','A',4,3,'services','at_home','reputation','mother',1,2,0,'no','yes','no','no','yes','yes','yes','no',4,3,1,1,1,1,12,'11','11',11);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','GT3','T',2,1,'other','other','home','mother',1,2,0,'no','no','no','yes','yes','yes','yes','no',5,2,4,1,2,4,8,'15','14',14);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','LE3','T',2,2,'services','services','course','father',1,4,0,'no','no','yes','yes','yes','yes','yes','yes',3,4,1,1,1,2,0,'10','9',0);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','GT3','T',4,3,'services','other','home','father',1,2,0,'no','yes','yes','no','yes','yes','yes','yes',3,1,2,1,3,2,21,'17','18',18);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','GT3','T',4,3,'teacher','other','course','mother',1,2,0,'no','yes','yes','no','no','yes','yes','no',4,3,2,1,1,3,2,'8','8',8);
INSERT INTO `student_mat` VALUES('GP','M',18,'R','GT3','T',3,2,'other','other','course','mother',1,3,0,'no','no','no','yes','no','yes','no','no',5,3,2,1,1,3,1,'13','12',12);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',3,3,'other','other','home','mother',1,3,0,'no','no','no','yes','no','yes','no','no',3,2,3,1,1,4,4,'10','9',9);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','GT3','T',2,2,'at_home','services','home','mother',1,3,0,'no','yes','yes','yes','yes','yes','yes','yes',4,3,3,1,1,3,0,'9','10',0);
INSERT INTO `student_mat` VALUES('GP','M',18,'R','LE3','A',3,4,'other','other','reputation','mother',2,2,0,'no','yes','yes','yes','yes','yes','yes','no',4,2,5,3,4,1,13,'17','17',17);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','GT3','T',3,1,'services','other','other','mother',1,2,0,'no','no','yes','yes','yes','yes','yes','yes',5,4,4,3,4,5,2,'9','9',10);
INSERT INTO `student_mat` VALUES('GP','F',18,'R','GT3','T',4,4,'teacher','other','reputation','mother',2,2,0,'no','no','yes','yes','yes','yes','yes','no',4,3,4,2,2,4,8,'12','10',11);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','GT3','T',4,2,'health','other','reputation','father',1,2,0,'no','yes','yes','yes','yes','yes','yes','yes',5,4,5,1,3,5,10,'10','9',10);
INSERT INTO `student_mat` VALUES('GP','F',18,'R','GT3','T',2,1,'other','other','reputation','mother',2,2,0,'no','yes','no','no','yes','no','yes','yes',4,3,5,1,2,3,0,'6','0',0);
INSERT INTO `student_mat` VALUES('GP','F',19,'U','GT3','T',3,3,'other','services','home','other',1,2,2,'no','yes','yes','yes','yes','yes','yes','no',4,3,5,3,3,5,15,'9','9',9);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','GT3','T',2,3,'other','services','reputation','father',1,4,0,'no','yes','yes','yes','yes','yes','yes','yes',4,5,5,1,3,2,4,'15','14',14);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','LE3','T',1,1,'other','other','home','mother',2,2,0,'no','yes','yes','no','no','yes','no','no',4,4,3,1,1,3,2,'11','11',11);
INSERT INTO `student_mat` VALUES('GP','M',17,'R','GT3','T',1,2,'at_home','at_home','home','mother',1,2,0,'no','yes','yes','yes','no','yes','no','yes',3,5,2,2,2,1,2,'15','14',14);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',2,4,'at_home','health','reputation','mother',2,2,0,'no','yes','yes','no','yes','yes','yes','yes',4,3,3,1,1,1,2,'10','10',10);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','LE3','T',2,2,'services','other','course','mother',2,2,0,'yes','yes','yes','no','yes','yes','yes','yes',4,4,4,2,3,5,6,'12','12',12);
INSERT INTO `student_mat` VALUES('GP','F',18,'R','GT3','A',3,2,'other','services','home','mother',2,2,0,'no','no','no','no','no','no','yes','yes',4,1,1,1,1,5,75,'10','9',9);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','GT3','T',4,4,'teacher','services','home','mother',2,1,0,'no','no','yes','yes','yes','yes','yes','no',3,2,4,1,4,3,22,'9','9',9);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','GT3','T',4,4,'health','health','reputation','father',1,2,1,'yes','yes','no','yes','yes','yes','yes','yes',2,4,4,1,1,4,15,'9','8',8);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','LE3','T',4,3,'teacher','services','course','mother',2,1,0,'no','no','yes','yes','yes','yes','yes','no',4,2,3,1,2,1,8,'10','11',10);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','LE3','A',4,1,'services','other','home','mother',2,1,0,'no','no','yes','yes','yes','yes','yes','yes',4,5,4,2,4,5,30,'8','8',8);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','LE3','A',3,2,'teacher','services','home','mother',1,1,1,'no','no','no','no','yes','yes','yes','no',4,4,4,3,4,3,19,'11','9',10);
INSERT INTO `student_mat` VALUES('GP','F',18,'R','LE3','T',1,1,'at_home','other','reputation','mother',2,4,0,'no','yes','yes','yes','yes','yes','no','no',5,2,2,1,1,3,1,'12','12',12);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','GT3','T',1,1,'other','other','home','mother',2,2,0,'yes','no','no','yes','yes','yes','yes','no',5,4,4,1,1,4,4,'8','9',10);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',2,2,'other','other','course','mother',1,2,0,'no','yes','no','no','no','yes','yes','no',5,4,5,1,2,5,4,'10','9',11);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','GT3','T',1,1,'other','other','reputation','father',1,2,0,'no','no','yes','no','no','yes','yes','no',4,3,3,1,2,4,2,'12','10',11);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','GT3','T',2,2,'at_home','at_home','other','mother',1,3,0,'no','yes','yes','no','yes','yes','yes','no',4,3,3,1,2,2,5,'18','18',19);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',1,1,'services','teacher','reputation','mother',1,3,0,'no','yes','yes','no','yes','yes','yes','no',4,3,3,1,1,3,6,'13','12',12);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','GT3','T',2,1,'services','services','reputation','mother',1,3,0,'no','no','yes','yes','yes','yes','yes','no',4,2,4,1,3,2,6,'15','14',14);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','LE3','A',4,4,'teacher','teacher','reputation','mother',1,2,0,'no','yes','yes','yes','yes','yes','yes','no',5,4,3,1,1,2,9,'15','13',15);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','GT3','T',4,2,'teacher','other','home','mother',1,2,0,'no','yes','yes','yes','yes','yes','yes','yes',4,3,2,1,4,5,11,'12','11',11);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',4,3,'health','services','reputation','mother',1,3,0,'no','yes','yes','no','yes','yes','yes','no',4,2,2,1,2,3,0,'15','15',15);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','LE3','T',2,1,'services','at_home','reputation','mother',1,2,1,'no','no','no','no','yes','yes','yes','yes',5,4,3,1,1,5,12,'12','12',13);
INSERT INTO `student_mat` VALUES('GP','F',17,'R','LE3','T',3,1,'services','other','reputation','mother',2,4,0,'no','yes','yes','no','yes','yes','no','no',3,1,2,1,1,3,6,'18','18',18);
INSERT INTO `student_mat` VALUES('GP','M',18,'R','LE3','T',3,2,'services','other','reputation','mother',2,3,0,'no','yes','yes','yes','yes','yes','yes','no',5,4,2,1,1,4,8,'14','13',14);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','GT3','T',3,3,'health','other','home','mother',1,1,0,'no','yes','yes','no','yes','yes','yes','no',4,4,3,1,3,5,4,'14','12',11);
INSERT INTO `student_mat` VALUES('GP','F',19,'U','GT3','T',4,4,'health','other','reputation','other',2,2,0,'no','yes','yes','yes','yes','yes','yes','no',2,3,4,2,3,2,0,'10','9',0);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','LE3','T',4,3,'other','other','home','other',2,2,0,'no','yes','yes','no','yes','yes','yes','yes',4,4,5,1,2,2,10,'10','8',8);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','GT3','T',4,3,'other','other','reputation','father',1,4,0,'no','yes','yes','no','yes','yes','yes','no',4,3,3,1,1,3,0,'14','13',14);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','LE3','T',4,4,'teacher','teacher','home','mother',1,1,0,'no','yes','yes','no','yes','yes','yes','yes',1,4,2,2,2,1,5,'16','15',16);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','LE3','A',4,4,'health','other','home','mother',1,2,0,'no','yes','no','no','yes','yes','yes','yes',4,2,4,1,1,4,14,'12','10',11);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','LE3','T',4,4,'other','teacher','home','father',2,1,0,'no','no','yes','no','yes','yes','yes','no',4,1,1,2,2,5,0,'11','11',10);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',4,2,'other','other','reputation','mother',2,3,0,'no','yes','yes','no','yes','yes','yes','no',4,3,3,1,1,3,0,'15','12',14);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',3,2,'health','health','reputation','father',1,4,0,'no','yes','yes','yes','no','yes','yes','no',5,2,2,1,2,5,0,'17','17',18);
INSERT INTO `student_mat` VALUES('GP','M',19,'U','GT3','T',3,3,'other','other','home','other',1,2,1,'no','yes','no','yes','yes','yes','yes','yes',4,4,4,1,1,3,20,'15','14',13);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','GT3','T',2,4,'services','at_home','reputation','other',1,2,1,'no','yes','yes','yes','yes','yes','yes','no',4,4,3,1,1,3,8,'14','12',12);
INSERT INTO `student_mat` VALUES('GP','M',20,'U','GT3','A',3,2,'services','other','course','other',1,1,0,'no','no','no','yes','yes','yes','no','no',5,5,3,1,1,5,0,'17','18',18);
INSERT INTO `student_mat` VALUES('GP','M',19,'U','GT3','T',4,4,'teacher','services','reputation','other',2,1,1,'no','yes','yes','no','yes','yes','yes','yes',4,3,4,1,1,4,38,'8','9',8);
INSERT INTO `student_mat` VALUES('GP','M',19,'R','GT3','T',3,3,'other','services','reputation','father',1,2,1,'no','no','no','yes','yes','yes','no','yes',4,5,3,1,2,5,0,'15','12',12);
INSERT INTO `student_mat` VALUES('GP','F',19,'U','LE3','T',1,1,'at_home','other','reputation','other',1,2,1,'yes','yes','no','yes','no','yes','yes','no',4,4,3,1,3,3,18,'12','10',10);
INSERT INTO `student_mat` VALUES('GP','F',19,'U','LE3','T',1,2,'services','services','home','other',1,2,1,'no','no','no','yes','no','yes','no','yes',4,2,4,2,2,3,0,'9','9',0);
INSERT INTO `student_mat` VALUES('GP','F',19,'U','GT3','T',2,1,'at_home','other','other','other',3,2,0,'no','yes','no','no','yes','no','yes','yes',3,4,1,1,1,2,20,'14','12',13);
INSERT INTO `student_mat` VALUES('GP','M',19,'U','GT3','T',1,2,'other','services','course','other',1,2,1,'no','no','no','no','no','yes','yes','no',4,5,2,2,2,4,3,'13','11',11);
INSERT INTO `student_mat` VALUES('GP','F',19,'U','LE3','T',3,2,'services','other','reputation','other',2,2,1,'no','yes','yes','no','no','yes','yes','yes',4,2,2,1,2,1,22,'13','10',11);
INSERT INTO `student_mat` VALUES('GP','F',19,'U','GT3','T',1,1,'at_home','health','home','other',1,3,2,'no','no','no','no','no','yes','yes','yes',4,1,2,1,1,3,14,'15','13',13);
INSERT INTO `student_mat` VALUES('GP','F',19,'R','GT3','T',2,3,'other','other','reputation','other',1,3,1,'no','no','no','no','yes','yes','yes','yes',4,1,2,1,1,3,40,'13','11',11);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','GT3','T',2,1,'services','other','course','mother',2,2,0,'no','yes','yes','yes','yes','yes','yes','no',5,3,3,1,2,1,0,'8','8',0);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','GT3','T',4,3,'other','other','course','mother',1,3,0,'no','yes','yes','yes','yes','yes','yes','yes',4,3,4,1,1,5,9,'9','10',9);
INSERT INTO `student_mat` VALUES('GP','F',17,'R','GT3','T',3,4,'at_home','services','course','father',1,3,0,'no','yes','yes','yes','no','yes','yes','no',4,3,4,2,5,5,0,'11','11',10);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','GT3','T',4,4,'teacher','other','course','mother',1,2,0,'no','yes','yes','no','yes','yes','yes','no',4,4,4,3,3,5,2,'11','11',11);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','A',4,3,'services','services','course','mother',1,2,0,'no','yes','yes','no','yes','yes','yes','yes',5,2,2,1,2,5,23,'13','13',13);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',2,2,'other','other','course','mother',1,2,0,'no','yes','no','no','yes','yes','no','yes',4,2,2,1,1,3,12,'11','9',9);
INSERT INTO `student_mat` VALUES('GP','F',17,'R','LE3','T',2,2,'services','services','course','mother',1,3,0,'no','yes','yes','yes','yes','yes','yes','no',3,3,2,2,2,3,3,'11','11',11);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',3,1,'services','services','course','father',1,3,0,'no','yes','no','no','no','yes','yes','no',3,4,3,2,3,5,1,'12','14',15);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','LE3','T',0,2,'at_home','at_home','home','father',2,3,0,'no','no','no','no','yes','yes','yes','no',3,3,3,2,3,2,0,'16','15',15);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','GT3','T',4,4,'other','other','course','mother',1,3,0,'no','no','no','yes','yes','yes','yes','no',4,3,3,2,2,3,3,'9','12',11);
INSERT INTO `student_mat` VALUES('GP','M',17,'U','GT3','T',3,3,'other','services','reputation','mother',1,1,0,'no','no','no','yes','no','yes','yes','no',4,3,5,3,5,5,3,'14','15',16);
INSERT INTO `student_mat` VALUES('GP','M',17,'R','GT3','T',2,2,'services','other','course','mother',4,1,0,'no','yes','no','no','yes','yes','yes','no',4,4,5,5,5,4,8,'11','10',10);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',4,4,'teacher','services','course','mother',1,3,0,'no','yes','yes','yes','yes','yes','yes','no',5,4,4,1,3,4,7,'10','9',9);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',4,4,'teacher','teacher','course','mother',2,3,0,'no','yes','yes','no','no','yes','yes','yes',4,3,3,1,2,4,4,'14','14',14);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','LE3','T',2,2,'other','other','course','mother',1,4,0,'no','yes','no','yes','yes','yes','yes','no',4,5,5,2,4,5,2,'9','8',8);
INSERT INTO `student_mat` VALUES('GP','F',17,'R','GT3','T',2,4,'at_home','other','course','father',1,3,0,'no','yes','no','no','yes','yes','yes','yes',4,4,3,1,1,5,7,'12','14',14);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','GT3','T',3,3,'services','services','home','mother',1,2,0,'no','no','no','yes','yes','yes','yes','no',5,3,4,1,1,4,0,'7','0',0);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','LE3','T',2,2,'other','other','home','other',1,2,0,'no','no','no','yes','no','yes','yes','yes',4,3,3,1,1,2,0,'8','8',0);
INSERT INTO `student_mat` VALUES('GP','F',18,'R','GT3','T',2,2,'at_home','other','course','mother',2,4,0,'no','no','no','yes','yes','yes','no','no',4,4,4,1,1,4,0,'10','9',0);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',3,4,'services','other','course','mother',1,3,0,'no','no','no','no','yes','yes','yes','no',4,4,5,1,3,5,16,'16','15',15);
INSERT INTO `student_mat` VALUES('GP','F',19,'R','GT3','A',3,1,'services','at_home','home','other',1,3,1,'no','no','yes','no','yes','yes','no','no',5,4,3,1,2,5,12,'14','13',13);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',3,2,'other','other','home','mother',1,2,0,'no','yes','yes','no','yes','yes','yes','yes',4,3,2,2,3,2,0,'7','8',0);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','LE3','T',3,3,'services','services','home','mother',1,4,0,'no','yes','no','no','yes','yes','yes','no',5,3,3,1,1,1,7,'16','15',17);
INSERT INTO `student_mat` VALUES('GP','F',17,'R','GT3','A',3,2,'other','other','home','mother',1,2,0,'no','yes','yes','no','yes','yes','yes','no',4,3,3,2,3,2,4,'9','10',10);
INSERT INTO `student_mat` VALUES('GP','F',19,'U','GT3','T',2,1,'services','services','home','other',1,3,1,'no','no','yes','yes','yes','yes','yes','yes',4,3,4,1,3,3,4,'11','12',11);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','GT3','T',4,4,'teacher','services','home','father',1,2,1,'no','yes','no','yes','yes','yes','yes','no',4,3,3,2,2,2,0,'10','10',0);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','LE3','T',3,4,'services','other','home','mother',1,2,0,'no','no','no','yes','yes','yes','yes','yes',4,3,3,1,3,5,11,'16','15',15);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','A',2,2,'at_home','at_home','home','father',1,2,1,'no','yes','no','no','yes','yes','yes','yes',3,3,1,1,2,4,0,'9','8',0);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','GT3','T',2,3,'at_home','other','course','mother',1,3,0,'no','yes','no','no','yes','yes','yes','no',4,3,3,1,2,3,4,'11','10',10);
INSERT INTO `student_mat` VALUES('GP','F',18,'U','GT3','T',3,2,'other','services','other','mother',1,3,0,'no','no','no','no','yes','yes','yes','yes',5,4,3,2,3,1,7,'13','13',14);
INSERT INTO `student_mat` VALUES('GP','M',18,'R','GT3','T',4,3,'teacher','services','course','mother',1,3,0,'no','no','no','no','yes','yes','yes','yes',5,3,2,1,2,4,9,'16','15',16);
INSERT INTO `student_mat` VALUES('GP','M',18,'U','GT3','T',4,3,'teacher','other','course','mother',1,3,0,'no','yes','yes','no','yes','yes','yes','yes',5,4,5,2,3,5,0,'10','10',9);
INSERT INTO `student_mat` VALUES('GP','F',17,'U','GT3','T',4,3,'health','other','reputation','mother',1,3,0,'no','yes','yes','yes','yes','yes','yes','yes',4,4,3,1,3,4,0,'13','15',15);
INSERT INTO `student_mat` VALUES('MS','M',18,'R','GT3','T',3,2,'other','other','course','mother',2,1,1,'no','yes','no','no','no','yes','yes','no',2,5,5,5,5,5,10,'11','13',13);
INSERT INTO `student_mat` VALUES('MS','M',19,'R','GT3','T',1,1,'other','services','home','other',3,2,3,'no','no','no','no','yes','yes','yes','no',5,4,4,3,3,2,8,'8','7',8);
INSERT INTO `student_mat` VALUES('MS','M',17,'U','GT3','T',3,3,'health','other','course','mother',2,2,0,'no','yes','yes','no','yes','yes','yes','no',4,5,4,2,3,3,2,'13','13',13);
INSERT INTO `student_mat` VALUES('MS','M',18,'U','LE3','T',1,3,'at_home','services','course','mother',1,1,1,'no','no','no','no','yes','no','yes','yes',4,3,3,2,3,3,7,'8','7',8);
INSERT INTO `student_mat` VALUES('MS','M',19,'R','GT3','T',1,1,'other','other','home','other',3,1,1,'no','yes','no','no','yes','yes','yes','no',4,4,4,3,3,5,4,'8','8',8);
INSERT INTO `student_mat` VALUES('MS','M',17,'R','GT3','T',4,3,'services','other','home','mother',2,2,0,'no','yes','yes','yes','no','yes','yes','yes',4,5,5,1,3,2,4,'13','11',11);
INSERT INTO `student_mat` VALUES('MS','F',18,'U','GT3','T',3,3,'services','services','course','father',1,2,0,'no','yes','no','no','yes','yes','no','yes',5,3,4,1,1,5,0,'10','9',9);
INSERT INTO `student_mat` VALUES('MS','F',17,'R','GT3','T',4,4,'teacher','services','other','father',2,2,0,'no','yes','yes','yes','yes','yes','yes','no',4,3,3,1,2,5,4,'12','13',13);
INSERT INTO `student_mat` VALUES('MS','F',17,'U','LE3','A',3,2,'services','other','reputation','mother',2,2,0,'no','no','no','no','yes','yes','no','yes',1,2,3,1,2,5,2,'12','12',11);
INSERT INTO `student_mat` VALUES('MS','M',18,'U','LE3','T',1,1,'other','services','home','father',2,1,0,'no','no','no','no','no','yes','yes','yes',3,3,2,1,2,3,4,'10','10',10);
INSERT INTO `student_mat` VALUES('MS','F',18,'U','LE3','T',1,1,'at_home','services','course','father',2,3,0,'no','no','no','no','yes','yes','yes','no',5,3,2,1,1,4,0,'18','16',16);
INSERT INTO `student_mat` VALUES('MS','F',18,'R','LE3','A',1,4,'at_home','other','course','mother',3,2,0,'no','no','no','no','yes','yes','no','yes',4,3,4,1,4,5,0,'13','13',13);
INSERT INTO `student_mat` VALUES('MS','M',18,'R','LE3','T',1,1,'at_home','other','other','mother',2,2,1,'no','no','no','yes','no','no','no','no',4,4,3,2,3,5,2,'13','12',12);
INSERT INTO `student_mat` VALUES('MS','F',18,'U','GT3','T',3,3,'services','services','other','mother',2,2,0,'no','yes','no','no','yes','yes','yes','yes',4,3,2,1,3,3,0,'11','11',10);
INSERT INTO `student_mat` VALUES('MS','F',17,'U','LE3','T',4,4,'at_home','at_home','course','mother',1,2,0,'no','yes','yes','yes','yes','yes','yes','yes',2,3,4,1,1,1,0,'16','15',15);
INSERT INTO `student_mat` VALUES('MS','F',17,'R','GT3','T',1,2,'other','services','course','father',2,2,0,'no','no','no','no','no','yes','no','no',3,2,2,1,2,3,0,'12','11',12);
INSERT INTO `student_mat` VALUES('MS','M',18,'R','GT3','T',1,3,'at_home','other','course','mother',2,2,0,'no','yes','yes','no','yes','yes','no','no',3,3,4,2,4,3,4,'10','10',10);
INSERT INTO `student_mat` VALUES('MS','M',18,'U','LE3','T',4,4,'teacher','services','other','mother',2,3,0,'no','no','yes','no','yes','yes','yes','yes',4,2,2,2,2,5,0,'13','13',13);
INSERT INTO `student_mat` VALUES('MS','F',17,'R','GT3','T',1,1,'other','services','reputation','mother',3,1,1,'no','yes','yes','no','yes','yes','yes','yes',5,2,1,1,2,1,0,'7','6',0);
INSERT INTO `student_mat` VALUES('MS','F',18,'U','GT3','T',2,3,'at_home','services','course','father',2,1,0,'no','yes','yes','no','yes','yes','yes','yes',5,2,3,1,2,4,0,'11','10',10);
INSERT INTO `student_mat` VALUES('MS','F',18,'R','GT3','T',4,4,'other','teacher','other','father',3,2,0,'no','yes','yes','no','no','yes','yes','yes',3,2,2,4,2,5,10,'14','12',11);
INSERT INTO `student_mat` VALUES('MS','F',19,'U','LE3','T',3,2,'services','services','home','other',2,2,2,'no','no','no','yes','yes','yes','no','yes',3,2,2,1,1,3,4,'7','7',9);
INSERT INTO `student_mat` VALUES('MS','M',18,'R','LE3','T',1,2,'at_home','services','other','father',3,1,0,'no','yes','yes','yes','yes','no','yes','yes',4,3,3,2,3,3,3,'14','12',12);
INSERT INTO `student_mat` VALUES('MS','F',17,'U','GT3','T',2,2,'other','at_home','home','mother',1,3,0,'no','no','no','yes','yes','yes','no','yes',3,4,3,1,1,3,8,'13','11',11);
INSERT INTO `student_mat` VALUES('MS','F',17,'R','GT3','T',1,2,'other','other','course','mother',1,1,0,'no','no','no','yes','yes','yes','yes','no',3,5,5,1,3,1,14,'6','5',5);
INSERT INTO `student_mat` VALUES('MS','F',18,'R','LE3','T',4,4,'other','other','reputation','mother',2,3,0,'no','no','no','no','yes','yes','yes','no',5,4,4,1,1,1,0,'19','18',19);
INSERT INTO `student_mat` VALUES('MS','F',18,'R','GT3','T',1,1,'other','other','home','mother',4,3,0,'no','no','no','no','yes','yes','yes','no',4,3,2,1,2,4,2,'8','8',10);
INSERT INTO `student_mat` VALUES('MS','F',20,'U','GT3','T',4,2,'health','other','course','other',2,3,2,'no','yes','yes','no','no','yes','yes','yes',5,4,3,1,1,3,4,'15','14',15);
INSERT INTO `student_mat` VALUES('MS','F',18,'R','LE3','T',4,4,'teacher','services','course','mother',1,2,0,'no','no','yes','yes','yes','yes','yes','no',5,4,3,3,4,2,4,'8','9',10);
INSERT INTO `student_mat` VALUES('MS','F',18,'U','GT3','T',3,3,'other','other','home','mother',1,2,0,'no','no','yes','no','yes','yes','yes','yes',4,1,3,1,2,1,0,'15','15',15);
INSERT INTO `student_mat` VALUES('MS','F',17,'R','GT3','T',3,1,'at_home','other','reputation','mother',1,2,0,'no','yes','yes','yes','no','yes','yes','no',4,5,4,2,3,1,17,'10','10',10);
INSERT INTO `student_mat` VALUES('MS','M',18,'U','GT3','T',4,4,'teacher','teacher','home','father',1,2,0,'no','no','yes','yes','no','yes','yes','no',3,2,4,1,4,2,4,'15','14',14);
INSERT INTO `student_mat` VALUES('MS','M',18,'R','GT3','T',2,1,'other','other','other','mother',2,1,0,'no','no','no','yes','no','yes','yes','yes',4,4,3,1,3,5,5,'7','6',7);
INSERT INTO `student_mat` VALUES('MS','M',17,'U','GT3','T',2,3,'other','services','home','father',2,2,0,'no','no','no','yes','yes','yes','yes','no',4,4,3,1,1,3,2,'11','11',10);
INSERT INTO `student_mat` VALUES('MS','M',19,'R','GT3','T',1,1,'other','services','other','mother',2,1,1,'no','no','no','no','yes','yes','no','no',4,3,2,1,3,5,0,'6','5',0);
INSERT INTO `student_mat` VALUES('MS','M',18,'R','GT3','T',4,2,'other','other','home','father',2,1,1,'no','no','yes','no','yes','yes','no','no',5,4,3,4,3,3,14,'6','5',5);
INSERT INTO `student_mat` VALUES('MS','F',18,'R','GT3','T',2,2,'at_home','other','other','mother',2,3,0,'no','no','yes','no','yes','yes','no','no',5,3,3,1,3,4,2,'10','9',10);
INSERT INTO `student_mat` VALUES('MS','F',18,'R','GT3','T',4,4,'teacher','at_home','reputation','mother',3,1,0,'no','yes','yes','yes','yes','yes','yes','yes',4,4,3,2,2,5,7,'6','5',6);
INSERT INTO `student_mat` VALUES('MS','F',19,'R','GT3','T',2,3,'services','other','course','mother',1,3,1,'no','no','no','yes','no','yes','yes','no',5,4,2,1,2,5,0,'7','5',0);
INSERT INTO `student_mat` VALUES('MS','F',18,'U','LE3','T',3,1,'teacher','services','course','mother',1,2,0,'no','yes','yes','no','yes','yes','yes','no',4,3,4,1,1,1,0,'7','9',8);
INSERT INTO `student_mat` VALUES('MS','F',18,'U','GT3','T',1,1,'other','other','course','mother',2,2,1,'no','no','no','yes','yes','yes','no','no',1,1,1,1,1,5,0,'6','5',0);
INSERT INTO `student_mat` VALUES('MS','M',20,'U','LE3','A',2,2,'services','services','course','other',1,2,2,'no','yes','yes','no','yes','yes','no','no',5,5,4,4,5,4,11,'9','9',9);
INSERT INTO `student_mat` VALUES('MS','M',17,'U','LE3','T',3,1,'services','services','course','mother',2,1,0,'no','no','no','no','no','yes','yes','no',2,4,5,3,4,2,3,'14','16',16);
INSERT INTO `student_mat` VALUES('MS','M',21,'R','GT3','T',1,1,'other','other','course','other',1,1,3,'no','no','no','no','no','yes','no','no',5,5,3,3,3,3,3,'10','8',7);
INSERT INTO `student_mat` VALUES('MS','M',18,'R','LE3','T',3,2,'services','other','course','mother',3,1,0,'no','no','no','no','no','yes','yes','no',4,4,1,3,4,5,0,'11','12',10);
INSERT INTO `student_mat` VALUES('MS','M',19,'U','LE3','T',1,1,'other','at_home','course','father',1,1,0,'no','no','no','no','yes','yes','yes','no',3,2,3,3,3,5,5,'8','9',9);

COMMIT;


DROP TABLE IF EXISTS `student_por`;

CREATE TABLE `student_por` (
    `school` ENUM('GP','MS'),
    `sex` ENUM('M', 'F'),
    `age` INT(3),
    `address` ENUM('U','R'),
    `famsize` VARCHAR(10),
    `Pstatus` ENUM('T','A'),
    `Medu` INT(2),
    `Fedu` INT(2),
    `Mjob` VARCHAR(10),
    `Fjob` VARCHAR(10),
    `reason` VARCHAR(10),
    `guardian` ENUM('father','mother','other'),
    `traveltime` INT(1),
    `studytime` INT(1),
    `failures` INT(1),
    `schoolsup` ENUM('yes','no'),
    `famsup` ENUM('yes','no'),
    `paid` ENUM('yes','no'),
    `activities` ENUM('yes','no'),
    `nursery` ENUM('yes','no'),
    `higher` ENUM('yes','no'),
    `internet` ENUM('yes','no'),
    `romantic` ENUM('yes','no'),
    `famrel` INT(1),
    `freetime` INT(1),
    `goout` INT(1),
    `Dalc` INT(1),
    `Walc` INT(1),
    `health` INT(1),
    `absences` INT(2),
    `G1` INT(2),
    `G2` INT(2),
    `G3` INT(2)
) ENGINE=InnoDB;


INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','T',1,1,'other','other','home','father',1,2,0,'no','yes','no','yes','no','yes','yes','no',4,3,2,2,3,4,2,'13','12',12);
INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','T',4,4,'services','services','reputation','father',2,2,0,'no','no','no','no','yes','yes','yes','yes',4,4,4,2,3,5,4,'12','11',12);
INSERT INTO `student_por` VALUES('GP','F',16,'U','LE3','T',2,2,'at_home','other','course','mother',1,2,0,'no','yes','no','no','yes','yes','no','no',4,3,4,1,2,2,6,'13','11',11);
INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','T',4,2,'other','other','reputation','mother',1,3,0,'no','yes','no','yes','yes','yes','yes','no',5,3,3,1,3,1,4,'15','15',15);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',2,2,'services','other','reputation','father',2,2,0,'no','no','no','yes','no','yes','yes','no',4,4,2,1,1,3,6,'12','10',11);
INSERT INTO `student_por` VALUES('GP','M',16,'U','LE3','A',4,4,'teacher','health','reputation','mother',1,2,0,'no','yes','no','no','yes','yes','no','no',4,1,3,3,5,5,6,'9','9',10);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',3,3,'other','other','home','mother',1,3,0,'no','yes','no','no','yes','yes','yes','yes',4,3,3,1,3,4,2,'9','11',11);
INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','T',4,3,'services','other','reputation','mother',1,1,0,'no','no','no','yes','yes','yes','yes','no',4,5,5,1,3,1,6,'14','13',13);
INSERT INTO `student_por` VALUES('GP','F',16,'U','LE3','T',3,1,'other','other','home','father',1,2,0,'yes','yes','no','no','yes','yes','no','no',3,3,3,2,3,2,0,'12','13',12);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',4,2,'teacher','services','home','mother',2,2,0,'no','yes','no','yes','yes','yes','yes','no',5,3,3,1,1,1,2,'13','14',14);
INSERT INTO `student_por` VALUES('GP','M',15,'U','LE3','T',2,2,'services','health','reputation','mother',1,4,0,'no','yes','no','yes','yes','yes','yes','no',4,3,4,1,1,4,2,'11','12',12);
INSERT INTO `student_por` VALUES('GP','F',15,'R','GT3','T',1,1,'at_home','other','home','mother',2,4,0,'yes','yes','yes','yes','yes','yes','yes','no',3,1,2,1,1,1,4,'13','13',13);
INSERT INTO `student_por` VALUES('GP','M',16,'R','GT3','T',4,3,'services','other','reputation','mother',2,1,0,'yes','yes','yes','yes','no','yes','yes','no',3,3,3,1,1,4,6,'9','11',11);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',2,1,'other','other','course','mother',1,2,0,'no','yes','no','no','yes','yes','no','yes',4,3,5,1,1,5,0,'13','12',12);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',4,4,'other','other','reputation','mother',1,1,0,'no','no','no','yes','no','yes','yes','no',5,3,4,1,2,1,4,'12','13',13);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',4,3,'other','at_home','course','mother',1,3,0,'yes','yes','no','no','yes','yes','yes','no',5,3,5,1,1,3,2,'12','13',13);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',4,4,'services','services','other','mother',1,1,0,'yes','yes','no','yes','yes','yes','yes','no',4,5,5,5,5,4,12,'9','9',8);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',4,4,'services','teacher','other','father',1,3,0,'no','yes','no','yes','yes','yes','yes','yes',4,4,3,1,1,4,0,'16','16',16);
INSERT INTO `student_por` VALUES('GP','M',15,'U','GT3','T',4,4,'services','other','course','mother',1,1,0,'no','yes','yes','yes','no','yes','yes','no',5,3,3,1,1,5,2,'12','13',12);
INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','T',3,2,'services','other','home','mother',2,2,0,'yes','yes','no','no','yes','yes','yes','no',4,3,5,1,1,2,16,'11','10',10);
INSERT INTO `student_por` VALUES('GP','M',15,'U','GT3','A',3,4,'services','other','course','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','no',5,4,4,1,1,1,0,'16','16',16);
INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','A',3,3,'other','health','reputation','father',1,4,0,'yes','no','no','no','yes','yes','no','no',4,3,3,1,1,4,10,'10','10',10);
INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','T',2,2,'other','other','course','mother',1,4,0,'yes','yes','no','no','yes','yes','yes','no',5,1,2,1,1,3,4,'10','10',10);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',3,3,'services','other','home','father',1,3,0,'no','yes','no','yes','yes','yes','yes','no',5,3,3,1,1,5,4,'13','14',14);
INSERT INTO `student_por` VALUES('GP','M',15,'R','GT3','T',4,4,'other','other','home','father',4,4,0,'no','yes','no','yes','yes','yes','yes','yes',1,3,5,3,5,1,8,'12','10',11);
INSERT INTO `student_por` VALUES('GP','F',16,'U','LE3','T',4,4,'health','health','other','mother',1,3,0,'no','yes','no','yes','yes','yes','yes','yes',5,4,5,1,1,4,2,'15','15',14);
INSERT INTO `student_por` VALUES('GP','M',15,'U','LE3','A',4,4,'teacher','teacher','course','mother',1,1,0,'no','no','no','yes','yes','yes','yes','no',5,5,3,1,1,4,4,'13','14',14);
INSERT INTO `student_por` VALUES('GP','F',16,'R','GT3','T',3,3,'services','other','reputation','father',1,3,0,'yes','yes','no','yes','yes','yes','yes','no',4,1,2,1,1,2,4,'11','11',11);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',2,2,'at_home','other','home','mother',1,2,1,'yes','no','no','yes','yes','yes','yes','no',3,1,2,1,1,5,12,'8','10',10);
INSERT INTO `student_por` VALUES('GP','M',15,'U','LE3','T',4,2,'teacher','other','course','mother',1,1,0,'no','no','no','no','yes','yes','yes','no',3,5,2,1,1,3,10,'18','17',18);
INSERT INTO `student_por` VALUES('GP','M',15,'R','GT3','T',2,1,'health','services','reputation','mother',1,2,0,'no','no','no','yes','yes','yes','yes','yes',5,4,2,1,1,5,4,'10','9',10);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',4,4,'teacher','teacher','course','father',1,2,0,'no','yes','no','yes','yes','yes','yes','no',5,4,4,1,2,5,6,'16','14',14);
INSERT INTO `student_por` VALUES('GP','M',15,'U','GT3','T',4,4,'other','teacher','reputation','father',2,2,0,'no','yes','no','yes','yes','yes','no','no',4,4,3,1,1,2,4,'16','15',16);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',3,3,'other','services','home','father',2,1,0,'no','no','no','yes','yes','yes','yes','no',5,4,2,1,1,5,6,'14','14',15);
INSERT INTO `student_por` VALUES('GP','M',17,'R','GT3','T',1,3,'other','other','course','father',3,2,1,'no','yes','no','yes','yes','yes','yes','no',5,2,4,1,4,5,14,'12','11',11);
INSERT INTO `student_por` VALUES('GP','M',15,'U','GT3','T',3,4,'other','other','reputation','father',1,1,0,'no','no','no','no','yes','yes','yes','no',3,4,3,1,2,4,2,'14','13',14);
INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','T',1,2,'at_home','services','course','mother',1,2,0,'no','no','no','no','no','yes','yes','no',3,2,3,1,2,1,0,'14','14',14);
INSERT INTO `student_por` VALUES('GP','M',15,'U','GT3','T',2,2,'services','services','home','father',1,4,0,'no','yes','no','yes','yes','yes','yes','no',5,5,4,1,2,5,6,'14','13',13);
INSERT INTO `student_por` VALUES('GP','F',16,'U','LE3','T',2,4,'other','health','course','father',2,2,0,'no','yes','no','yes','yes','yes','yes','yes',4,2,2,1,2,5,2,'14','12',13);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',4,4,'health','other','course','mother',1,1,0,'no','yes','no','yes','yes','yes','yes','no',3,4,4,1,4,5,4,'12','13',13);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',2,2,'other','other','home','mother',1,2,0,'no','no','no','no','yes','yes','yes','yes',5,4,4,1,1,5,0,'12','11',11);
INSERT INTO `student_por` VALUES('GP','M',15,'U','GT3','T',3,4,'services','services','home','father',1,1,0,'yes','no','no','no','yes','yes','yes','no',5,5,5,3,2,5,2,'9','9',9);
INSERT INTO `student_por` VALUES('GP','F',15,'U','LE3','A',3,4,'other','other','home','mother',1,2,0,'yes','no','no','yes','yes','yes','yes','yes',5,3,2,1,1,1,0,'10','11',11);
INSERT INTO `student_por` VALUES('GP','F',19,'U','GT3','T',0,1,'at_home','other','course','other',1,2,2,'no','yes','no','no','no','no','no','no',3,4,2,1,1,5,0,'9','10',11);
INSERT INTO `student_por` VALUES('GP','M',16,'R','GT3','T',4,4,'teacher','teacher','course','mother',1,1,0,'no','no','no','yes','yes','yes','yes','no',3,5,5,2,5,4,8,'14','14',15);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',2,3,'other','other','course','mother',2,3,0,'no','yes','no','no','no','yes','yes','yes',3,2,3,2,2,1,4,'13','12',13);
INSERT INTO `student_por` VALUES('GP','F',15,'R','GT3','T',3,4,'services','teacher','course','father',2,3,0,'no','yes','no','no','yes','yes','yes','yes',4,2,2,2,2,5,0,'10','11',12);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',2,1,'services','other','reputation','mother',1,2,3,'no','yes','no','yes','yes','no','yes','yes',5,4,5,1,3,5,10,'10','9',8);
INSERT INTO `student_por` VALUES('GP','F',17,'U','LE3','A',2,1,'other','other','course','mother',3,1,0,'no','yes','no','no','yes','yes','yes','no',3,2,2,1,2,5,8,'11','10',11);
INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','T',1,1,'at_home','other','course','mother',3,1,0,'no','yes','no','yes','no','yes','yes','yes',4,3,3,1,2,4,6,'11','12',13);
INSERT INTO `student_por` VALUES('GP','F',17,'U','LE3','T',2,2,'other','other','course','father',1,1,0,'no','yes','no','no','yes','yes','yes','yes',3,4,4,1,3,5,2,'13','12',12);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','A',3,4,'services','other','course','father',1,1,0,'no','no','no','no','yes','yes','yes','no',3,2,1,1,4,5,12,'15','13',14);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',2,1,'at_home','other','course','mother',4,1,0,'no','no','no','no','yes','yes','no','no',3,2,1,1,1,2,4,'9','9',11);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','A',2,2,'other','other','home','mother',1,1,1,'no','no','no','no','yes','yes','no','no',5,3,4,1,1,5,12,'13','11',11);
INSERT INTO `student_por` VALUES('GP','M',15,'R','GT3','T',3,4,'at_home','teacher','course','mother',4,2,0,'no','yes','no','no','yes','yes','no','yes',5,3,3,1,1,5,2,'12','11',11);
INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','T',4,4,'services','at_home','course','mother',1,3,0,'no','yes','no','yes','yes','yes','yes','yes',4,3,3,1,1,5,4,'13','14',15);
INSERT INTO `student_por` VALUES('GP','M',17,'R','GT3','T',3,4,'at_home','other','course','mother',3,2,0,'no','no','no','no','yes','yes','no','no',5,4,5,2,4,5,2,'10','9',10);
INSERT INTO `student_por` VALUES('GP','F',16,'R','GT3','T',1,1,'at_home','other','course','mother',4,2,0,'no','yes','no','no','yes','yes','no','no',5,1,3,1,1,3,0,'14','13',13);
INSERT INTO `student_por` VALUES('GP','M',18,'U','LE3','T',3,1,'services','services','course','mother',2,1,0,'no','no','no','yes','yes','yes','yes','yes',3,3,4,4,5,4,2,'11','11',12);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','A',3,2,'other','services','course','other',1,3,0,'no','yes','no','yes','no','yes','yes','yes',4,3,3,5,1,5,10,'12','11',11);
INSERT INTO `student_por` VALUES('GP','F',16,'R','GT3','T',1,1,'other','services','reputation','mother',2,1,0,'no','yes','no','yes','yes','yes','no','yes',3,3,3,1,2,1,8,'12','11',11);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','A',3,3,'other','other','course','other',2,1,0,'no','yes','no','yes','no','yes','yes','yes',4,3,2,1,1,5,4,'9','9',10);
INSERT INTO `student_por` VALUES('GP','M',16,'U','LE3','T',1,1,'services','other','course','mother',1,2,2,'no','no','no','no','yes','yes','no','yes',4,4,4,1,3,5,0,'10','10',10);
INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','T',4,4,'teacher','teacher','course','mother',2,1,0,'no','no','no','yes','yes','yes','yes','no',4,3,2,1,1,5,6,'13','14',14);
INSERT INTO `student_por` VALUES('GP','F',15,'R','GT3','T',1,1,'other','other','course','mother',3,1,1,'no','no','no','yes','yes','yes','yes','yes',5,5,5,1,1,1,2,'8','9',9);
INSERT INTO `student_por` VALUES('GP','M',15,'U','GT3','T',4,3,'teacher','services','course','father',2,4,0,'yes','yes','no','no','yes','yes','yes','no',2,2,2,1,1,3,6,'9','11',11);
INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','A',3,3,'services','services','home','mother',1,2,0,'no','no','no','no','no','yes','no','yes',1,3,2,2,3,1,24,'9','8',9);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',4,4,'services','services','course','mother',1,3,0,'no','yes','no','yes','yes','yes','yes','no',5,3,3,1,3,5,0,'15','13',13);
INSERT INTO `student_por` VALUES('GP','M',16,'U','LE3','T',2,2,'services','services','reputation','father',2,1,0,'no','yes','no','yes','yes','yes','yes','no',2,3,3,2,2,2,4,'12','11',11);
INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','T',4,4,'teacher','services','course','mother',1,3,0,'no','yes','no','yes','yes','yes','yes','no',4,2,2,1,1,5,2,'13','13',13);
INSERT INTO `student_por` VALUES('GP','F',16,'U','LE3','T',1,1,'at_home','at_home','course','mother',1,1,0,'no','no','no','no','yes','yes','yes','no',3,4,4,3,3,1,4,'10','11',11);
INSERT INTO `student_por` VALUES('GP','M',17,'U','GT3','T',2,1,'other','other','home','mother',1,1,0,'no','yes','no','no','yes','yes','yes','no',5,4,5,1,2,5,22,'9','7',6);
INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','T',1,1,'other','services','course','father',1,2,0,'no','yes','no','no','yes','yes','yes','no',4,4,2,1,2,5,0,'12','12',12);
INSERT INTO `student_por` VALUES('GP','F',15,'U','LE3','A',2,1,'at_home','other','home','mother',2,1,0,'no','yes','no','yes','yes','no','yes','yes',4,4,2,1,1,5,0,'11','10',10);
INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','T',3,2,'health','services','home','father',1,2,1,'no','yes','no','no','yes','yes','yes','no',3,3,2,1,1,3,2,'11','11',11);
INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','T',1,2,'at_home','other','course','mother',1,2,0,'no','yes','no','no','no','yes','yes','no',4,3,2,1,1,5,6,'13','12',13);
INSERT INTO `student_por` VALUES('GP','F',15,'U','GT3','T',1,2,'at_home','services','course','father',1,2,0,'no','no','no','no','no','yes','no','yes',2,3,4,2,4,1,6,'11','11',11);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',4,4,'teacher','teacher','course','mother',1,1,0,'no','yes','no','no','yes','no','yes','yes',3,3,2,2,1,5,16,'9','9',8);
INSERT INTO `student_por` VALUES('GP','M',15,'U','LE3','A',2,1,'services','other','course','mother',4,1,0,'no','no','no','no','yes','yes','yes','no',4,5,5,2,5,5,0,'12','11',11);
INSERT INTO `student_por` VALUES('GP','M',18,'U','LE3','T',1,1,'other','other','course','mother',1,1,2,'no','no','no','no','yes','no','yes','yes',2,3,5,2,5,4,0,'11','9',0);
INSERT INTO `student_por` VALUES('GP','M',16,'U','LE3','T',2,1,'at_home','other','course','mother',1,1,1,'no','no','no','yes','yes','yes','no','yes',4,4,4,3,5,5,6,'9','10',10);
INSERT INTO `student_por` VALUES('GP','F',15,'R','GT3','T',3,3,'services','services','reputation','other',2,3,0,'no','yes','yes','yes','yes','yes','yes','yes',4,2,1,2,3,3,2,'13','13',13);
INSERT INTO `student_por` VALUES('GP','M',19,'U','GT3','T',3,2,'services','at_home','home','mother',1,1,0,'no','yes','no','no','yes','no','yes','yes',4,5,4,1,1,4,6,'11','9',11);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',4,4,'other','teacher','course','mother',1,1,0,'yes','yes','no','no','yes','yes','no','yes',4,2,1,1,1,4,0,'13','13',13);
INSERT INTO `student_por` VALUES('GP','M',15,'R','GT3','T',2,3,'at_home','services','course','mother',1,2,0,'yes','no','yes','yes','yes','yes','no','no',4,4,4,1,1,1,0,'7','8',8);
INSERT INTO `student_por` VALUES('GP','M',17,'R','LE3','T',1,2,'other','other','reputation','mother',1,1,3,'no','no','no','no','yes','yes','no','no',2,2,2,3,3,5,14,'9','8',10);
INSERT INTO `student_por` VALUES('GP','F',18,'R','GT3','T',1,1,'at_home','other','course','mother',3,1,3,'no','yes','no','yes','no','yes','no','no',5,2,5,1,5,4,6,'11','10',11);
INSERT INTO `student_por` VALUES('GP','M',16,'R','GT3','T',2,2,'at_home','other','course','mother',3,1,0,'no','no','no','no','no','yes','no','no',4,2,2,1,2,3,4,'12','10',11);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',3,3,'other','services','course','father',1,2,1,'no','yes','no','no','yes','yes','yes','yes',4,5,5,4,4,5,0,'10','10',1);
INSERT INTO `student_por` VALUES('GP','M',16,'U','LE3','T',1,2,'health','services','course','mother',2,1,2,'no','no','no','no','no','yes','yes','no',4,4,5,3,5,5,0,'9','8',10);
INSERT INTO `student_por` VALUES('GP','M',17,'R','LE3','T',2,1,'at_home','other','course','mother',2,1,1,'no','no','yes','yes','yes','no','yes','yes',3,3,2,2,2,5,8,'8','8',9);
INSERT INTO `student_por` VALUES('GP','M',17,'R','GT3','T',3,2,'other','other','course','mother',2,2,2,'yes','yes','no','no','yes','yes','yes','yes',4,4,4,1,4,3,4,'7','6',8);
INSERT INTO `student_por` VALUES('GP','M',15,'U','LE3','T',1,2,'other','other','course','mother',2,1,0,'no','no','no','yes','yes','yes','no','no',4,4,4,2,4,5,2,'8','9',10);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',1,3,'at_home','services','course','father',1,1,1,'no','no','no','no','yes','no','yes','no',5,3,3,1,4,2,2,'9','8',8);
INSERT INTO `student_por` VALUES('GP','M',17,'R','LE3','T',1,1,'other','services','course','mother',4,2,0,'no','no','no','yes','yes','no','no','yes',5,3,5,1,5,5,0,'8','8',8);
INSERT INTO `student_por` VALUES('GP','M',17,'U','GT3','T',3,2,'services','services','course','mother',2,1,3,'no','yes','no','yes','no','no','no','no',4,5,2,1,1,2,10,'8','7',8);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',2,2,'other','other','course','father',1,2,0,'no','no','no','no','yes','no','yes','no',4,3,5,2,4,4,0,'9','10',11);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',4,2,'health','services','home','father',1,2,0,'no','no','no','no','yes','yes','yes','yes',4,2,3,1,1,3,0,'17','17',18);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',2,2,'other','other','home','mother',1,2,0,'no','yes','no','no','no','yes','yes','no',5,1,5,1,1,4,0,'12','12',13);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',4,4,'health','health','reputation','mother',1,2,0,'no','yes','no','no','yes','yes','yes','yes',4,4,2,1,1,3,0,'16','16',17);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',3,4,'other','other','course','father',3,1,1,'no','yes','no','yes','no','yes','yes','no',3,4,5,2,4,2,4,'9','9',10);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',1,0,'other','other','reputation','mother',2,2,0,'no','yes','no','yes','yes','yes','yes','yes',4,3,2,1,1,3,0,'16','17',18);
INSERT INTO `student_por` VALUES('GP','M',17,'U','LE3','T',4,4,'teacher','other','reputation','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','no',4,4,4,1,3,5,0,'11','9',10);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',1,3,'at_home','services','home','mother',1,2,0,'no','no','no','yes','no','yes','yes','yes',4,3,5,1,1,3,0,'14','13',13);
INSERT INTO `student_por` VALUES('GP','F',16,'U','LE3','T',3,3,'other','other','reputation','mother',2,2,0,'no','yes','no','yes','yes','yes','yes','no',4,4,5,1,1,4,0,'14','14',15);
INSERT INTO `student_por` VALUES('GP','M',17,'U','LE3','T',4,3,'teacher','other','course','mother',2,2,0,'no','no','no','yes','yes','yes','yes','no',4,4,4,4,4,4,0,'10','11',11);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',2,2,'services','other','reputation','mother',2,2,0,'no','no','no','yes','no','yes','yes','no',3,4,4,1,4,5,0,'13','12',14);
INSERT INTO `student_por` VALUES('GP','M',17,'U','GT3','T',3,3,'other','other','reputation','father',1,2,0,'no','no','no','yes','no','yes','yes','no',4,3,4,1,4,4,4,'11','9',10);
INSERT INTO `student_por` VALUES('GP','M',16,'R','GT3','T',4,2,'teacher','services','other','mother',1,1,0,'no','yes','no','yes','yes','yes','yes','yes',4,3,3,3,4,3,8,'10','9',11);
INSERT INTO `student_por` VALUES('GP','M',17,'U','GT3','T',4,3,'other','other','course','mother',1,2,0,'no','yes','yes','yes','yes','yes','yes','yes',5,2,3,1,1,2,4,'11','11',13);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',4,3,'teacher','other','home','mother',1,2,0,'no','yes','yes','yes','yes','yes','yes','no',3,4,3,2,3,3,4,'11','10',11);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',3,3,'services','other','home','mother',1,2,0,'no','no','no','yes','yes','yes','yes','yes',4,2,3,1,2,3,0,'11','12',13);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',2,4,'services','services','reputation','father',1,2,0,'no','yes','no','yes','yes','yes','no','no',5,4,2,2,3,5,0,'17','18',17);
INSERT INTO `student_por` VALUES('GP','F',17,'U','LE3','T',3,3,'other','other','reputation','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','yes',5,3,3,2,3,1,32,'14','13',14);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',3,2,'other','other','reputation','mother',1,2,0,'no','yes','no','no','yes','yes','yes','no',1,2,2,1,2,1,8,'14','15',16);
INSERT INTO `student_por` VALUES('GP','M',17,'U','GT3','T',3,3,'services','services','other','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','yes',4,3,4,2,3,4,6,'11','13',14);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',1,2,'services','services','other','mother',1,1,0,'no','yes','no','yes','yes','yes','yes','yes',3,3,3,1,2,3,0,'10','9',11);
INSERT INTO `student_por` VALUES('GP','M',16,'U','LE3','T',2,1,'other','other','course','mother',1,2,0,'no','no','no','yes','yes','yes','yes','yes',4,2,3,1,2,5,0,'13','14',16);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','A',3,3,'health','other','reputation','mother',1,2,0,'no','yes','no','no','no','yes','yes','yes',3,3,3,1,3,3,10,'12','13',14);
INSERT INTO `student_por` VALUES('GP','M',17,'R','GT3','T',1,2,'at_home','other','home','mother',1,2,0,'no','no','no','no','yes','yes','no','no',3,1,3,1,5,3,6,'9','9',10);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',2,3,'services','services','course','mother',1,2,0,'no','no','no','no','yes','yes','yes','no',4,3,3,1,1,2,6,'12','12',13);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',1,1,'at_home','services','course','mother',1,2,0,'no','no','no','yes','yes','yes','yes','no',5,3,3,1,1,3,0,'12','11',12);
INSERT INTO `student_por` VALUES('GP','M',17,'U','GT3','T',1,2,'at_home','services','other','other',2,2,0,'no','no','no','yes','no','yes','yes','no',4,4,4,4,5,5,16,'10','11',12);
INSERT INTO `student_por` VALUES('GP','M',16,'R','GT3','T',3,3,'services','services','reputation','mother',1,1,0,'no','yes','no','yes','yes','yes','yes','no',4,3,2,3,4,5,0,'11','10',10);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',2,3,'other','other','home','father',2,1,0,'no','no','no','no','yes','yes','yes','no',5,3,3,1,1,3,0,'13','12',12);
INSERT INTO `student_por` VALUES('GP','F',17,'U','LE3','T',2,4,'services','services','course','father',1,2,0,'no','no','no','yes','yes','yes','yes','yes',4,3,2,1,1,5,8,'14','15',16);
INSERT INTO `student_por` VALUES('GP','M',17,'U','GT3','T',4,4,'services','teacher','home','mother',1,1,0,'no','no','no','no','yes','yes','yes','no',5,2,3,1,2,5,4,'13','13',14);
INSERT INTO `student_por` VALUES('GP','M',16,'R','LE3','T',3,3,'teacher','other','home','father',3,1,0,'no','yes','no','yes','yes','yes','yes','no',3,3,4,3,5,3,16,'10','11',12);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',4,4,'services','teacher','home','mother',2,1,1,'no','yes','no','no','yes','yes','yes','no',4,2,4,2,3,2,30,'14','15',16);
INSERT INTO `student_por` VALUES('GP','F',16,'U','LE3','T',4,4,'teacher','teacher','reputation','mother',1,2,0,'no','yes','no','no','yes','yes','yes','no',4,5,2,1,2,3,0,'11','10',11);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',4,3,'health','other','home','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','no',4,3,5,1,5,2,2,'14','14',15);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',2,3,'other','other','reputation','mother',1,2,0,'yes','yes','no','yes','yes','yes','no','no',4,4,3,1,3,4,4,'11','12',12);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',1,1,'other','other','course','mother',1,2,0,'no','yes','no','no','no','yes','no','no',4,4,4,1,3,1,0,'14','15',15);
INSERT INTO `student_por` VALUES('GP','F',17,'R','GT3','T',2,2,'other','other','reputation','mother',1,1,0,'no','yes','no','no','yes','yes','yes','no',5,3,2,1,2,3,21,'13','13',13);
INSERT INTO `student_por` VALUES('GP','F',16,'R','GT3','T',2,2,'services','services','reputation','mother',2,4,0,'no','yes','no','yes','no','yes','yes','no',5,3,5,1,1,5,6,'13','13',13);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',3,4,'at_home','services','home','mother',1,3,1,'no','yes','yes','no','yes','yes','yes','yes',4,4,3,3,4,5,14,'8','9',8);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','A',3,1,'services','other','course','mother',1,2,0,'no','yes','no','no','yes','yes','yes','no',2,3,3,2,2,4,2,'11','11',12);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',4,3,'teacher','other','other','mother',1,2,0,'no','no','no','yes','yes','yes','yes','yes',1,3,2,1,1,1,4,'14','15',15);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',1,1,'at_home','other','home','mother',2,1,0,'no','yes','no','no','yes','yes','no','no',4,3,2,1,4,5,2,'12','13',13);
INSERT INTO `student_por` VALUES('GP','F',17,'R','GT3','T',4,3,'teacher','other','reputation','mother',2,3,0,'no','yes','no','yes','yes','yes','yes','yes',4,4,2,1,1,4,0,'11','12',12);
INSERT INTO `student_por` VALUES('GP','F',19,'U','GT3','T',3,3,'other','other','reputation','other',1,4,0,'no','yes','no','yes','yes','yes','yes','no',4,3,3,1,2,3,4,'12','12',12);
INSERT INTO `student_por` VALUES('GP','M',17,'U','LE3','T',4,4,'services','other','home','mother',1,2,0,'no','yes','no','no','yes','yes','yes','yes',5,3,5,4,5,3,15,'13','12',12);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','A',2,2,'other','other','reputation','mother',1,2,0,'yes','yes','no','no','yes','yes','yes','no',3,3,4,1,1,4,0,'13','13',13);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',2,2,'services','other','home','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','no',4,4,4,2,4,5,10,'12','11',11);
INSERT INTO `student_por` VALUES('GP','F',17,'R','LE3','T',4,4,'services','other','other','mother',1,1,0,'no','yes','no','no','yes','yes','no','no',5,2,1,1,2,3,6,'12','11',11);
INSERT INTO `student_por` VALUES('GP','F',17,'U','LE3','T',3,2,'other','other','reputation','mother',2,2,0,'no','no','no','no','yes','yes','yes','no',4,4,4,1,3,1,2,'14','16',15);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',4,3,'other','other','reputation','mother',1,2,0,'no','no','no','no','yes','yes','yes','yes',3,4,5,2,4,1,16,'11','9',10);
INSERT INTO `student_por` VALUES('GP','M',18,'U','LE3','T',3,3,'services','health','home','father',1,2,0,'no','yes','no','no','yes','yes','yes','no',3,2,4,2,4,4,10,'10','10',10);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',2,3,'at_home','other','home','father',2,1,0,'no','yes','no','no','yes','yes','no','no',3,3,3,1,4,3,4,'12','13',13);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',2,2,'at_home','at_home','course','mother',1,3,0,'no','yes','no','yes','yes','yes','yes','no',4,3,3,1,1,4,0,'12','12',13);
INSERT INTO `student_por` VALUES('GP','F',17,'R','GT3','T',2,1,'at_home','services','reputation','mother',2,2,0,'no','yes','no','yes','yes','yes','yes','no',4,2,5,1,2,5,0,'11','10',11);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',1,1,'at_home','other','reputation','mother',1,3,0,'no','yes','no','yes','yes','yes','no','yes',4,3,4,1,1,5,12,'12','12',12);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',2,3,'services','teacher','other','mother',1,2,0,'yes','no','no','no','yes','yes','yes','no',2,3,1,1,1,3,0,'13','13',14);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',2,2,'other','other','home','mother',2,2,3,'no','yes','yes','no','yes','yes','yes','no',3,3,3,5,5,4,9,'10','9',10);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',4,4,'teacher','services','home','mother',1,3,0,'no','yes','no','yes','no','yes','yes','no',5,3,2,1,1,5,4,'15','16',16);
INSERT INTO `student_por` VALUES('GP','F',18,'R','GT3','T',3,1,'other','other','reputation','mother',1,2,0,'no','no','no','yes','yes','yes','yes','yes',5,3,3,1,1,4,4,'8','8',8);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',3,2,'other','other','course','mother',1,2,0,'no','no','no','yes','no','yes','yes','no',5,3,4,1,3,3,2,'17','18',17);
INSERT INTO `student_por` VALUES('GP','M',17,'U','LE3','T',2,3,'services','services','reputation','father',1,2,0,'no','yes','no','no','no','yes','yes','no',5,3,3,1,3,3,0,'10','11',11);
INSERT INTO `student_por` VALUES('GP','M',18,'U','LE3','T',2,1,'at_home','other','course','mother',4,2,0,'yes','yes','no','yes','yes','yes','yes','yes',4,3,2,4,5,3,2,'9','10',11);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','A',2,1,'other','other','course','mother',2,3,0,'no','no','no','yes','yes','yes','yes','yes',3,2,3,1,2,3,0,'15','15',16);
INSERT INTO `student_por` VALUES('GP','F',17,'U','LE3','T',4,3,'health','other','reputation','father',1,2,0,'no','no','no','yes','yes','yes','yes','yes',3,2,3,1,2,3,0,'14','12',12);
INSERT INTO `student_por` VALUES('GP','M',17,'R','GT3','T',2,2,'other','other','course','father',2,2,0,'no','yes','no','yes','yes','yes','yes','no',4,5,2,1,1,1,0,'12','13',13);
INSERT INTO `student_por` VALUES('GP','M',17,'U','GT3','T',4,4,'teacher','teacher','reputation','mother',1,2,0,'yes','yes','no','yes','yes','yes','yes','yes',4,5,5,1,3,2,0,'13','13',13);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',4,4,'health','other','reputation','father',1,2,0,'no','yes','no','yes','yes','yes','yes','no',4,2,4,2,4,1,0,'13','13',14);
INSERT INTO `student_por` VALUES('GP','M',16,'U','LE3','T',1,1,'other','other','home','mother',2,2,0,'no','yes','no','no','yes','yes','yes','no',3,4,2,1,1,5,2,'9','9',9);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',3,2,'at_home','other','reputation','mother',2,3,0,'no','no','no','yes','yes','yes','yes','yes',5,3,3,1,3,2,0,'12','12',12);
INSERT INTO `student_por` VALUES('GP','M',17,'U','LE3','T',2,2,'other','other','home','father',1,2,0,'no','no','no','yes','no','yes','yes','yes',4,4,2,5,5,4,0,'16','16',16);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',2,1,'other','other','home','mother',1,1,0,'no','no','no','no','yes','yes','yes','yes',4,5,2,1,1,5,4,'9','10',10);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','A',4,1,'other','other','home','mother',1,2,0,'no','no','no','yes','yes','yes','yes','yes',5,3,3,1,2,5,0,'14','13',13);
INSERT INTO `student_por` VALUES('GP','F',18,'U','LE3','A',2,4,'services','other','course','mother',2,2,1,'no','yes','no','no','yes','yes','yes','no',4,3,3,1,1,3,18,'10','10',10);
INSERT INTO `student_por` VALUES('GP','F',18,'U','LE3','T',2,2,'at_home','services','course','mother',1,2,1,'no','yes','no','no','no','yes','yes','yes',5,3,1,1,1,5,16,'9','8',10);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',3,3,'other','other','course','mother',2,1,1,'no','no','no','no','yes','no','yes','no',4,1,1,1,1,3,14,'8','7',7);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',2,2,'other','at_home','course','other',1,1,1,'no','yes','no','yes','no','no','yes','yes',4,4,3,2,2,1,26,'7','8',8);
INSERT INTO `student_por` VALUES('GP','M',17,'U','GT3','T',4,4,'teacher','teacher','course','mother',1,1,0,'no','yes','no','yes','no','yes','yes','no',4,2,1,1,2,5,6,'10','8',9);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',3,2,'other','other','course','father',1,2,0,'no','no','no','yes','yes','yes','no','no',5,4,2,1,1,3,4,'14','14',15);
INSERT INTO `student_por` VALUES('GP','F',17,'U','LE3','T',1,1,'at_home','at_home','course','mother',1,3,0,'no','yes','no','yes','yes','yes','yes','yes',4,3,2,1,2,4,10,'11','10',10);
INSERT INTO `student_por` VALUES('GP','F',16,'U','GT3','T',1,2,'other','other','course','mother',1,1,0,'no','no','no','no','yes','no','yes','no',5,3,5,1,2,5,4,'12','11',11);
INSERT INTO `student_por` VALUES('GP','F',17,'R','GT3','T',2,1,'at_home','services','course','mother',3,2,0,'no','no','no','yes','yes','yes','no','no',2,1,1,1,1,3,2,'13','13',13);
INSERT INTO `student_por` VALUES('GP','F',17,'R','LE3','A',1,4,'other','other','course','other',4,1,1,'no','yes','no','no','yes','yes','yes','no',5,5,4,1,1,5,14,'9','9',8);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',2,2,'other','services','reputation','father',1,2,0,'no','no','no','no','yes','no','yes','no',5,5,4,3,5,2,16,'8','7',8);
INSERT INTO `student_por` VALUES('GP','F',17,'U','LE3','A',2,2,'other','other','home','mother',1,1,1,'no','yes','no','no','no','no','yes','no',3,1,2,1,1,1,8,'11','9',10);
INSERT INTO `student_por` VALUES('GP','F',17,'R','LE3','T',1,1,'at_home','other','course','mother',2,3,0,'no','no','no','yes','yes','yes','yes','no',4,3,3,1,3,5,4,'15','14',15);
INSERT INTO `student_por` VALUES('GP','F',17,'U','LE3','A',4,2,'teacher','other','course','mother',1,2,0,'no','yes','no','yes','yes','yes','no','no',4,3,2,1,1,4,4,'15','14',14);
INSERT INTO `student_por` VALUES('GP','M',17,'U','LE3','T',4,3,'health','other','course','mother',2,2,0,'no','no','no','yes','yes','yes','yes','yes',2,5,5,1,4,5,8,'15','15',15);
INSERT INTO `student_por` VALUES('GP','M',17,'R','LE3','A',4,4,'teacher','other','course','mother',2,2,0,'no','yes','no','no','yes','yes','yes','no',3,3,3,2,3,4,0,'12','12',12);
INSERT INTO `student_por` VALUES('GP','M',16,'U','LE3','T',4,3,'teacher','other','course','mother',1,1,0,'no','no','no','yes','no','yes','yes','no',5,4,5,1,1,3,7,'14','14',15);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',4,4,'services','services','course','mother',1,1,0,'no','no','yes','yes','yes','yes','yes','no',5,3,2,1,2,5,4,'14','15',15);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',4,4,'teacher','services','course','mother',1,2,0,'no','yes','yes','no','yes','yes','yes','yes',5,3,1,1,4,5,2,'11','11',12);
INSERT INTO `student_por` VALUES('GP','M',17,'R','GT3','T',1,1,'other','other','home','father',2,3,0,'no','no','no','no','no','yes','yes','yes',4,3,3,1,1,1,2,'13','14',15);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',3,3,'services','other','home','mother',2,3,0,'no','yes','no','no','yes','yes','yes','yes',4,2,2,2,3,5,10,'11','11',11);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',1,1,'at_home','other','course','mother',1,2,0,'yes','no','no','no','no','yes','no','yes',4,3,2,1,1,4,10,'10','9',10);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',2,1,'other','other','course','other',2,3,0,'no','yes','no','no','no','yes','yes','yes',4,4,4,1,1,3,10,'12','10',11);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',2,1,'other','other','course','mother',3,1,0,'no','no','no','no','yes','yes','yes','no',4,3,3,1,1,4,7,'15','16',16);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',1,1,'other','services','course','father',1,2,0,'no','yes','no','no','yes','yes','no','no',4,3,4,1,2,5,4,'11','10',11);
INSERT INTO `student_por` VALUES('GP','M',17,'U','GT3','T',2,3,'other','other','course','father',2,1,0,'no','no','no','no','yes','yes','yes','no',5,2,2,1,1,2,2,'9','12',13);
INSERT INTO `student_por` VALUES('GP','M',22,'U','GT3','T',3,1,'services','services','other','mother',1,1,3,'no','no','no','no','no','no','yes','yes',5,4,5,5,5,1,12,'7','8',5);
INSERT INTO `student_por` VALUES('GP','M',18,'R','LE3','T',3,3,'other','services','course','mother',1,2,0,'no','yes','no','no','yes','yes','yes','yes',4,3,3,1,3,5,8,'10','9',10);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',0,2,'other','other','other','mother',1,1,0,'no','no','no','no','no','yes','yes','no',4,3,2,2,4,5,0,'11','12',11);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',3,2,'services','other','course','mother',2,1,0,'no','no','no','no','yes','no','yes','no',4,4,5,2,4,5,8,'7','8',7);
INSERT INTO `student_por` VALUES('GP','M',16,'U','GT3','T',3,3,'at_home','other','reputation','other',3,2,1,'yes','yes','no','no','no','yes','yes','no',5,3,3,1,3,2,4,'9','11',10);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',2,1,'services','services','other','mother',1,1,2,'no','no','no','no','no','no','yes','no',3,2,5,2,5,5,4,'7','8',6);
INSERT INTO `student_por` VALUES('GP','M',16,'R','GT3','T',2,1,'other','other','course','mother',2,1,0,'no','no','no','yes','no','yes','no','no',3,3,2,1,3,3,2,'14','13',12);
INSERT INTO `student_por` VALUES('GP','M',17,'R','GT3','T',2,1,'other','other','course','mother',1,1,0,'no','no','no','no','no','yes','yes','no',4,4,2,2,4,5,0,'12','12',13);
INSERT INTO `student_por` VALUES('GP','M',17,'U','LE3','T',1,1,'health','other','course','mother',2,1,1,'no','yes','no','yes','yes','yes','yes','no',4,4,4,1,2,5,0,'9','10',10);
INSERT INTO `student_por` VALUES('GP','F',18,'U','LE3','A',2,1,'other','other','course','mother',1,2,0,'no','yes','no','no','no','yes','yes','yes',4,3,4,1,3,5,2,'12','12',13);
INSERT INTO `student_por` VALUES('GP','F',17,'U','LE3','T',4,2,'teacher','services','reputation','mother',1,4,0,'no','yes','no','yes','yes','yes','yes','no',4,2,3,1,1,4,2,'14','15',17);
INSERT INTO `student_por` VALUES('GP','F',19,'U','GT3','T',2,2,'services','services','home','mother',1,2,0,'no','yes','no','no','yes','yes','yes','no',4,3,3,1,1,5,0,'10','10',11);
INSERT INTO `student_por` VALUES('GP','M',18,'U','LE3','T',2,1,'services','other','course','mother',3,2,1,'no','no','no','yes','no','no','yes','no',4,4,5,4,4,5,4,'11','10',11);
INSERT INTO `student_por` VALUES('GP','F',17,'R','GT3','T',4,2,'other','other','course','mother',1,3,0,'no','yes','no','yes','yes','yes','yes','no',4,3,4,1,3,5,2,'11','12',14);
INSERT INTO `student_por` VALUES('GP','F',18,'U','LE3','T',1,1,'other','at_home','home','mother',1,3,0,'no','yes','no','no','no','yes','no','no',4,4,3,2,3,3,4,'11','12',14);
INSERT INTO `student_por` VALUES('GP','F',18,'R','GT3','T',2,2,'other','other','home','mother',1,2,0,'yes','no','no','no','yes','yes','no','no',3,2,3,1,1,5,4,'11','11',13);
INSERT INTO `student_por` VALUES('GP','M',19,'U','LE3','A',4,3,'services','at_home','reputation','mother',1,2,0,'no','yes','no','no','yes','yes','yes','no',4,3,1,1,1,1,4,'11','13',14);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',2,1,'other','other','home','mother',1,2,0,'no','no','no','yes','yes','yes','yes','no',5,2,4,1,2,4,2,'16','16',16);
INSERT INTO `student_por` VALUES('GP','M',17,'R','GT3','T',2,2,'other','services','other','mother',2,1,0,'no','no','no','no','no','no','no','no',5,2,2,1,1,4,0,'9','10',10);
INSERT INTO `student_por` VALUES('GP','F',17,'U','LE3','T',2,2,'services','services','course','father',1,4,0,'no','no','no','yes','yes','yes','yes','yes',3,4,1,1,1,2,2,'10','11',12);
INSERT INTO `student_por` VALUES('GP','F',20,'R','GT3','T',2,1,'other','other','course','other',2,2,0,'no','yes','yes','yes','yes','no','yes','yes',1,2,3,1,2,2,8,'10','12',12);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',4,3,'services','other','home','father',1,2,0,'no','yes','no','no','yes','yes','yes','yes',3,1,2,1,3,2,2,'15','15',15);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',4,3,'teacher','other','course','mother',1,2,0,'no','yes','no','no','no','yes','yes','no',4,3,2,1,1,3,2,'10','10',11);
INSERT INTO `student_por` VALUES('GP','M',18,'R','GT3','T',3,2,'other','other','course','mother',1,3,0,'no','no','no','yes','no','yes','no','no',5,3,2,1,1,3,2,'10','11',12);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',3,3,'other','other','home','mother',1,3,0,'no','no','no','yes','no','yes','no','no',3,2,3,1,1,4,2,'15','12',13);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',2,2,'at_home','services','home','mother',1,3,0,'no','yes','no','yes','yes','yes','yes','yes',4,3,3,1,1,3,0,'11','12',13);
INSERT INTO `student_por` VALUES('GP','M',17,'U','GT3','T',2,2,'other','other','home','father',2,1,0,'no','no','no','no','yes','no','yes','no',4,4,4,2,3,4,8,'8','8',9);
INSERT INTO `student_por` VALUES('GP','M',18,'R','LE3','A',3,4,'other','other','reputation','mother',2,2,0,'no','yes','no','yes','yes','yes','yes','no',4,2,5,3,4,1,6,'15','16',16);
INSERT INTO `student_por` VALUES('GP','M',17,'U','GT3','T',3,1,'services','other','other','mother',1,2,0,'no','no','no','yes','yes','yes','yes','yes',5,4,4,3,4,5,0,'11','11',14);
INSERT INTO `student_por` VALUES('GP','F',18,'R','GT3','T',4,4,'teacher','other','reputation','mother',2,2,0,'no','no','no','yes','yes','yes','yes','no',4,3,4,2,2,4,8,'10','11',12);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',4,2,'health','other','reputation','father',1,2,0,'no','yes','no','yes','yes','yes','yes','yes',5,4,5,1,3,5,4,'10','12',14);
INSERT INTO `student_por` VALUES('GP','F',18,'R','GT3','T',2,1,'other','other','reputation','mother',2,2,0,'no','yes','no','no','yes','no','yes','yes',4,3,5,1,2,3,12,'8','9',10);
INSERT INTO `student_por` VALUES('GP','F',19,'U','GT3','T',3,3,'other','services','home','other',1,2,0,'no','yes','no','yes','yes','yes','yes','no',4,3,5,3,3,5,16,'11','12',12);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',2,3,'other','services','reputation','father',1,4,0,'no','yes','no','yes','yes','yes','yes','yes',4,5,5,1,3,2,10,'16','16',16);
INSERT INTO `student_por` VALUES('GP','F',18,'U','LE3','T',1,1,'other','other','home','mother',2,2,0,'no','yes','no','no','no','yes','no','no',4,4,3,1,1,3,2,'13','13',13);
INSERT INTO `student_por` VALUES('GP','M',17,'R','GT3','T',1,2,'at_home','at_home','home','mother',1,2,0,'no','yes','no','yes','no','yes','no','yes',3,5,2,2,2,1,2,'16','17',18);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',2,1,'other','other','home','mother',1,2,0,'no','yes','no','no','yes','yes','yes','yes',4,2,5,1,2,1,8,'14','14',15);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',2,4,'at_home','health','reputation','mother',2,2,0,'no','yes','no','no','yes','yes','yes','yes',4,3,3,1,1,1,6,'15','16',16);
INSERT INTO `student_por` VALUES('GP','F',17,'U','LE3','T',2,2,'services','other','course','mother',2,2,0,'yes','yes','no','no','yes','yes','yes','yes',4,4,4,2,3,5,6,'12','12',12);
INSERT INTO `student_por` VALUES('GP','F',18,'R','GT3','A',3,2,'other','services','home','mother',2,2,0,'no','no','no','no','no','no','yes','yes',4,1,1,1,1,5,15,'12','9',10);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',4,4,'teacher','services','home','mother',2,1,0,'no','no','no','yes','yes','yes','yes','no',3,2,4,1,4,3,6,'11','12',12);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',4,4,'health','health','reputation','father',1,2,1,'yes','yes','no','yes','yes','yes','yes','yes',2,4,4,1,1,4,2,'14','12',13);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',2,2,'other','services','reputation','father',3,3,0,'no','yes','no','no','yes','yes','yes','yes',4,2,3,1,1,1,8,'13','15',15);
INSERT INTO `student_por` VALUES('GP','F',19,'R','GT3','T',3,2,'services','services','reputation','father',1,2,1,'yes','yes','no','no','yes','no','yes','no',3,3,3,4,3,3,0,'9','8',10);
INSERT INTO `student_por` VALUES('GP','M',18,'U','LE3','T',4,3,'teacher','services','course','mother',2,1,0,'no','no','no','yes','yes','yes','yes','no',4,2,3,1,2,1,0,'10','10',10);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',1,2,'at_home','other','home','other',2,1,0,'no','no','no','no','no','no','yes','no',3,4,4,2,4,4,10,'10','10',11);
INSERT INTO `student_por` VALUES('GP','M',17,'U','LE3','A',4,1,'services','other','home','mother',2,1,0,'no','no','no','yes','yes','yes','yes','yes',4,5,4,2,4,5,22,'11','11',10);
INSERT INTO `student_por` VALUES('GP','M',17,'U','LE3','A',3,2,'teacher','services','home','mother',1,1,0,'no','no','no','no','yes','yes','yes','no',4,4,4,3,4,3,18,'13','13',13);
INSERT INTO `student_por` VALUES('GP','F',18,'R','LE3','T',1,1,'at_home','other','reputation','mother',2,4,0,'no','yes','no','yes','yes','yes','no','no',5,2,2,1,1,3,2,'17','17',18);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',1,1,'other','other','home','mother',2,2,0,'yes','no','no','yes','yes','yes','yes','no',5,4,4,1,1,4,0,'12','13',13);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',2,2,'other','other','course','mother',1,2,0,'no','yes','no','no','no','yes','yes','no',5,4,5,1,2,5,12,'12','12',14);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',2,1,'other','other','reputation','mother',2,2,0,'no','no','no','yes','yes','yes','yes','yes',4,3,1,1,1,5,10,'12','13',14);
INSERT INTO `student_por` VALUES('GP','M',17,'U','GT3','T',1,1,'other','other','reputation','father',1,2,0,'no','no','no','no','no','yes','yes','no',4,3,3,1,2,4,0,'12','12',12);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',2,2,'at_home','at_home','other','mother',1,3,0,'no','yes','no','no','yes','yes','yes','no',4,3,3,1,2,2,0,'18','18',18);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',1,1,'services','teacher','reputation','mother',1,3,0,'no','yes','no','no','yes','yes','yes','no',4,3,3,1,1,3,0,'13','13',14);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',2,1,'services','services','reputation','mother',1,3,0,'no','no','no','yes','yes','yes','yes','no',4,2,4,1,3,2,0,'14','15',15);
INSERT INTO `student_por` VALUES('GP','M',18,'U','LE3','A',4,4,'teacher','teacher','reputation','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','no',5,4,3,1,1,2,0,'17','17',17);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',4,2,'teacher','other','home','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','yes',4,3,2,1,4,5,2,'15','16',16);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',4,3,'health','services','reputation','mother',1,3,0,'no','yes','no','no','yes','yes','yes','no',4,2,2,1,2,3,0,'17','18',18);
INSERT INTO `student_por` VALUES('GP','F',17,'R','LE3','T',3,1,'services','other','reputation','mother',2,4,0,'no','yes','no','no','yes','yes','no','no',3,1,2,1,1,3,0,'18','19',19);
INSERT INTO `student_por` VALUES('GP','M',18,'R','LE3','T',3,2,'services','other','reputation','mother',2,3,0,'no','yes','no','yes','yes','yes','yes','no',5,4,2,1,1,4,0,'14','15',15);
INSERT INTO `student_por` VALUES('GP','M',17,'U','GT3','T',3,3,'health','other','home','mother',1,1,0,'no','yes','no','no','yes','yes','yes','no',4,4,3,1,3,5,0,'14','15',15);
INSERT INTO `student_por` VALUES('GP','F',19,'U','GT3','T',4,4,'health','other','reputation','other',2,2,0,'no','yes','no','yes','yes','yes','yes','no',2,3,4,2,3,2,2,'14','13',13);
INSERT INTO `student_por` VALUES('GP','F',18,'U','LE3','T',4,3,'other','other','home','other',2,2,0,'no','yes','no','no','yes','yes','yes','yes',4,4,5,1,2,2,0,'13','14',14);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',4,3,'other','other','reputation','father',1,4,0,'no','yes','no','no','yes','yes','yes','no',4,3,3,1,1,3,0,'16','17',17);
INSERT INTO `student_por` VALUES('GP','M',18,'U','LE3','T',4,4,'teacher','teacher','home','mother',1,1,0,'no','yes','no','no','yes','yes','yes','yes',1,4,2,2,2,1,0,'18','18',17);
INSERT INTO `student_por` VALUES('GP','F',18,'U','LE3','A',4,4,'health','other','home','mother',1,2,0,'no','yes','yes','no','yes','yes','yes','yes',4,2,4,1,1,4,0,'14','15',15);
INSERT INTO `student_por` VALUES('GP','M',17,'U','LE3','T',4,4,'other','teacher','home','father',2,1,0,'no','no','no','no','yes','yes','yes','no',4,1,1,2,2,5,0,'12','13',13);
INSERT INTO `student_por` VALUES('GP','F',17,'R','GT3','T',4,4,'services','services','reputation','mother',2,3,0,'no','yes','no','yes','yes','yes','yes','no',5,3,4,1,1,5,0,'7','7',8);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',4,2,'other','other','reputation','mother',2,3,0,'no','yes','no','no','yes','yes','yes','no',4,3,3,1,1,3,0,'16','16',16);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',3,2,'health','health','reputation','father',1,4,0,'no','yes','no','yes','no','yes','yes','no',5,2,2,1,2,5,0,'18','18',18);
INSERT INTO `student_por` VALUES('GP','M',19,'R','LE3','T',2,1,'at_home','services','course','mother',2,3,1,'no','no','no','yes','yes','yes','yes','yes',4,3,1,1,1,5,0,'9','10',11);
INSERT INTO `student_por` VALUES('GP','M',20,'U','GT3','A',3,2,'services','other','course','other',1,1,2,'no','no','no','yes','yes','yes','no','no',5,5,3,1,1,5,0,'14','15',15);
INSERT INTO `student_por` VALUES('GP','M',19,'R','GT3','T',3,3,'other','services','reputation','father',1,2,0,'no','no','no','yes','yes','yes','no','yes',4,5,3,1,2,5,0,'10','10',11);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',1,4,'other','teacher','home','mother',1,2,0,'yes','yes','no','no','no','yes','no','yes',3,4,4,1,2,5,2,'10','10',11);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',2,1,'services','other','course','mother',2,2,0,'no','yes','no','yes','yes','yes','yes','no',5,3,3,1,2,1,2,'12','12',15);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',2,3,'other','other','course','father',2,2,0,'no','no','no','yes','yes','yes','yes','yes',4,2,1,1,1,3,2,'11','12',14);
INSERT INTO `student_por` VALUES('GP','F',17,'R','GT3','T',4,4,'teacher','teacher','course','mother',1,1,0,'no','no','no','yes','yes','yes','yes','no',4,4,4,1,1,5,2,'15','16',17);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',4,3,'other','other','course','mother',1,3,0,'no','yes','no','yes','yes','yes','yes','yes',4,3,4,1,1,5,2,'14','15',17);
INSERT INTO `student_por` VALUES('GP','F',18,'U','LE3','T',4,3,'health','services','course','mother',2,1,0,'no','yes','no','no','yes','yes','yes','no',3,2,4,1,4,1,8,'12','12',15);
INSERT INTO `student_por` VALUES('GP','F',17,'R','GT3','T',3,4,'at_home','services','course','father',1,3,0,'no','yes','no','yes','no','yes','yes','no',4,3,4,2,5,5,2,'15','15',17);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',3,3,'at_home','other','course','father',1,2,0,'no','yes','no','no','yes','yes','yes','no',4,1,4,1,1,3,8,'11','12',14);
INSERT INTO `student_por` VALUES('GP','M',19,'U','GT3','T',4,2,'health','other','course','mother',2,2,0,'no','yes','no','yes','yes','yes','yes','yes',5,4,4,1,1,1,9,'11','10',10);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',4,4,'teacher','other','course','mother',1,2,0,'no','yes','no','no','yes','yes','yes','no',4,4,4,3,3,5,0,'12','11',13);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',3,4,'other','other','course','mother',1,1,0,'no','yes','no','yes','yes','yes','yes','yes',5,4,4,1,1,1,4,'11','12',14);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',4,4,'health','health','course','mother',1,1,0,'no','no','no','yes','yes','yes','yes','no',5,3,4,1,2,5,2,'14','15',17);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','A',4,3,'services','services','course','mother',1,2,0,'no','yes','no','no','yes','yes','yes','yes',5,2,2,1,2,5,14,'15','14',17);
INSERT INTO `student_por` VALUES('GP','F',17,'U','LE3','A',3,3,'services','other','home','mother',1,2,0,'yes','yes','no','no','yes','yes','yes','no',5,3,3,1,1,5,0,'12','12',13);
INSERT INTO `student_por` VALUES('GP','F',17,'U','LE3','T',2,1,'other','other','home','father',1,2,0,'no','no','no','yes','yes','yes','yes','no',4,2,3,2,2,2,2,'11','12',14);
INSERT INTO `student_por` VALUES('GP','M',18,'U','LE3','T',4,4,'other','other','reputation','father',1,1,0,'no','yes','no','no','yes','yes','yes','no',4,2,5,3,4,5,2,'8','9',11);
INSERT INTO `student_por` VALUES('GP','F',19,'U','GT3','T',1,1,'other','other','course','other',3,3,0,'no','no','no','yes','yes','no','no','yes',1,5,5,4,3,5,12,'10','10',11);
INSERT INTO `student_por` VALUES('GP','F',19,'U','LE3','A',1,1,'other','other','course','other',3,2,2,'no','yes','no','no','no','yes','yes','yes',5,3,4,1,1,4,2,'8','8',9);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',2,2,'other','other','course','mother',1,1,0,'no','yes','no','yes','yes','yes','yes','yes',4,3,5,2,4,5,2,'10','10',10);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',2,2,'other','other','course','mother',1,2,0,'no','yes','no','no','yes','yes','no','yes',4,2,2,1,1,3,4,'14','13',13);
INSERT INTO `student_por` VALUES('GP','F',17,'R','LE3','T',2,2,'services','services','course','mother',1,3,0,'no','yes','no','yes','yes','yes','yes','no',3,3,2,2,2,3,0,'11','11',10);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',3,1,'services','services','course','father',1,3,0,'no','yes','no','no','no','yes','yes','no',3,4,3,2,3,5,0,'17','18',17);
INSERT INTO `student_por` VALUES('GP','F',17,'U','LE3','T',0,2,'at_home','at_home','home','father',2,3,0,'no','no','no','no','yes','yes','yes','no',3,3,3,2,3,2,0,'14','14',15);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',1,1,'other','other','home','mother',2,3,0,'no','no','no','yes','yes','yes','yes','no',4,5,5,1,2,2,0,'14','14',14);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',4,4,'other','other','course','mother',1,3,0,'no','no','no','yes','yes','yes','yes','no',4,3,3,2,2,3,0,'13','14',13);
INSERT INTO `student_por` VALUES('GP','M',17,'U','GT3','T',3,3,'other','services','reputation','mother',1,1,0,'no','no','no','yes','no','yes','yes','no',4,3,5,3,5,5,0,'17','18',17);
INSERT INTO `student_por` VALUES('GP','M',17,'R','GT3','T',2,2,'services','other','course','mother',4,1,0,'no','yes','no','no','yes','yes','yes','no',4,4,5,5,5,4,2,'11','10',10);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',4,4,'teacher','services','course','mother',1,3,0,'no','yes','no','yes','yes','yes','yes','no',5,4,4,1,3,4,0,'13','12',13);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',4,4,'teacher','teacher','course','mother',2,3,0,'no','yes','no','no','no','yes','yes','yes',4,3,3,1,2,4,4,'15','14',15);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',3,3,'at_home','other','course','mother',1,1,0,'no','yes','yes','yes','yes','yes','yes','no',4,2,5,2,5,5,2,'11','12',11);
INSERT INTO `student_por` VALUES('GP','M',18,'U','LE3','T',2,2,'other','other','course','mother',1,4,0,'no','yes','yes','yes','yes','yes','yes','no',4,5,5,2,4,5,0,'11','11',12);
INSERT INTO `student_por` VALUES('GP','M',19,'R','GT3','T',3,2,'at_home','services','home','other',1,1,0,'no','yes','no','no','no','yes','no','yes',5,3,4,2,2,5,0,'11','10',10);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',2,2,'at_home','other','course','mother',4,2,0,'no','no','no','yes','yes','yes','no','yes',4,2,5,1,1,2,2,'10','9',10);
INSERT INTO `student_por` VALUES('GP','F',17,'R','GT3','T',2,4,'at_home','other','course','father',1,3,0,'no','yes','no','no','yes','yes','yes','yes',4,4,3,1,1,5,0,'15','15',15);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',2,2,'other','other','reputation','mother',1,1,0,'no','no','no','no','no','yes','yes','no',5,4,2,1,2,5,6,'15','14',15);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',3,3,'services','services','home','mother',1,2,0,'no','no','no','yes','yes','yes','yes','no',5,3,4,1,1,4,8,'10','11',12);
INSERT INTO `student_por` VALUES('GP','F',18,'U','LE3','T',2,2,'other','other','home','other',1,2,0,'no','no','no','yes','no','yes','yes','yes',4,3,3,1,1,2,0,'10','9',12);
INSERT INTO `student_por` VALUES('GP','F',18,'R','GT3','T',2,2,'at_home','other','course','mother',2,4,0,'no','no','no','yes','yes','yes','no','no',4,4,4,1,1,4,6,'14','13',14);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',3,4,'services','other','course','mother',1,3,0,'no','no','no','no','yes','yes','yes','no',4,4,5,1,3,5,8,'11','13',14);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',3,2,'other','other','home','mother',1,2,0,'no','yes','no','no','yes','yes','yes','yes',4,3,2,2,3,2,0,'12','13',15);
INSERT INTO `student_por` VALUES('GP','F',18,'U','LE3','T',3,3,'services','services','home','mother',1,4,0,'no','yes','no','no','yes','yes','yes','no',5,3,3,1,1,1,4,'14','14',15);
INSERT INTO `student_por` VALUES('GP','F',17,'R','GT3','A',3,2,'other','other','home','mother',1,2,0,'no','yes','no','no','yes','yes','yes','no',4,3,3,2,3,2,0,'14','14',16);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',4,4,'teacher','services','home','father',1,2,0,'no','yes','no','yes','yes','yes','yes','no',4,3,3,2,2,2,0,'12','12',13);
INSERT INTO `student_por` VALUES('GP','M',18,'U','LE3','T',3,4,'services','other','home','mother',1,2,0,'no','no','no','yes','yes','yes','yes','yes',4,3,3,1,3,5,6,'16','16',17);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','A',2,2,'at_home','at_home','home','father',1,2,0,'no','yes','no','no','yes','yes','yes','yes',3,3,1,1,2,4,18,'10','12',14);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',2,3,'at_home','other','course','mother',1,3,0,'no','yes','no','no','yes','yes','yes','no',4,3,3,1,2,3,0,'11','12',14);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',3,2,'other','services','other','mother',1,3,0,'no','no','no','no','yes','yes','yes','yes',5,4,3,2,3,1,4,'14','16',17);
INSERT INTO `student_por` VALUES('GP','M',18,'R','GT3','T',4,3,'teacher','services','course','mother',1,3,0,'no','no','no','no','yes','yes','yes','yes',5,3,2,1,2,4,4,'15','14',17);
INSERT INTO `student_por` VALUES('GP','M',18,'U','GT3','T',4,3,'teacher','other','course','mother',1,3,0,'no','yes','no','no','yes','yes','yes','yes',5,4,5,2,3,5,0,'14','13',14);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',4,3,'health','other','reputation','mother',1,3,0,'no','yes','no','yes','yes','yes','yes','yes',4,4,3,1,3,4,0,'11','12',13);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',2,1,'services','other','course','mother',2,2,0,'no','yes','no','yes','yes','yes','yes','yes',4,3,4,2,2,1,10,'12','15',15);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',2,1,'services','other','reputation','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','no',4,3,5,2,4,4,4,'12','16',16);
INSERT INTO `student_por` VALUES('GP','F',19,'U','LE3','A',2,3,'at_home','other','home','other',2,1,1,'no','no','no','no','yes','no','yes','no',2,2,3,3,4,5,16,'10','11',11);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',3,1,'other','at_home','home','mother',1,1,1,'no','yes','yes','no','yes','yes','yes','yes',4,1,2,1,1,3,6,'10','13',13);
INSERT INTO `student_por` VALUES('GP','F',21,'U','LE3','T',4,4,'other','other','reputation','other',1,3,2,'no','no','yes','yes','yes','yes','yes','no',3,3,2,1,1,5,0,'9','12',12);
INSERT INTO `student_por` VALUES('GP','M',18,'U','LE3','T',2,2,'services','services','reputation','mother',1,2,0,'no','yes','no','yes','no','no','yes','no',4,4,4,1,3,3,11,'9','11',12);
INSERT INTO `student_por` VALUES('GP','M',18,'U','LE3','A',3,4,'other','other','reputation','other',1,2,0,'no','no','no','yes','yes','yes','yes','yes',4,3,5,1,4,2,9,'13','14',15);
INSERT INTO `student_por` VALUES('GP','F',17,'U','GT3','T',2,2,'services','services','reputation','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','no',4,3,4,1,3,4,0,'13','17',17);
INSERT INTO `student_por` VALUES('GP','M',17,'U','LE3','A',4,4,'health','other','reputation','mother',1,3,0,'no','yes','no','no','yes','yes','yes','no',4,4,2,1,2,4,2,'12','15',15);
INSERT INTO `student_por` VALUES('GP','F',18,'U','LE3','T',4,2,'teacher','other','course','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','no',4,2,2,1,1,3,0,'14','17',17);
INSERT INTO `student_por` VALUES('GP','M',21,'R','LE3','T',1,1,'at_home','other','course','other',2,2,2,'no','yes','no','yes','yes','no','yes','yes',5,3,3,5,2,4,21,'9','10',10);
INSERT INTO `student_por` VALUES('GP','F',20,'R','GT3','T',1,1,'other','other','reputation','other',2,3,0,'no','no','no','no','yes','yes','yes','yes',3,2,2,1,3,3,8,'11','15',15);
INSERT INTO `student_por` VALUES('GP','F',19,'U','GT3','T',4,4,'teacher','other','home','other',1,1,1,'no','yes','no','no','yes','yes','yes','yes',3,2,5,4,4,5,5,'9','10',11);
INSERT INTO `student_por` VALUES('GP','M',17,'U','LE3','A',3,2,'other','other','reputation','mother',1,2,0,'no','yes','no','no','yes','yes','yes','no',4,4,4,1,2,5,10,'16','18',18);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',3,2,'at_home','other','reputation','father',1,3,0,'no','yes','no','no','yes','yes','yes','yes',4,3,4,1,2,2,5,'14','17',17);
INSERT INTO `student_por` VALUES('GP','M',18,'R','GT3','T',2,3,'other','services','reputation','father',1,1,0,'no','no','no','no','yes','yes','yes','no',3,1,3,4,5,4,13,'13','14',14);
INSERT INTO `student_por` VALUES('GP','M',19,'U','GT3','T',2,1,'other','other','reputation','mother',1,1,0,'no','no','no','no','yes','yes','yes','no',5,3,4,1,4,4,10,'7','11',11);
INSERT INTO `student_por` VALUES('GP','F',18,'U','LE3','A',2,2,'services','other','reputation','mother',2,2,0,'no','yes','no','no','yes','yes','yes','no',4,1,4,1,3,4,10,'14','17',17);
INSERT INTO `student_por` VALUES('GP','F',20,'U','GT3','T',1,0,'other','other','reputation','mother',2,1,1,'yes','no','no','no','yes','yes','yes','yes',5,3,1,1,1,5,5,'8','10',10);
INSERT INTO `student_por` VALUES('GP','F',18,'U','GT3','T',3,2,'services','other','home','mother',1,2,0,'no','yes','no','yes','no','yes','yes','yes',3,1,2,1,2,1,4,'10','13',13);
INSERT INTO `student_por` VALUES('MS','F',16,'U','GT3','T',1,3,'at_home','other','other','father',2,1,0,'no','yes','no','no','yes','no','yes','yes',4,3,3,1,3,5,11,'10','11',11);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','T',2,2,'other','other','course','mother',2,2,0,'no','yes','no','yes','yes','yes','yes','no',4,4,4,1,1,5,0,'12','12',12);
INSERT INTO `student_por` VALUES('MS','F',15,'R','GT3','T',1,1,'at_home','services','other','mother',1,1,1,'no','yes','no','no','yes','yes','no','yes',4,1,3,1,1,2,6,'10','10',10);
INSERT INTO `student_por` VALUES('MS','F',15,'R','GT3','T',3,3,'at_home','other','course','mother',2,1,0,'no','yes','no','no','yes','yes','yes','no',5,4,4,2,3,5,4,'10','10',11);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','T',2,3,'at_home','services','course','mother',2,2,0,'no','no','no','no','yes','yes','no','no',4,5,2,1,2,5,0,'16','17',17);
INSERT INTO `student_por` VALUES('MS','F',15,'R','LE3','T',2,1,'at_home','other','home','mother',2,1,0,'no','no','no','no','yes','no','no','no',1,3,4,1,1,1,0,'6','8',9);
INSERT INTO `student_por` VALUES('MS','M',16,'R','LE3','A',4,4,'at_home','other','home','mother',1,2,0,'no','yes','no','no','yes','yes','no','no',5,3,2,1,3,2,5,'10','11',11);
INSERT INTO `student_por` VALUES('MS','M',16,'U','GT3','A',1,2,'other','other','other','mother',1,3,0,'yes','no','no','no','yes','yes','yes','no',4,4,3,1,1,5,0,'10','11',11);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',3,2,'at_home','other','course','father',1,2,1,'no','no','no','no','yes','yes','no','yes',4,5,4,1,2,5,0,'10','10',10);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',1,1,'other','other','other','father',1,1,1,'no','yes','no','no','no','no','yes','no',5,4,4,2,2,5,0,'6','6',7);
INSERT INTO `student_por` VALUES('MS','F',15,'R','GT3','T',4,4,'teacher','other','course','mother',2,1,0,'no','no','no','no','yes','yes','yes','yes',1,5,1,3,5,5,0,'13','14',14);
INSERT INTO `student_por` VALUES('MS','F',16,'U','LE3','A',2,2,'at_home','other','reputation','mother',2,4,0,'no','no','no','yes','no','no','no','yes',1,2,1,1,1,1,4,'10','9',11);
INSERT INTO `student_por` VALUES('MS','F',15,'R','LE3','T',1,1,'at_home','services','reputation','father',2,2,0,'no','yes','no','no','yes','yes','yes','no',5,4,3,1,2,4,0,'10','10',10);
INSERT INTO `student_por` VALUES('MS','F',15,'R','LE3','T',1,1,'other','services','course','mother',2,1,1,'no','yes','no','no','yes','yes','yes','yes',4,4,3,1,2,2,4,'6','7',8);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','T',0,2,'other','other','other','mother',2,1,0,'no','yes','no','yes','yes','yes','no','no',3,2,3,1,2,2,0,'12','11',12);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',2,3,'other','other','course','mother',2,1,0,'no','yes','no','no','yes','yes','yes','no',5,5,5,1,3,3,2,'10','11',12);
INSERT INTO `student_por` VALUES('MS','F',15,'R','GT3','T',3,3,'other','services','course','father',2,1,0,'no','no','no','no','no','yes','yes','no',4,1,3,1,1,4,0,'14','16',16);
INSERT INTO `student_por` VALUES('MS','M',16,'U','GT3','T',1,1,'at_home','services','home','mother',2,2,0,'no','yes','no','yes','yes','yes','no','yes',5,4,5,4,5,3,0,'7','0',0);
INSERT INTO `student_por` VALUES('MS','M',17,'U','GT3','T',1,1,'other','other','home','mother',1,2,0,'no','no','yes','no','no','yes','yes','no',4,4,3,2,4,5,4,'8','9',9);
INSERT INTO `student_por` VALUES('MS','M',15,'R','LE3','T',4,1,'health','services','reputation','father',1,2,0,'no','yes','no','yes','yes','yes','yes','no',5,3,4,1,2,2,0,'12','13',14);
INSERT INTO `student_por` VALUES('MS','M',15,'R','LE3','T',4,1,'health','services','reputation','father',1,2,0,'no','yes','no','yes','yes','yes','yes','no',5,3,4,1,2,2,7,'7','9',8);
INSERT INTO `student_por` VALUES('MS','M',16,'R','GT3','T',3,4,'other','health','other','mother',3,2,0,'no','no','no','no','no','yes','no','no',3,4,5,1,2,5,4,'9','10',11);
INSERT INTO `student_por` VALUES('MS','M',15,'R','GT3','T',1,1,'other','other','course','mother',4,2,0,'no','yes','no','yes','yes','yes','no','yes',5,4,5,2,4,4,8,'7','9',9);
INSERT INTO `student_por` VALUES('MS','M',15,'U','LE3','T',3,3,'at_home','at_home','reputation','father',1,2,0,'no','yes','no','yes','yes','yes','yes','no',5,3,3,1,1,5,0,'11','11',11);
INSERT INTO `student_por` VALUES('MS','M',17,'R','GT3','T',2,1,'other','other','other','mother',3,1,0,'no','no','no','yes','yes','no','no','yes',5,5,5,5,5,3,8,'8','10',9);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','T',4,4,'teacher','teacher','course','mother',2,3,0,'no','no','no','yes','yes','yes','yes','yes',4,2,2,1,1,4,6,'16','16',17);
INSERT INTO `student_por` VALUES('MS','F',15,'R','GT3','T',1,2,'other','services','course','mother',2,1,0,'no','no','no','no','yes','yes','no','no',5,1,2,1,1,1,3,'11','13',13);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','T',2,3,'other','services','course','mother',3,2,0,'no','yes','no','no','yes','yes','yes','no',4,5,4,1,2,1,2,'15','15',15);
INSERT INTO `student_por` VALUES('MS','M',16,'R','GT3','T',1,2,'other','other','course','father',2,2,0,'no','no','no','no','yes','yes','no','no',4,3,3,1,1,5,0,'10','11',11);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','T',2,2,'other','other','course','mother',3,2,0,'no','yes','no','no','yes','yes','yes','no',4,4,5,1,1,4,4,'9','10',11);
INSERT INTO `student_por` VALUES('MS','F',16,'U','GT3','T',1,2,'other','services','course','mother',1,3,1,'no','yes','no','no','yes','yes','no','no',1,3,2,1,2,4,0,'10','8',8);
INSERT INTO `student_por` VALUES('MS','F',16,'U','GT3','T',1,2,'other','services','course','mother',1,3,1,'no','yes','no','no','yes','yes','no','no',1,3,2,1,2,4,3,'9','8',8);
INSERT INTO `student_por` VALUES('MS','F',15,'U','GT3','T',2,1,'at_home','other','home','mother',1,2,0,'yes','yes','no','no','no','yes','yes','no',4,4,2,3,3,2,0,'9','10',9);
INSERT INTO `student_por` VALUES('MS','F',16,'U','GT3','T',1,1,'at_home','other','course','father',1,2,0,'no','yes','no','no','no','yes','no','yes',5,4,3,2,1,2,0,'13','14',15);
INSERT INTO `student_por` VALUES('MS','M',17,'R','LE3','T',1,2,'at_home','services','reputation','mother',1,1,0,'no','yes','no','yes','yes','yes','yes','no',5,5,5,5,5,3,4,'10','11',11);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','T',1,1,'other','other','home','father',4,4,0,'no','yes','no','no','no','yes','yes','no',4,3,2,1,1,1,0,'13','10',13);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','T',1,1,'at_home','other','other','father',4,3,0,'yes','yes','no','no','yes','yes','no','no',4,4,3,1,1,5,2,'10','9',10);
INSERT INTO `student_por` VALUES('MS','F',15,'R','GT3','T',1,1,'at_home','other','home','father',2,2,0,'no','yes','no','yes','yes','yes','yes','no',4,3,3,1,1,2,1,'11','10',11);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','T',1,1,'at_home','other','other','mother',2,1,0,'no','no','no','yes','yes','yes','yes','yes',4,2,2,4,3,2,0,'13','12',14);
INSERT INTO `student_por` VALUES('MS','F',15,'R','GT3','T',1,1,'at_home','at_home','course','father',3,2,0,'no','yes','no','no','yes','yes','no','no',4,2,1,1,2,2,0,'13','14',14);
INSERT INTO `student_por` VALUES('MS','F',15,'R','LE3','T',2,2,'other','other','other','father',1,3,0,'yes','yes','no','no','yes','yes','no','no',4,4,3,2,2,5,2,'14','11',12);
INSERT INTO `student_por` VALUES('MS','M',16,'R','GT3','T',1,1,'at_home','other','other','father',2,1,0,'no','no','no','yes','yes','yes','no','no',3,4,4,3,4,5,6,'11','11',11);
INSERT INTO `student_por` VALUES('MS','F',18,'U','GT3','T',1,2,'other','other','course','father',1,2,1,'no','yes','no','yes','yes','yes','yes','yes',3,4,4,2,3,5,9,'9','8',8);
INSERT INTO `student_por` VALUES('MS','M',15,'U','GT3','T',3,1,'other','services','home','mother',2,1,0,'no','yes','no','no','yes','yes','no','no',3,2,3,1,3,4,0,'10','9',11);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','T',2,2,'other','services','course','father',3,2,0,'no','yes','no','yes','yes','yes','yes','no',5,3,4,1,1,2,1,'14','13',14);
INSERT INTO `student_por` VALUES('MS','M',15,'U','GT3','T',2,2,'health','other','reputation','mother',3,1,0,'no','no','no','no','yes','yes','no','no',4,3,3,1,2,4,1,'13','12',13);
INSERT INTO `student_por` VALUES('MS','M',16,'U','GT3','T',4,4,'other','teacher','course','father',1,2,0,'no','yes','no','yes','yes','yes','no','yes',4,3,1,1,1,3,0,'13','12',13);
INSERT INTO `student_por` VALUES('MS','F',15,'R','GT3','T',3,3,'services','other','reputation','mother',1,2,0,'no','yes','no','no','yes','yes','yes','yes',4,5,4,1,1,1,4,'13','12',12);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','T',2,2,'at_home','other','course','mother',2,2,1,'no','yes','no','yes','no','yes','no','no',4,4,4,2,3,5,2,'12','11',12);
INSERT INTO `student_por` VALUES('MS','F',16,'R','LE3','T',2,2,'other','other','home','father',3,1,0,'no','yes','no','yes','yes','yes','no','yes',4,3,2,1,1,4,0,'14','14',16);
INSERT INTO `student_por` VALUES('MS','M',16,'U','LE3','T',2,1,'at_home','services','course','mother',2,1,0,'no','yes','no','yes','yes','yes','yes','no',2,4,3,2,3,4,4,'10','8',10);
INSERT INTO `student_por` VALUES('MS','M',15,'R','LE3','T',1,3,'at_home','other','reputation','father',3,1,0,'no','yes','no','yes','yes','yes','yes','no',4,2,4,3,5,3,2,'10','11',11);
INSERT INTO `student_por` VALUES('MS','F',15,'U','GT3','T',2,2,'other','services','course','mother',2,3,0,'no','yes','no','yes','yes','yes','no','no',5,3,2,1,1,4,0,'12','13',14);
INSERT INTO `student_por` VALUES('MS','F',16,'R','LE3','T',2,1,'other','other','home','mother',1,1,0,'no','yes','no','no','yes','yes','yes','yes',5,4,3,1,1,5,2,'10','8',8);
INSERT INTO `student_por` VALUES('MS','M',15,'U','GT3','T',3,3,'services','services','course','father',2,1,0,'no','yes','no','yes','no','yes','yes','no',4,3,3,2,4,3,11,'12','10',11);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','T',1,1,'at_home','other','course','father',2,2,3,'yes','yes','no','no','yes','yes','no','no',3,4,3,1,1,1,0,'7','7',8);
INSERT INTO `student_por` VALUES('MS','F',17,'U','GT3','T',2,2,'other','at_home','course','mother',1,1,0,'no','yes','no','yes','yes','no','no','no',4,5,3,1,1,5,4,'9','9',10);
INSERT INTO `student_por` VALUES('MS','F',19,'U','GT3','T',2,3,'at_home','services','course','other',1,1,1,'no','no','no','no','yes','no','yes','yes',4,4,4,1,1,2,0,'9','9',10);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',2,1,'at_home','other','course','mother',3,1,0,'no','yes','no','yes','yes','no','no','yes',5,5,3,1,1,3,2,'9','10',11);
INSERT INTO `student_por` VALUES('MS','F',15,'R','LE3','T',1,1,'at_home','other','course','mother',2,1,0,'no','yes','no','no','yes','no','no','yes',5,2,1,1,3,4,0,'9','10',9);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','T',2,2,'other','other','course','father',3,2,0,'no','yes','no','no','yes','no','yes','no',3,4,5,1,2,1,1,'9','10',11);
INSERT INTO `student_por` VALUES('MS','F',16,'U','LE3','A',2,2,'other','other','home','mother',1,1,0,'no','yes','no','no','yes','no','no','no',4,3,4,1,2,1,6,'7','7',8);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',2,2,'at_home','other','course','mother',2,2,0,'no','yes','no','no','yes','yes','yes','no',4,3,5,1,2,4,0,'11','10',11);
INSERT INTO `student_por` VALUES('MS','F',16,'U','GT3','T',2,2,'other','services','course','father',1,1,1,'no','yes','yes','yes','no','yes','yes','no',4,4,3,1,4,3,1,'9','10',10);
INSERT INTO `student_por` VALUES('MS','F',18,'R','LE3','A',3,2,'other','other','course','other',2,3,2,'no','yes','no','no','no','no','no','yes',3,3,2,1,1,2,6,'7','9',10);
INSERT INTO `student_por` VALUES('MS','F',19,'U','GT3','T',1,1,'at_home','services','course','mother',1,3,1,'no','no','no','yes','yes','no','no','yes',5,3,1,1,1,3,6,'7','9',9);
INSERT INTO `student_por` VALUES('MS','M',18,'R','GT3','T',1,1,'other','other','home','mother',2,1,1,'no','no','no','yes','yes','no','yes','no',4,4,3,3,4,4,0,'8','9',10);
INSERT INTO `student_por` VALUES('MS','F',18,'R','GT3','T',1,1,'at_home','at_home','course','mother',2,1,1,'no','no','no','no','no','no','yes','yes',3,2,3,1,1,2,4,'9','11',10);
INSERT INTO `student_por` VALUES('MS','F',19,'U','GT3','T',1,1,'other','other','course','other',2,2,1,'no','yes','no','no','yes','yes','yes','yes',1,1,4,4,1,1,12,'7','8',9);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','A',2,2,'health','other','course','mother',1,2,0,'no','no','no','no','no','yes','no','yes',3,3,2,1,1,3,2,'8','10',10);
INSERT INTO `student_por` VALUES('MS','F',17,'U','GT3','T',0,1,'other','at_home','course','father',2,1,0,'no','no','no','yes','no','yes','no','no',2,4,4,3,5,5,5,'9','9',10);
INSERT INTO `student_por` VALUES('MS','F',16,'R','LE3','T',1,2,'at_home','other','course','mother',1,2,0,'no','no','no','yes','yes','no','yes','no',4,4,5,1,3,3,0,'8','9',9);
INSERT INTO `student_por` VALUES('MS','F',16,'U','GT3','T',3,3,'other','other','reputation','mother',1,1,0,'no','no','no','yes','yes','no','yes','yes',4,5,4,1,1,4,0,'14','13',13);
INSERT INTO `student_por` VALUES('MS','F',16,'R','LE3','T',1,1,'services','services','home','mother',1,1,0,'no','yes','no','yes','yes','yes','yes','yes',4,4,4,2,2,4,2,'14','14',14);
INSERT INTO `student_por` VALUES('MS','M',17,'U','GT3','T',3,3,'services','at_home','course','mother',2,4,1,'no','yes','yes','yes','yes','yes','no','no',5,4,5,3,4,5,0,'10','11',10);
INSERT INTO `student_por` VALUES('MS','F',16,'U','GT3','T',2,1,'other','services','course','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','no',5,3,3,1,1,1,0,'14','13',14);
INSERT INTO `student_por` VALUES('MS','F',16,'U','GT3','T',2,2,'services','other','course','mother',1,1,0,'no','yes','yes','yes','yes','yes','no','yes',4,2,5,1,2,5,0,'17','16',16);
INSERT INTO `student_por` VALUES('MS','M',17,'U','GT3','T',1,2,'other','other','course','father',1,1,1,'no','yes','no','yes','yes','no','yes','yes',5,3,5,5,5,1,12,'6','7',7);
INSERT INTO `student_por` VALUES('MS','M',16,'U','LE3','T',4,3,'other','other','course','father',1,1,0,'no','no','no','yes','yes','yes','yes','no',4,2,5,1,5,5,8,'14','12',13);
INSERT INTO `student_por` VALUES('MS','M',17,'R','LE3','T',2,2,'services','services','other','mother',3,4,1,'no','yes','no','no','yes','yes','no','no',1,3,5,3,5,3,2,'10','8',9);
INSERT INTO `student_por` VALUES('MS','F',16,'U','GT3','T',1,1,'other','other','course','other',1,4,0,'yes','yes','no','yes','yes','yes','yes','no',2,2,1,1,1,5,0,'14','14',14);
INSERT INTO `student_por` VALUES('MS','F',19,'U','LE3','T',2,2,'other','other','home','mother',1,3,0,'no','no','no','no','yes','yes','yes','yes',5,4,5,1,1,1,0,'12','13',13);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',1,1,'at_home','other','reputation','mother',2,1,0,'no','yes','no','yes','no','yes','yes','yes',4,4,5,1,2,5,0,'11','11',11);
INSERT INTO `student_por` VALUES('MS','F',20,'U','GT3','T',3,3,'at_home','services','other','mother',2,2,1,'no','no','no','yes','yes','yes','yes','yes',3,3,4,2,4,3,8,'11','9',10);
INSERT INTO `student_por` VALUES('MS','F',17,'U','LE3','T',1,1,'other','services','course','father',1,3,0,'no','yes','no','no','yes','yes','no','yes',4,3,3,1,1,3,0,'11','11',10);
INSERT INTO `student_por` VALUES('MS','M',17,'R','GT3','T',2,2,'other','other','course','mother',3,1,1,'no','yes','no','no','no','yes','yes','no',4,4,5,1,2,5,0,'10','9',9);
INSERT INTO `student_por` VALUES('MS','F',16,'R','LE3','T',1,1,'at_home','other','course','father',3,2,0,'no','yes','no','no','yes','yes','no','no',5,3,2,1,1,1,0,'16','17',18);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',2,2,'other','other','reputation','mother',2,2,0,'no','yes','no','yes','yes','yes','no','no',5,3,2,1,1,1,0,'15','17',17);
INSERT INTO `student_por` VALUES('MS','F',17,'U','GT3','A',1,0,'other','other','other','mother',2,2,0,'no','no','no','no','yes','yes','yes','yes',4,4,5,1,1,4,1,'11','9',10);
INSERT INTO `student_por` VALUES('MS','F',18,'R','GT3','T',1,1,'at_home','other','other','mother',1,2,1,'no','yes','no','no','yes','yes','yes','yes',4,3,2,1,1,5,9,'7','7',7);
INSERT INTO `student_por` VALUES('MS','F',16,'U','GT3','T',3,1,'other','other','course','mother',1,1,0,'no','no','no','yes','yes','yes','yes','no',3,1,3,1,3,1,0,'8','6',8);
INSERT INTO `student_por` VALUES('MS','F',16,'U','GT3','T',3,2,'services','at_home','course','mother',1,1,0,'no','no','no','no','yes','yes','yes','no',3,1,3,1,4,3,2,'7','6',7);
INSERT INTO `student_por` VALUES('MS','F',18,'U','LE3','T',1,1,'other','at_home','reputation','mother',2,2,0,'yes','no','no','no','yes','yes','no','no',2,3,5,1,4,3,8,'9','8',10);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','T',4,4,'health','teacher','reputation','father',1,2,0,'no','no','no','yes','no','yes','yes','yes',4,3,3,2,3,2,0,'14','16',16);
INSERT INTO `student_por` VALUES('MS','F',16,'R','LE3','T',1,2,'other','other','reputation','mother',2,1,0,'no','no','no','yes','yes','yes','yes','no',5,4,5,1,4,2,0,'14','14',15);
INSERT INTO `student_por` VALUES('MS','F',18,'U','GT3','A',2,4,'other','services','reputation','father',1,2,1,'no','yes','no','no','yes','yes','yes','no',2,3,2,1,3,1,8,'8','5',8);
INSERT INTO `student_por` VALUES('MS','M',16,'R','GT3','T',2,1,'other','services','reputation','mother',2,2,0,'no','no','no','yes','yes','yes','yes','no',5,2,1,1,1,2,0,'8','7',0);
INSERT INTO `student_por` VALUES('MS','F',16,'U','LE3','T',1,1,'at_home','other','other','mother',3,2,0,'no','yes','no','no','yes','yes','yes','no',4,3,2,1,3,5,6,'6','8',8);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','T',2,3,'at_home','services','other','mother',2,2,0,'no','yes','no','yes','yes','yes','yes','no',3,3,3,1,1,2,0,'8','10',10);
INSERT INTO `student_por` VALUES('MS','F',16,'U','GT3','T',4,4,'health','health','course','mother',1,2,0,'no','yes','no','no','yes','yes','yes','yes',4,3,4,1,2,3,4,'8','8',8);
INSERT INTO `student_por` VALUES('MS','M',18,'U','LE3','T',4,4,'at_home','health','home','mother',1,4,0,'no','yes','no','yes','yes','no','yes','yes',5,5,5,5,5,5,2,'5','6',6);
INSERT INTO `student_por` VALUES('MS','F',16,'R','LE3','T',3,4,'at_home','other','other','mother',3,2,0,'no','yes','no','no','no','yes','no','no',4,2,1,1,1,2,2,'7','9',8);
INSERT INTO `student_por` VALUES('MS','M',17,'U','LE3','T',4,4,'other','services','home','mother',1,3,0,'no','yes','no','no','yes','yes','yes','no',4,4,3,1,2,5,0,'15','14',16);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',4,1,'other','other','other','mother',1,1,0,'no','no','no','no','yes','yes','yes','yes',4,2,3,1,2,5,1,'13','14',14);
INSERT INTO `student_por` VALUES('MS','M',16,'U','LE3','T',2,2,'services','services','other','mother',4,3,0,'no','no','no','no','yes','yes','no','no',5,1,3,2,2,3,0,'10','9',10);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',2,2,'at_home','other','other','mother',1,1,0,'no','yes','yes','no','yes','yes','yes','no',5,1,3,1,2,5,5,'9','9',9);
INSERT INTO `student_por` VALUES('MS','F',16,'U','LE3','T',4,4,'services','services','other','father',2,1,0,'no','yes','no','no','yes','yes','no','no',5,1,3,1,2,5,1,'11','11',11);
INSERT INTO `student_por` VALUES('MS','M',17,'U','GT3','T',3,3,'services','services','home','mother',1,1,0,'no','yes','no','yes','yes','yes','yes','no',4,1,4,5,5,3,8,'7','10',9);
INSERT INTO `student_por` VALUES('MS','M',17,'U','GT3','T',1,1,'at_home','services','other','mother',3,2,0,'no','no','no','no','yes','yes','yes','yes',5,1,3,3,3,1,0,'10','10',10);
INSERT INTO `student_por` VALUES('MS','M',16,'U','GT3','T',2,1,'health','services','other','mother',2,2,0,'no','no','no','no','no','yes','yes','yes',4,2,2,1,4,5,2,'9','7',8);
INSERT INTO `student_por` VALUES('MS','F',16,'U','LE3','T',2,1,'other','services','other','mother',1,2,0,'no','no','no','no','yes','yes','yes','yes',3,2,2,1,1,3,0,'14','15',16);
INSERT INTO `student_por` VALUES('MS','M',16,'U','LE3','T',4,4,'teacher','health','other','father',1,1,0,'no','yes','no','no','yes','yes','yes','no',4,1,2,2,5,5,0,'11','12',12);
INSERT INTO `student_por` VALUES('MS','M',15,'R','GT3','T',1,2,'other','services','course','mother',3,2,0,'no','yes','no','yes','yes','yes','no','no',5,5,5,1,3,5,11,'9','11',10);
INSERT INTO `student_por` VALUES('MS','M',15,'U','LE3','A',2,2,'other','other','reputation','mother',3,4,0,'no','yes','no','yes','yes','yes','no','no',5,4,5,2,3,5,8,'13','14',14);
INSERT INTO `student_por` VALUES('MS','M',15,'U','LE3','A',2,1,'services','services','course','mother',1,1,0,'no','no','no','yes','yes','yes','yes','no',4,3,3,1,2,5,11,'12','13',12);
INSERT INTO `student_por` VALUES('MS','F',16,'R','LE3','T',2,2,'other','other','course','mother',1,3,0,'no','yes','no','no','no','yes','no','yes',4,3,3,2,2,5,2,'11','11',11);
INSERT INTO `student_por` VALUES('MS','F',16,'U','LE3','T',4,1,'other','other','home','mother',2,2,0,'no','yes','no','yes','yes','yes','yes','no',1,2,4,2,2,1,8,'9','10',10);
INSERT INTO `student_por` VALUES('MS','F',17,'U','GT3','T',3,2,'at_home','other','home','mother',2,1,0,'no','no','no','no','yes','yes','no','yes',4,3,3,2,2,1,5,'9','11',11);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',2,2,'other','other','other','mother',2,2,0,'yes','no','yes','no','yes','yes','no','no',5,1,3,1,1,5,0,'11','9',11);
INSERT INTO `student_por` VALUES('MS','F',16,'U','GT3','T',4,4,'teacher','services','course','mother',2,3,0,'no','yes','no','no','yes','yes','yes','yes',5,3,5,1,4,5,1,'10','11',12);
INSERT INTO `student_por` VALUES('MS','M',17,'R','GT3','T',4,4,'health','other','course','father',3,1,3,'no','no','no','yes','yes','yes','yes','yes',3,3,3,1,3,5,2,'9','9',8);
INSERT INTO `student_por` VALUES('MS','M',17,'R','LE3','T',1,3,'other','other','course','father',2,1,0,'no','no','no','yes','yes','yes','no','yes',5,1,2,3,3,5,2,'12','11',12);
INSERT INTO `student_por` VALUES('MS','M',17,'U','GT3','T',3,4,'services','other','other','mother',1,2,1,'no','yes','no','yes','no','yes','yes','yes',5,4,4,3,4,5,8,'8','9',8);
INSERT INTO `student_por` VALUES('MS','F',17,'U','GT3','T',4,4,'health','health','course','father',1,2,0,'no','yes','no','no','yes','yes','yes','no',5,2,5,1,1,5,0,'13','15',16);
INSERT INTO `student_por` VALUES('MS','M',16,'R','LE3','T',4,1,'other','at_home','other','father',1,1,0,'no','no','no','no','yes','yes','yes','no',4,1,2,2,1,2,0,'10','11',11);
INSERT INTO `student_por` VALUES('MS','F',17,'U','GT3','A',1,1,'at_home','at_home','other','mother',1,2,0,'no','no','no','yes','yes','yes','yes','yes',4,5,5,1,2,3,2,'11','10',11);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',4,2,'other','other','course','mother',2,2,0,'yes','yes','no','no','no','yes','yes','no',4,3,3,2,3,5,0,'17','18',18);
INSERT INTO `student_por` VALUES('MS','M',16,'U','LE3','A',2,2,'other','services','course','father',2,2,0,'no','yes','no','no','no','yes','yes','yes',4,1,2,2,2,5,0,'12','13',13);
INSERT INTO `student_por` VALUES('MS','M',17,'U','GT3','T',3,2,'other','other','other','father',2,2,0,'no','yes','yes','no','yes','yes','yes','no',4,1,2,2,2,1,0,'13','14',13);
INSERT INTO `student_por` VALUES('MS','M',19,'U','GT3','T',1,1,'other','other','other','mother',1,2,2,'no','yes','no','yes','yes','no','yes','no',4,4,3,3,4,4,2,'9','9',10);
INSERT INTO `student_por` VALUES('MS','M',17,'U','LE3','A',1,0,'other','other','home','mother',1,1,0,'no','no','no','no','yes','yes','no','yes',4,1,2,1,1,5,4,'11','11',12);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',1,1,'at_home','at_home','course','father',2,1,0,'no','yes','no','yes','yes','no','yes','yes',3,5,5,2,2,4,3,'10','11',10);
INSERT INTO `student_por` VALUES('MS','F',16,'R','GT3','T',1,2,'other','other','home','father',1,3,0,'yes','yes','no','no','no','yes','yes','yes',4,3,4,1,1,3,5,'13','14',13);
INSERT INTO `student_por` VALUES('MS','M',16,'R','LE3','T',1,2,'other','at_home','course','mother',1,1,0,'no','no','no','no','yes','yes','no','no',4,4,4,2,4,5,4,'9','10',11);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',3,1,'other','other','course','mother',2,2,3,'no','yes','no','yes','no','yes','yes','yes',5,4,4,1,1,5,2,'7','9',10);
INSERT INTO `student_por` VALUES('MS','M',17,'R','GT3','T',2,2,'other','other','course','mother',2,1,0,'no','no','no','yes','yes','no','no','yes',5,5,5,3,5,5,0,'8','13',10);
INSERT INTO `student_por` VALUES('MS','M',18,'R','GT3','T',1,0,'at_home','at_home','course','other',3,1,1,'yes','yes','no','no','yes','yes','no','no',4,3,2,1,1,4,0,'12','12',13);
INSERT INTO `student_por` VALUES('MS','M',17,'R','GT3','T',1,1,'other','services','course','mother',2,1,0,'no','yes','no','yes','no','yes','yes','yes',4,5,5,1,3,2,0,'10','9',10);
INSERT INTO `student_por` VALUES('MS','M',18,'U','LE3','T',1,1,'at_home','at_home','course','mother',2,2,0,'no','yes','no','yes','yes','yes','no','no',4,3,3,1,4,5,6,'10','9',10);
INSERT INTO `student_por` VALUES('MS','F',16,'R','LE3','T',2,2,'other','services','course','father',1,2,0,'no','no','no','yes','yes','yes','no','yes',5,4,3,1,1,1,0,'11','13',12);
INSERT INTO `student_por` VALUES('MS','M',17,'U','GT3','T',2,2,'other','other','course','mother',1,1,1,'no','no','no','yes','yes','yes','no','yes',1,2,1,2,3,5,0,'7','0',0);
INSERT INTO `student_por` VALUES('MS','M',16,'R','GT3','T',3,2,'services','other','course','father',2,1,0,'no','no','no','no','yes','yes','yes','no',4,5,5,2,3,5,2,'11','9',10);
INSERT INTO `student_por` VALUES('MS','M',16,'R','LE3','T',1,1,'at_home','other','course','mother',2,1,0,'no','no','no','yes','yes','yes','yes','no',4,5,5,2,4,5,0,'10','10',9);
INSERT INTO `student_por` VALUES('MS','M',18,'R','GT3','T',1,1,'services','other','course','other',2,1,1,'no','yes','no','no','yes','no','yes','yes',5,3,3,2,3,5,2,'9','7',9);
INSERT INTO `student_por` VALUES('MS','M',18,'R','GT3','T',3,2,'services','other','course','mother',1,1,1,'no','no','no','no','yes','no','yes','no',2,3,1,2,2,5,0,'4','0',0);
INSERT INTO `student_por` VALUES('MS','M',19,'U','GT3','T',3,2,'at_home','services','course','mother',2,1,3,'no','no','no','yes','yes','yes','no','no',3,2,1,1,1,3,4,'6','11',9);
INSERT INTO `student_por` VALUES('MS','M',18,'U','GT3','T',3,3,'at_home','at_home','course','mother',1,2,2,'no','yes','no','yes','yes','no','yes','no',4,4,5,1,3,3,9,'4','8',8);
INSERT INTO `student_por` VALUES('MS','M',16,'R','GT3','T',2,2,'services','services','course','mother',2,1,0,'no','yes','no','yes','yes','yes','yes','yes',5,4,3,2,4,4,6,'7','8',8);
INSERT INTO `student_por` VALUES('MS','M',19,'U','GT3','T',2,1,'at_home','other','course','other',2,1,3,'no','no','no','yes','no','no','yes','yes',4,4,3,1,3,5,4,'8','9',9);
INSERT INTO `student_por` VALUES('MS','F',16,'U','GT3','A',3,2,'services','at_home','course','mother',2,2,2,'no','yes','no','yes','yes','yes','no','yes',2,5,5,1,1,1,8,'5','5',7);
INSERT INTO `student_por` VALUES('MS','F',17,'U','GT3','T',1,1,'other','at_home','course','mother',1,1,0,'no','yes','no','yes','yes','yes','no','no',4,3,2,1,2,5,9,'7','9',10);
INSERT INTO `student_por` VALUES('MS','M',20,'R','GT3','T',1,1,'other','other','course','other',2,1,1,'no','yes','no','no','yes','no','yes','yes',4,4,3,2,4,4,12,'8','11',10);
INSERT INTO `student_por` VALUES('MS','F',18,'R','GT3','A',4,3,'services','services','course','mother',1,1,0,'no','yes','no','no','yes','yes','yes','no',5,4,4,3,4,2,8,'10','11',10);
INSERT INTO `student_por` VALUES('MS','M',18,'R','GT3','T',3,2,'other','other','course','mother',2,1,0,'no','yes','no','no','no','yes','yes','no',2,5,5,5,5,5,8,'9','10',11);
INSERT INTO `student_por` VALUES('MS','M',19,'R','GT3','T',1,1,'other','services','home','other',3,2,1,'no','no','no','no','yes','yes','yes','no',5,4,4,3,3,2,8,'10','9',11);
INSERT INTO `student_por` VALUES('MS','M',17,'U','GT3','T',3,3,'health','other','course','mother',2,2,1,'no','yes','no','no','yes','yes','yes','no',4,5,4,2,3,3,4,'8','9',10);
INSERT INTO `student_por` VALUES('MS','M',18,'U','LE3','T',1,3,'at_home','services','course','mother',1,1,0,'no','no','no','no','yes','no','yes','yes',4,3,3,2,3,3,0,'9','10',9);
INSERT INTO `student_por` VALUES('MS','M',19,'R','GT3','T',1,1,'other','other','home','other',3,1,1,'no','yes','no','no','yes','yes','yes','no',4,4,4,3,3,5,4,'8','9',10);
INSERT INTO `student_por` VALUES('MS','F',18,'U','GT3','A',1,2,'at_home','other','course','mother',2,2,2,'no','yes','no','no','yes','yes','no','no',4,3,3,1,1,5,2,'6','8',8);
INSERT INTO `student_por` VALUES('MS','F',19,'U','LE3','A',1,1,'at_home','other','course','mother',1,1,0,'no','yes','no','no','yes','no','no','no',1,4,4,1,1,5,0,'6','8',7);
INSERT INTO `student_por` VALUES('MS','F',18,'R','GT3','T',2,2,'other','other','other','mother',2,1,1,'no','no','no','no','yes','no','yes','yes',5,5,5,1,1,3,0,'8','6',0);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',0,0,'at_home','other','course','mother',2,1,0,'no','yes','no','no','yes','yes','yes','no',4,4,3,1,1,5,0,'10','11',11);
INSERT INTO `student_por` VALUES('MS','F',17,'R','LE3','A',3,1,'other','at_home','course','other',2,3,0,'no','yes','yes','no','yes','no','no','no',4,2,3,2,2,3,5,'8','7',8);
INSERT INTO `student_por` VALUES('MS','F',17,'U','GT3','T',4,2,'teacher','services','home','mother',1,2,0,'yes','yes','no','yes','yes','yes','yes','no',5,5,5,1,3,5,0,'8','8',0);
INSERT INTO `student_por` VALUES('MS','F',18,'R','LE3','T',2,2,'services','services','course','mother',1,2,1,'no','yes','no','yes','yes','yes','yes','no',2,3,3,1,2,4,3,'7','6',8);
INSERT INTO `student_por` VALUES('MS','F',17,'U','GT3','T',4,1,'health','at_home','course','mother',1,1,0,'no','yes','no','no','yes','yes','no','yes',3,2,2,1,1,5,0,'8','10',9);
INSERT INTO `student_por` VALUES('MS','F',17,'U','LE3','T',1,2,'at_home','other','course','father',1,1,0,'no','no','no','no','yes','yes','yes','no',5,5,1,1,1,3,0,'7','10',10);
INSERT INTO `student_por` VALUES('MS','F',18,'U','GT3','T',1,1,'other','other','course','mother',3,2,2,'no','no','no','yes','yes','yes','no','yes',3,4,4,2,2,5,3,'7','8',7);
INSERT INTO `student_por` VALUES('MS','F',18,'U','GT3','T',2,2,'services','at_home','reputation','father',2,2,0,'no','no','no','yes','no','yes','yes','no',4,3,5,1,1,1,2,'12','13',14);
INSERT INTO `student_por` VALUES('MS','F',17,'U','GT3','T',3,3,'services','services','course','mother',2,1,0,'no','yes','no','no','yes','yes','yes','no',4,4,3,1,1,4,0,'11','12',13);
INSERT INTO `student_por` VALUES('MS','F',18,'U','LE3','A',1,2,'at_home','other','reputation','mother',2,2,0,'no','no','no','no','yes','yes','yes','no',4,4,3,1,2,4,0,'12','13',14);
INSERT INTO `student_por` VALUES('MS','F',18,'U','GT3','T',4,4,'teacher','teacher','reputation','mother',2,2,0,'no','no','no','yes','no','yes','yes','no',4,3,5,1,2,1,0,'18','18',18);
INSERT INTO `student_por` VALUES('MS','M',18,'U','LE3','T',4,4,'services','other','reputation','mother',1,1,0,'no','yes','no','yes','yes','yes','yes','no',5,4,5,1,1,5,3,'17','17',17);
INSERT INTO `student_por` VALUES('MS','F',17,'U','GT3','T',4,2,'other','other','course','mother',2,2,0,'no','yes','no','no','yes','yes','yes','no',4,3,3,1,2,4,0,'17','18',18);
INSERT INTO `student_por` VALUES('MS','F',18,'R','GT3','T',2,2,'at_home','other','course','mother',3,2,1,'no','no','no','yes','yes','yes','no','yes',4,3,3,1,1,4,0,'9','0',0);
INSERT INTO `student_por` VALUES('MS','M',18,'U','LE3','T',1,2,'at_home','services','home','mother',2,1,0,'no','yes','no','no','no','yes','no','no',4,1,4,5,5,1,8,'10','11',11);
INSERT INTO `student_por` VALUES('MS','M',18,'R','GT3','T',4,4,'at_home','services','other','mother',3,1,0,'no','yes','yes','yes','yes','yes','yes','yes',2,5,5,1,1,1,5,'12','13',14);
INSERT INTO `student_por` VALUES('MS','M',17,'R','GT3','T',1,1,'other','services','other','father',3,1,0,'no','no','no','no','no','no','no','no',4,2,3,3,4,4,4,'12','13',14);
INSERT INTO `student_por` VALUES('MS','F',18,'U','GT3','T',2,2,'other','other','course','mother',2,2,0,'no','yes','no','no','no','yes','yes','yes',1,3,1,1,1,2,4,'8','8',10);
INSERT INTO `student_por` VALUES('MS','F',18,'U','LE3','T',2,2,'services','services','course','father',2,3,0,'no','no','no','no','yes','yes','yes','yes',5,4,5,1,4,3,0,'11','12',13);
INSERT INTO `student_por` VALUES('MS','F',18,'R','LE3','A',4,2,'teacher','other','reputation','mother',1,2,0,'no','no','no','yes','yes','yes','yes','yes',5,3,1,1,1,5,0,'5','0',0);
INSERT INTO `student_por` VALUES('MS','F',18,'U','GT3','T',1,1,'at_home','services','course','mother',3,2,1,'no','no','no','no','yes','no','no','no',4,4,2,1,2,2,2,'9','10',10);
INSERT INTO `student_por` VALUES('MS','F',19,'U','GT3','T',1,1,'at_home','services','other','father',2,1,1,'no','no','no','no','yes','no','no','no',5,5,5,2,3,2,0,'5','0',0);
INSERT INTO `student_por` VALUES('MS','F',17,'U','GT3','T',4,2,'teacher','other','course','father',2,4,0,'no','no','no','no','yes','yes','yes','yes',4,2,3,3,1,5,0,'18','18',18);
INSERT INTO `student_por` VALUES('MS','F',17,'R','LE3','A',2,1,'services','other','reputation','mother',2,2,0,'no','no','no','yes','yes','yes','yes','yes',5,3,3,1,2,2,5,'11','11',12);
INSERT INTO `student_por` VALUES('MS','F',18,'U','LE3','A',1,1,'at_home','services','course','mother',1,2,0,'no','no','no','no','yes','yes','no','yes',5,2,3,1,2,3,2,'8','10',11);
INSERT INTO `student_por` VALUES('MS','F',18,'U','GT3','T',1,2,'at_home','at_home','course','father',2,2,0,'no','yes','no','no','yes','no','no','no',4,1,1,1,1,4,0,'11','11',12);
INSERT INTO `student_por` VALUES('MS','F',19,'R','GT3','A',1,1,'at_home','at_home','course','other',2,2,3,'no','yes','no','yes','yes','no','no','yes',3,5,4,1,4,1,0,'8','0',0);
INSERT INTO `student_por` VALUES('MS','F',18,'R','GT3','T',2,2,'services','other','home','mother',2,3,0,'no','no','no','no','yes','yes','yes','yes',4,2,1,1,1,4,5,'14','14',15);
INSERT INTO `student_por` VALUES('MS','M',17,'R','GT3','T',4,3,'services','other','home','mother',2,2,1,'no','yes','yes','yes','no','yes','yes','yes',4,5,5,1,3,2,4,'10','11',11);
INSERT INTO `student_por` VALUES('MS','F',18,'U','GT3','T',3,3,'services','services','course','father',1,2,0,'no','yes','no','no','yes','yes','no','yes',5,3,4,1,1,5,0,'10','10',10);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',4,4,'teacher','services','other','father',2,2,0,'no','yes','yes','yes','yes','yes','yes','no',4,3,3,1,2,5,2,'12','12',12);
INSERT INTO `student_por` VALUES('MS','F',17,'U','LE3','A',3,2,'services','other','reputation','mother',2,2,0,'no','no','no','no','yes','yes','no','yes',1,2,3,1,2,5,0,'15','14',15);
INSERT INTO `student_por` VALUES('MS','M',18,'U','LE3','T',1,1,'other','services','home','father',2,1,0,'no','no','no','no','no','yes','yes','yes',3,3,2,1,2,3,2,'14','13',14);
INSERT INTO `student_por` VALUES('MS','F',18,'U','LE3','T',1,1,'at_home','services','course','father',2,3,0,'no','no','no','no','yes','yes','yes','no',5,3,2,1,1,4,0,'19','17',18);
INSERT INTO `student_por` VALUES('MS','F',18,'R','LE3','A',1,2,'at_home','other','course','mother',3,2,0,'no','no','no','no','yes','yes','no','yes',4,3,4,1,4,5,0,'16','15',15);
INSERT INTO `student_por` VALUES('MS','F',18,'U','GT3','T',3,3,'services','services','other','mother',2,2,0,'no','yes','no','no','yes','yes','yes','yes',4,3,2,1,3,3,6,'13','12',13);
INSERT INTO `student_por` VALUES('MS','F',17,'U','LE3','T',4,4,'at_home','at_home','course','mother',1,2,0,'no','yes','no','yes','yes','yes','yes','yes',2,3,4,1,1,1,4,'15','14',15);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',1,2,'other','services','course','father',2,2,0,'no','no','no','no','no','yes','no','no',3,2,2,1,2,3,0,'13','13',13);
INSERT INTO `student_por` VALUES('MS','M',18,'R','GT3','T',1,3,'at_home','other','course','mother',2,2,0,'no','yes','yes','no','yes','yes','no','no',3,3,4,2,4,3,0,'8','10',9);
INSERT INTO `student_por` VALUES('MS','M',18,'U','LE3','T',4,4,'teacher','services','other','mother',2,3,0,'no','no','no','no','yes','yes','yes','yes',4,2,2,2,2,5,0,'15','16',16);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',1,1,'other','services','reputation','mother',3,1,1,'no','yes','no','no','yes','yes','yes','yes',5,2,1,1,2,1,0,'8','8',9);
INSERT INTO `student_por` VALUES('MS','F',18,'U','GT3','T',2,3,'at_home','services','course','father',2,1,0,'no','yes','no','no','yes','yes','yes','yes',5,2,3,1,2,4,0,'10','10',10);
INSERT INTO `student_por` VALUES('MS','F',18,'R','GT3','T',4,4,'other','teacher','other','father',3,2,0,'no','yes','no','no','no','yes','yes','yes',3,2,2,4,2,5,0,'7','5',0);
INSERT INTO `student_por` VALUES('MS','M',18,'R','LE3','T',1,2,'at_home','services','other','father',3,1,0,'no','yes','no','yes','yes','no','yes','yes',4,3,3,2,3,3,3,'9','10',10);
INSERT INTO `student_por` VALUES('MS','F',17,'U','GT3','T',2,2,'other','at_home','home','mother',1,3,0,'no','no','no','yes','yes','yes','no','yes',3,4,3,1,1,3,8,'10','11',12);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',1,2,'other','other','course','mother',1,1,0,'no','no','no','yes','yes','yes','yes','no',3,5,5,1,3,1,4,'7','8',9);
INSERT INTO `student_por` VALUES('MS','F',18,'R','LE3','T',4,4,'other','other','reputation','mother',2,3,0,'no','no','no','no','yes','yes','yes','no',5,4,4,1,1,1,0,'15','17',17);
INSERT INTO `student_por` VALUES('MS','F',18,'R','GT3','T',1,1,'other','other','home','mother',4,3,0,'no','no','no','no','yes','yes','yes','no',4,3,2,1,2,4,4,'10','11',12);
INSERT INTO `student_por` VALUES('MS','F',19,'R','GT3','T',1,1,'at_home','other','course','other',2,2,1,'no','yes','no','no','yes','yes','yes','yes',4,3,3,1,1,3,4,'7','8',9);
INSERT INTO `student_por` VALUES('MS','F',18,'R','LE3','T',4,4,'teacher','services','course','mother',1,2,0,'no','no','no','yes','yes','yes','yes','no',5,4,3,3,4,2,1,'13','14',14);
INSERT INTO `student_por` VALUES('MS','F',18,'U','GT3','T',3,3,'other','other','home','mother',1,2,0,'no','no','no','no','yes','yes','yes','yes',4,1,3,1,2,1,1,'16','16',16);
INSERT INTO `student_por` VALUES('MS','F',17,'R','GT3','T',3,1,'at_home','other','reputation','mother',1,2,0,'no','yes','no','yes','no','yes','yes','no',4,5,4,2,3,1,10,'8','9',9);
INSERT INTO `student_por` VALUES('MS','M',18,'U','GT3','T',4,4,'teacher','teacher','home','father',1,2,0,'no','no','no','yes','no','yes','yes','no',3,2,4,1,4,2,4,'17','18',19);
INSERT INTO `student_por` VALUES('MS','M',18,'R','GT3','T',2,1,'other','other','other','mother',2,1,0,'no','no','no','yes','no','yes','yes','yes',4,4,3,1,3,5,0,'7','7',0);
INSERT INTO `student_por` VALUES('MS','M',17,'U','GT3','T',2,3,'other','services','home','father',2,2,0,'no','no','no','yes','yes','yes','yes','no',4,4,3,1,1,3,4,'14','15',16);
INSERT INTO `student_por` VALUES('MS','M',19,'R','GT3','T',1,1,'other','services','other','mother',2,1,1,'no','no','no','no','yes','yes','no','no',4,3,2,1,3,5,0,'5','8',0);
INSERT INTO `student_por` VALUES('MS','M',18,'R','GT3','T',4,2,'other','other','home','father',2,1,1,'no','no','yes','no','yes','yes','no','no',5,4,3,4,3,3,0,'7','7',0);
INSERT INTO `student_por` VALUES('MS','F',18,'R','GT3','T',2,2,'at_home','other','other','mother',2,3,0,'no','no','no','no','yes','yes','no','no',5,3,3,1,3,4,0,'14','17',15);
INSERT INTO `student_por` VALUES('MS','F',17,'U','GT3','T',4,3,'teacher','other','other','mother',2,2,0,'no','no','no','no','yes','yes','yes','no',5,5,4,1,1,1,0,'6','9',11);
INSERT INTO `student_por` VALUES('MS','F',18,'R','GT3','T',4,4,'teacher','at_home','reputation','mother',3,1,0,'no','yes','no','yes','yes','yes','yes','yes',4,4,3,2,2,5,4,'7','9',10);
INSERT INTO `student_por` VALUES('MS','F',19,'R','GT3','T',2,3,'services','other','course','mother',1,3,1,'no','no','no','yes','no','yes','yes','no',5,4,2,1,2,5,4,'10','11',10);
INSERT INTO `student_por` VALUES('MS','F',18,'U','LE3','T',3,1,'teacher','services','course','mother',1,2,0,'no','yes','no','no','yes','yes','yes','no',4,3,4,1,1,1,4,'15','15',16);
INSERT INTO `student_por` VALUES('MS','F',18,'U','GT3','T',1,1,'other','other','course','mother',2,2,0,'no','no','no','yes','yes','yes','no','no',1,1,1,1,1,5,6,'11','12',9);
INSERT INTO `student_por` VALUES('MS','M',17,'U','LE3','T',3,1,'services','services','course','mother',2,1,0,'no','no','no','no','no','yes','yes','no',2,4,5,3,4,2,6,'10','10',10);
INSERT INTO `student_por` VALUES('MS','M',18,'R','LE3','T',3,2,'services','other','course','mother',3,1,0,'no','no','no','no','no','yes','yes','no',4,4,1,3,4,5,4,'10','11',11);
COMMIT;
SET AUTOCOMMIT=1;

