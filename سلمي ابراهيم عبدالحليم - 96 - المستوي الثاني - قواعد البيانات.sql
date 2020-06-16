create database LibararySystemDB; 
use LibararySystemDB;
create table student_tb(
student_id int,
firstname varchar(50),
lastname varchar(50),
studentLevel int,
studentSection varchar(50),
primary key(student_id)
);
create table book_tb(
book_id int,
student_id int,
title varchar(50),
auther varchar(50),
section varchar(50),
publishDate date,
papersNo int,
primary key(book_id)
);
create table period_tb(
id int ,
book_id int,
startdate date, #9999-12-31
enddate date, 
primary key(id)
);
INSERT INTO student_tb VALUES(1,"salma","ahmed",1,"general");
INSERT INTO student_tb VALUES(2,"magda","saeed",4,"SC");
INSERT INTO student_tb VALUES(3,"samy","abduallah",2,"general");
INSERT INTO student_tb VALUES(4,"atyaa","ali",3,"SE");
INSERT INTO student_tb VALUES(5,"noha","mohamed",4,"IT");
INSERT INTO student_tb VALUES(6,"ahmed","ali",1,"general");
ALTER TABLE book_tb  
DROP COLUMN section;
INSERT INTO book_tb VALUES(1,5,"Graphic Fundamentals","DR.Ibrahim","2016-5-12",500);
INSERT INTO book_tb VALUES(2,4,"Android Fundamentals","DR.Steve","2010-6-2",250);
INSERT INTO book_tb VALUES(3,3,"DataBase","DR.Reda","2019-12-12",100);
INSERT INTO book_tb VALUES(4,2,"Data Transimission","DR.Mai","2015-10-12",300);
INSERT INTO book_tb VALUES(5,1,"IT Fundamentals","DR.Mai","2016-5-1",354);
INSERT INTO book_tb VALUES(6,1,"Statics","DR.Ibrahim","2010-4-2",590);
INSERT INTO book_tb VALUES(7,6,"Web Development","DR.Ali","2016-5-2",600);
INSERT INTO book_tb VALUES(1,5,"Graphic Fundamentals","DR.Ibrahim","2016-5-12",500);
INSERT INTO period_tb VALUES (1,5,'2020-01-1','2020-01-5');
INSERT INTO period_tb VALUES (2,7,'2020-01-3','2020-01-9');
INSERT INTO period_tb VALUES (3,3,'2020-01-1','2020-01-5');
INSERT INTO period_tb VALUES (4,4,'2020-01-19','2020-01-25');
INSERT INTO period_tb VALUES (5,1,'2020-01-12','2020-01-15');
INSERT INTO period_tb VALUES (6,2,'2020-01-2','2020-01-5');
INSERT INTO period_tb VALUES (7, 6,'2020-01-20','2020-01-25');
#1-how to get the first name from student table
SELECT firstname  
FROM student_tb;
#2-how to get all information from a table
SELECT * FROM student_tb ;
#3-How to get two columns from a certian table 
SELECT firstname, studentSection FROM student_tb;
#4-how to get a column from its id
SELECT title
FROM book_tb
WHERE book_id=3;
#5-How to use AND gate
SELECT  title
FROM book_tb
WHERE  book_id=2 AND papersNo=100 ;
#5-How to use OR gate
SELECT  title
FROM book_tb
WHERE  book_id=2 OR papersNo=100 ;
#7-How to use NOT gate
SELECT title
FROM book_tb
WHERE NOT papersNo=500;
#8-how to get the books that its papers between 200 and 600
SELECT  title
FROM book_tb
WHERE papersNo BETWEEN 200 AND 600;
#9-how to get the books that its is not papers between 200 and 600
SELECT  title
FROM book_tb
WHERE papersNo NOT BETWEEN 200 AND 600;
#10-how to oreder the title's book from its paper
SELECT title 
FROM book_tb  
WHERE papersNo<=500  
ORDER BY title;
#11- how to get name like "instance name"
SELECT firstname  
FROM student_tb 
WHERE studentSection LIKE 'SC';
#12-how to get a name that instance of this doen't like the conditions   
SELECT firstname  
FROM student_tb 
WHERE studentSection NOT LIKE 'IT';
#13 how to use in condition
SELECT *  
FROM student_tb  
WHERE student_id IN (5, 3, 6);  
#14 how to use not in condition
SELECT *  
FROM student_tb  
WHERE student_id Not IN (5, 3, 6);  
#15 how to show the only diffrenet values
SELECT DISTINCT firstname, studentLevel
FROM student_tb;
#16 how to show the top of a table in condition
SELECT title
FROM book_tb
WHERE papersNo<=300;
#17-how to return the first value of the selected column
SELECT firstname  
FROM student_tb  
LIMIT 1; 
#18-how to return two first values of the selected column
SELECT firstname  
FROM student_tb  
LIMIT 2;
#19-how to add new column to the table
ALTER TABLE book_tb  
ADD section varchar(50);
#20- how to convert datatype of certain expression
SELECT CONVERT('2020-01-5', DATETIME);
ALTER TABLE book_tb  
DROP COLUMN section;

#MIN
SELECT MIN(papersNo)
FROM book_tb;
#MAX
SELECT MAX(papersNo)
FROM book_tb;
#MIN
SELECT MIN(startdate)
FROM period_tb;
#COUNT
SELECT COUNT(papersNo)
FROM book_tb;
#AVG
SELECT AVG(papersNo)
FROM book_tb;
#SUM
SELECT SUM(papersNo)
FROM book_tb;
#GROUP BY
SELECT COUNT(student_id), studentSection
FROM student_tb
GROUP BY studentSection;
#joins
#INNER JOIN
SELECT papersNo
FROM book_tb
INNER JOIN period_tb
ON book_tb.papersNo = period_tb.startdate;
#LEFT
SELECT papersNo
FROM book_tb
LEFT JOIN period_tb
ON book_tb.papersNo = period_tb.startdate;
#RIGHT
SELECT papersNo
FROM book_tb
RIGHT JOIN period_tb
ON book_tb.papersNo = period_tb.startdate;
#CROSS JOIN 
SELECT *  
FROM student_tb
CROSS JOIN period_tb;
#update
UPDATE book_tb
SET title="Programming"
WHERE book_id=5;
UPDATE book_tb
SET papersNo=300
WHERE book_id=3;
UPDATE student_tb
SET firstname="alaa"
WHERE student_id=5;
UPDATE period_tb
SET enddate='2020-2-10'
WHERE id=7;
UPDATE student_tb
SET lastname="magdy"
WHERE student_id=2;
#deleting
DELETE FROM student_tb 
WHERE  
(student_id=6);
DELETE FROM book_tb   
WHERE  
(book_id=6); 
DELETE FROM book_tb   
WHERE  
(book_id=7); 
DELETE FROM period_tb   
WHERE  
(id=7); 
DELETE FROM period_tb
WHERE  
(id=6); 
 