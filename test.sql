
--Create new database
CREATE DATABASE "UniversityPreferenceSystem"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'en_US.UTF-8'
       LC_CTYPE = 'en_US.UTF-8'
       CONNECTION LIMIT = -1;


--Create univeristy table
Create table UNIVERSITY(
"university_id" serial NOT NULL,
"university_name" varchar(35) NOT NULL,
"university_address" varchar(10) NOT NULL,
"university_email_address" varchar(20) NOT NULL,
"university_city" varchar(10) NOT NULL,
"university_type" varchar(10) NOT NULL,
"university_year_of_foundation" int NOT NULL,
CONSTRAINT "uni_id" PRIMARY KEY("university_id"),
CONSTRAINT "uni_name" UNIQUE("university_name") 
);


--Create faculty table
Create table FACULTY(
"university_id" int NOT NULL,
"faculty_id" serial NOT NULL,
"faculty_name" varchar(25) NOT NULL,
"faculty_email_address" varchar(20) NOT NULL,
CONSTRAINT "fac_id" PRIMARY KEY("faculty_id"),
CONSTRAINT "fac_name_id" UNIQUE("university_id","faculty_name"), 
CONSTRAINT "uni_id" FOREIGN KEY("university_id")
REFERENCES university("university_id") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);


--Create department table
Create table DEPARTMENT(
"faculty_id" int NOT NULL,
"department_id" int NOT NULL,
"department_name" varchar(40) NOT NULL,
"email_address" varchar(20) NOT NULL,
"langage" varchar(10) NOT NULL,
"education_type" varchar(2) NOT NULL,
"quota" int NOT NULL,
"quota_for_top_ranked" int NOT NULL,
"period" int NOT NULL,
"min_score" float(2) NOT NULL,
"min_order" int NOT NULL,
CONSTRAINT "dep_id" PRIMARY KEY("department_id"),
CONSTRAINT "dep_name_id" UNIQUE("faculty_id","department_name"),
CONSTRAINT "fac_id" FOREIGN KEY("faculty_id")
REFERENCES faculty("faculty_id") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);


--Create student table
Create table STUDENT(
"student_id" int NOT NULL,
"student_name" varchar(10) NOT NULL,
"student_surname" varchar(10) NOT NULL,
"student_score" float(2) NOT NULL,
"student_order" int NOT NULL,
"top_ranked" varchar(5) NOT NULL,
CONSTRAINT "student_id" PRIMARY KEY("student_id"),
CONSTRAINT "student_id" UNIQUE("student_id") 
);


--Create preference table
Create table PREFERENCE(
"student_id" int NOT NULL,
"order_preference" int NOT NULL,
"department_id" int NOT NULL,
CONSTRAINT "st_dep_id" UNIQUE("student_id","department_id"),
CONSTRAINT "st_order_id" UNIQUE("student_id","order_preference"),
CONSTRAINT "student_id" FOREIGN KEY("student_id")
REFERENCES student("student_id") match simple
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT "dep_id" FOREIGN KEY("department_id")
REFERENCES department("department_id") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);


--insert element in university table
INSERT INTO UNIVERSITY("university_name","university_address","university_email_address","university_city","university_type","university_year_of_foundation")
VALUES('Dokuz Eylül University','Tınaztepe','deu@edu.tr','İzmir','State',1982) --1

INSERT INTO UNIVERSITY("university_name","university_address","university_email_address","university_city","university_type","university_year_of_foundation")
VALUES('İzmir Technical University','Bornova','izt@edu.tr','İzmir','State',1980) --2

INSERT INTO UNIVERSITY("university_name","university_address","university_email_address","university_city","university_type","university_year_of_foundation")
values('Yaşar University','Bornova','yasar@edu.tr','İzmir','Private',2001) --3

INSERT INTO UNIVERSITY("university_name","university_address","university_email_address","university_city","university_type","university_year_of_foundation")
VALUES('İzmir University','Balçova','izmir@edu.tr','İzmir','State',2001) --4

INSERT INTO UNIVERSITY("university_name","university_address","university_email_address","university_city","university_type","university_year_of_foundation")
VALUES('İzmir Institute of Technology','Urla','iyte@edu.tr','İzmir','State',1992) --5

INSERT INTO UNIVERSITY("university_name","university_address","university_email_address","university_city","university_type","university_year_of_foundation")
VALUES('Ege University','Bornova','ege@edu.tr','İzmir','State',1955) --6

INSERT INTO UNIVERSITY("university_name","university_address","university_email_address","university_city","university_type","university_year_of_foundation")
VALUES('Bahçeşehir University','Beşiktaş','bau@edu.tr','İstanbul','Private',1998) --7

INSERT INTO UNIVERSITY("university_name","university_address","university_email_address","university_city","university_type","university_year_of_foundation")
VALUES('Boğaziçi University','Bebek','biu@edu.tr','İstanbul','State',1863) --8

INSERT INTO UNIVERSITY("university_name","university_address","university_email_address","university_city","university_type","university_year_of_foundation")
VALUES('İstanbul Technical University','Sarıyer','itu@edu.tr','İstanbul','State',1773) --9

INSERT INTO UNIVERSITY("university_name","university_address","university_email_address","university_city","university_type","university_year_of_foundation")
VALUES('Yeditepe University','Ataşehir','yeditepe@edu.tr','İstanbul','Private',1996) --10

INSERT INTO UNIVERSITY("university_name","university_address","university_email_address","university_city","university_type","university_year_of_foundation")
VALUES('Başkent University','Etimesgut','baskent@edu.tr','Ankara','Private',1911) --11

INSERT INTO UNIVERSITY("university_name","university_address","university_email_address","university_city","university_type","university_year_of_foundation")
VALUES('Hacettepe University','Çankaya','hacettepe@edu.tr','Ankara','State',1967) --12

INSERT INTO UNIVERSITY("university_name","university_address","university_email_address","university_city","university_type","university_year_of_foundation")
VALUES('Middle East Technical University','Kızılay','odtu@edu.tr','Ankara','State',1956) --13


--insert element in faculty table
INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --1
VALUES(1,'Faculty of Engineering','deueng@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --2
VALUES(1,'Faculty of Medicine','deumed@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --3
VALUES(1,'Faculty of Law','deulaw@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --4
VALUES(2,'Faculty of Law','yasarlaw@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --5
VALUES(3,'Faculty of Engineering','yasareng@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --6
VALUES(4,'Faculty of Engineering','izeng@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --7
VALUES(4,'Faculty of Medicine','izmed@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --8
VALUES(4,'Faculty of Law','izlaw@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --9
VALUES(5,'Faculty of Engineering','iyteeng@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --10
VALUES(6,'Faculty of Engineering','egeeng@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --11
VALUES(7,'Faculty of Engineering','bseng@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --12
VALUES(7,'Faculty of Medicine','bsmed@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --13
VALUES(7,'Faculty of Law','bslaw@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --14
VALUES(8,'Faculty of Engineering','biseng@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --15
VALUES(9,'Faculty of Engineering','itueng@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --16
VALUES(10,'Faculty of Engineering','yteng@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --17
VALUES(10,'Faculty of Law','ytlaw@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --18
VALUES(10,'Faculty of Medicine','ytmed@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --19
VALUES(11,'Faculty of Law','bklaw@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --20
VALUES(11,'Faculty of Engineering','bkeng@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --21
VALUES(12,'Faculty of Engineering','hteng@edu.tr')

INSERT INTO FACULTY("university_id","faculty_name","faculty_email_address") --22
VALUES(13,'Faculty of Engineering','odtueng@edu.tr')


--insert elements in department table
INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(1,103110442,'Computer Engineering','deuceng@edu.tr','English','öö',90,3,4,444.5,33624)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(1,103110469,'Electrical-Electronic Engineering','deuelec@edu.tr','English','öö',90,2,4,430.92,42308)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(1,103110521,'Mechanical Engineering','deucmec@edu.tr','Turkish','iö',90,3,4,404.51,61215)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(2,103110557,'Medicine','deumec@edu.tr','Turkish','öö',250,7,6,539.56,4973)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(3,103110309,'Law','deulaw@edu.tr','Turkish','öö',460,12,4,418.27,12971)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(4,206010487,'Law','yslaw@edu.tr','Turkish','öö',180,0,4,410.39,17650)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(5,206010318,'Computer Engineering','ysceng@edu.tr','English','öö',50,0,4,442.48,34812)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(5,206010433,'Electrical-Electronic Engineering','yselec@edu.tr','English','öö',50,0,4,430.43,42676)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(5,206010566,'Software Engineering','yssw@edu.tr','English','öö',40,0,4,441.23,35603)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(6,203510879,'Electrical-Electronic Engineering','izelec@edu.tr','English','öö',40,0,4,444.46,33625)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(6,203511435,'Mechanical Engineering','izmec@edu.tr','English','öö',40,0,4,430.05,42945)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(7,203511505,'Medicine','izmec@edu.tr','English','iö',30,0,6,513.1,7230)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(8,203510791,'Law','izlaw@edu.tr','Turkish','öö',160,0,4,414.65,14958)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(9,105810068,'Computer Engineering','iytceng@edu.tr','English','öö',70,2,4,464.29,22043)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(9,105810077,'Electrical-Electronic Engineering','iyteelec@edu.tr','English','öö',60,2,4,436.24,38791)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(10,103410333,'Computer Engineering','egeceng@edu.tr','Turkish','öö',100,3,4,448.14,31379)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(10,103410369,'Electrical-Electronic Engineering','egeelec@edu.tr','Turkish','öö',80,2,4,427.2,44869)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(10,103410403,'Mechanical Engineering','egemec@edu.tr','Turkish','öö',80,2,4,416.29,52488)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(11,200510437,'Computer Engineering','bsceng@edu.tr','English','öö',100,0,4,499.6,7081)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(11,200510482,'Electrical-Electronic Engineering','bselec@edu.tr','English','öö',90,0,4,472.38,17825)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(11,200510543,'Mechatronic Engineering','bsm@edu.tr','English','öö',80,0,4,457.71,25741)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(12,200511241,'Medicine','bsmec@edu.tr','English','öö',80,0,6,513.76,2829)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(13,200511568,'Law','bslaw@edu.tr','English','öö',200,0,4,459.38,2425)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(14,102210277,'Computer Engineering','btceng@edu.tr','English','öö',80,2,4,512.75,429)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(14,102210286,'Electrical-Electronic Engineering','btelec@edu.tr','English','öö',80,2,4,511.25,533)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(14,102210329,'Mechanical Engineering','btmec@edu.tr','English','öö',70,2,4,504.25,1831)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(15,105510608,'Computer Engineering','itüceng@edu.tr','English','öö',110,3,4,509.2,2580)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(15,105510441,'Mechanical Engineering','itumec@edu.tr','English','iö',200,5,4,484.3,12514)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(16,206110635,'Electrical-Electronic Engineering','ytceng@edu.tr','English','öö',100,0,4,466.4,20890)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(17,206111969,'Law','ytlaw@edu.tr','English','öö',150,0,4,493.1,595)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(18,206110759,'Medicine','ytmed@edu.tr','English','öö',80,0,6,535.21,1680)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(19,200611328,'Law','bklaw@edu.tr','Turkish','öö',200,0,4,428.33,8384)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(20,200611391,'Computer Engineering','bkceng@edu.tr','Turkish','iö',60,0,4,448.33,31263)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(20,200611416,'Electrical-Electronic Engineering','bkelec@edu.tr','Turkish','öö',70,0,4,427.16,44890)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(21,104810511,'Artificial Intelligence Engineering','htai@edu.tr','Engilish','öö',100,3,4,476.16,16067)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(21,104810383,'Electrical-Electronic Engineering','htelec@edu.tr','Engilish','öö',30,1,4,482.06,13439)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(21,108410433,'Mechanical Engineering','odtümec@edu.tr','Engilish','öö',190,5,4,505.67,5435)

INSERT INTO DEPARTMENT("faculty_id","department_id","department_name","email_address","langage","education_type","quota","quota_for_top_ranked","period","min_score","min_order")
VALUES(22,108410362,'Computer Engineering','odtüceng@edu.tr','Engilish','öö',105,3,4,500.62,1488)


--insert elements in student table
INSERT INTO STUDENT("student_id","student_name","student_surname","student_score","student_order","top_ranked")
VALUES(2017501501,'Tuna','Arslan',450.63,30236,'No')

INSERT INTO STUDENT("student_id","student_name","student_surname","student_score","student_order","top_ranked")
VALUES(2017502502,'Mehmet','Şirin',433.52,40205,'Yes')

INSERT INTO STUDENT("student_id","student_name","student_surname","student_score","student_order","top_ranked")
VALUES(2017503503,'Ceylin','Durmaz',470.78,35658,'No')

INSERT INTO STUDENT("student_id","student_name","student_surname","student_score","student_order","top_ranked")
VALUES(2017504504,'Duru','Öztürk',526.76,1560,'Yes')

INSERT INTO STUDENT("student_id","student_name","student_surname","student_score","student_order","top_ranked")
VALUES(2017505505,'Demir','Can',470.35,20576,'No')

INSERT INTO STUDENT("student_id","student_name","student_surname","student_score","student_order","top_ranked")
VALUES(2017506506,'Efe','Çelik',418.32,13859,'No')

INSERT INTO STUDENT("student_id","student_name","student_surname","student_score","student_order","top_ranked")
VALUES(2017507507,'Seçil','Ak',539.7,420,'Yes')

INSERT INTO STUDENT("student_id","student_name","student_surname","student_score","student_order","top_ranked")
VALUES(2017508508,'Tuana','Gündüz',435.96,38492,'No')

INSERT INTO STUDENT("student_id","student_name","student_surname","student_score","student_order","top_ranked")
VALUES(2017509509,'Ege','Er',430.23,40743,'No')

INSERT INTO STUDENT("student_id","student_name","student_surname","student_score","student_order","top_ranked")
VALUES(2017510510,'Defne','Birkan',326.43,180329,'Yes')


--insert elements in preference table
INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017501501,1,103110557)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017501501,2,103110442)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017501501,3,105810077)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017502502,1,206110759)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017502502,2,103110442)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017502502,3,103110557)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017503503,1,206010318)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017503503,2,105810068)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017503503,3,103110442)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017504504,1,203510791)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017504504,2,206010487)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017504504,3,103110442)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017505505,1,105510608)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017505505,2,103110442)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017505505,3,203510791)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017506506,1,203510791)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017506506,2,206110635)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017506506,3,103110442)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017507507,1,103110442)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017507507,2,200511241)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017507507,3,200510543)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017508508,1,200510543)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017508508,2,103110442)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017508508,3,206010433)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017509509,1,206010433)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017509509,2,103410333)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017509509,3,103410403)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017510510,1,206110635)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017510510,2,206010433)

INSERT INTO PREFERENCE("student_id","order_preference","department_id")
VALUES(2017510510,3,203510791)


--1) Find the university names which are located in the cities whose name starts with "İ" and founded after 1990.
SELECT u.university_name 
FROM UNIVERSITY AS u
  WHERE university_city 
LIKE 'İ%' AND university_year_of_foundation>1990;


--2) Find the universities which include "Engineering" and "Medicine" Faculties.
SELECT u.university_name 
FROM UNIVERSITY AS u 
INNER JOIN FACULTY AS f
  ON f.university_id=u.university_id 
    WHERE f.faculty_name IN ('Faculty of Engineering','Faculty of Medicine') 
GROUP BY u.university_id 
HAVING COUNT(u.university_id) in (2);


--3) Find the count of faculties according to university types.
SELECT u.university_type,COUNT(u.university_type) 
FROM UNIVERSITY AS u
INNER JOIN FACULTY AS f 
  ON f.university_id=u.university_id
GROUP BY u.university_type;

--4) Find the departments that contain "enginnering" and are the type of "iö". 
SELECT d.department_name,d.education_type 
FROM DEPARTMENT AS d
  WHERE d.department_name LIKE '%Engineering' 
AND d.education_type IN ('iö');


--5) Fİnd the top five departments with the longest education and highest score.
SELECT d.department_name,d.period,min_score 
FROM DEPARTMENT AS d
ORDER BY (d.period, d.min_score) DESC
LIMIT 5;


--6) Find the most preferred 4 year departments.
SELECT d.department_id, d.department_name,COUNT(d.department_id) 
FROM DEPARTMENT AS d
INNER JOIN PREFERENCE AS p
  ON d.department_id=p.department_id 
    WHERE d.period IN (4)
GROUP BY d.department_id
ORDER BY COUNT(d.department_id) DESC
LIMIT 1;


--7) List the students who prefer the Department of Computer Engineering as their first choice according to their exam score in a decreasing order.
SELECT s.student_id,s.student_name, s.student_surname,s.student_score 
FROM STUDENT AS s
INNER JOIN PREFERENCE AS p
  ON s.student_id=p.student_id 
INNER JOIN DEPARTMENT AS d
  ON d.department_id=p.department_id 
    WHERE d.department_name IN('Computer Engineering') AND p.order_preference in (1)
GROUP BY s.student_id 
ORDER BY s.student_score DESC;


--8) Update the Faculty of Engineering in Dokuz Eylül University to be located in İzmir Technical University.
UPDATE FACULTY AS f 
SET university_id = (SELECT university_id 
		     FROM UNIVERSITY AS u 
		     WHERE university_name IN ('İzmir Technical University'))  
WHERE faculty_name IN('Faculty of Engineering') AND university_id IN (SELECT university_id 
		                                                  FROM UNIVERSITY AS u 
		                                                  WHERE university_name IN ('Dokuz Eylül University'));


--9) Extend the current education period of the departments under the Faculty of Law by one year.
UPDATE DEPARTMENT AS d 
SET period=period+1 
  WHERE department_name IN ('Law');


--10) Delete the faculties and departments in İzmir University.
DELETE FROM FACULTY AS f 
WHERE f.university_id IN (SELECT university_id 
			  FROM UNIVERSITY AS u
			  WHERE u.university_name IN ('İzmir University'));

