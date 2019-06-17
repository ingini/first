
use company;

create table branch_info (
branch_no int,
branch_nm char(10),
open_dt date,
close_dt date,
branch_num int,
branch_perf char(5));

insert into branch_info values 
(789, '시청', '1990-03-12', null, 13, 'A'),
(640, '여의도', '2005-08-07', null, 8, 'B'),
(368, '대치', '2005-08-01', '2013-07-09', 13, 'C'),
(248, '창동', '2000-11-30', null, 12, 'A'),
(547, '종각', '1993-02-21', null, 11, 'C'),
(780, '명동', '1999-09-22', null, 8, 'A'),
(987, '역삼', '2008-08-30', null, 7, 'B'),
(456, '대학로', '2010-12-01', null, 8, 'B'),
(650, '신촌', '2002-05-17', null, 10, 'C');

select * from branch_info;


1.직원수가 10명 이상, 경영평가 'C'학점, 영업점 폐쇄
2. 직원수가 10명 또는 8명, 경영평가가 'A' 또는 'B'
3. 영업점이 폐쇄되었거나 2000년 이전에 신설한 영업







CREATE TABLE PERF_MAST_201312
(
	CMF CHAR(4) PRIMARY KEY NOT NULL,
	PARTY_NM CHAR(10) NOT NULL,
	SEG CHAR(10) NOT NULL,
	TOT_AMT_1 DECIMAL(15,0),
	TOT_AMT_2 DECIMAL(15,0),
	TOT_AMT_3 DECIMAL(15,0)
);
INSERT INTO PERF_MAST_201312 VALUES ('2356', '김아름', 'PB', 790, 1770, 4780);
INSERT INTO PERF_MAST_201312 VALUES ('4570', '이선우', 'MASS', 90700, 5789, 87986);
INSERT INTO PERF_MAST_201312 VALUES ('4563', '홍지은', 'MASS', , , );
INSERT INTO PERF_MAST_201312 VALUES ('3268', '윤일상', 'MASS', 88805, 659860, 5130);
INSERT INTO PERF_MAST_201312 VALUES ('8904', '이동건', 'PB', 9846000, 5708900, 7600000);
INSERT INTO PERF_MAST_201312 VALUES ('4678', '최혜연', 'MASS', , 6000, );
INSERT INTO PERF_MAST_201312 VALUES ('1748', '임하영', 'PB', 1000400, 788000, 2378696);
INSERT INTO PERF_MAST_201312 VALUES ('3120', '김지철', 'PB', , , );
INSERT INTO PERF_MAST_201312 VALUES ('8974', '강성범', 'MASS', 540, , 7700);
INSERT INTO PERF_MAST_201312 VALUES ('3255', '김지연', 'MASS', 254860, 578321, 432004);
INSERT INTO PERF_MAST_201312 VALUES ('8977', '김지현', 'PB', 687063, 870000, 545400);

cmf - 고객번호, seg - 고객등급, t_amt1 - 한달 전 사용금액, t_amt2 - 두 달 전 사용금액, t_amt3 - 세 달 전 사용금액

coalesce함수 사용

1. 3개월 연속 1만원 미만 사용 고객 - 비활성화 고객
2. pb이면서 비활성화 고객
3. 직전 3개월 동안 카드사용금액이 매달 줄어드는 고객
4. 직전 3개월 카드사용금액이 7천원 이상인 고객
5. 3개월 카드사용금액이 매달 줄어들면서 3개월 카드사용 금액이 7천만원 이상인 고객
6. 지난 3개월간 매월 총 카드사용금액 합계
7. 매달 카드 사용금액이 증가하는 고객
8. pb고객의 매달 카드사용금액의 합계
9. 고객 등급별 지난 달 최고 카드사용 고객
CREATE TABLE CASA_201312

(

	CUST_ID CHAR(13) PRIMARY KEY NOT NULL,

	CUST_SEG CHAR(10) NOT NULL,

	BALANCE_201311 DECIMAL(15,0),

	BALANCE_201312 DECIMAL(15,0)

);



INSERT INTO CASA_201312 VALUES ('54560', 'SILVER', 1000000, 2000000);

INSERT INTO CASA_201312 VALUES ('68477', 'GOLD', 112000, 3500);

INSERT INTO CASA_201312 VALUES ('96147', 'SILVER', 300000, 1000010);

INSERT INTO CASA_201312 VALUES ('32134', 'GOLD', 2354000, 3200000);

INSERT INTO CASA_201312 VALUES ('12478', 'DIAMOND', 6015000, 5800000);

INSERT INTO CASA_201312 VALUES ('54789', 'SILVER', 200000, 300000);

INSERT INTO CASA_201312 VALUES ('34181', 'GOLD', 4200000, 4100000);

INSERT INTO CASA_201312 VALUES ('23458', 'DIAMOND', 5000000, 6200000);

INSERT INTO CASA_201312 VALUES ('12344', 'SILVER', 210000, 200000);



select * from casa_201312;



/*

11월과 12월의 고객별 수신잔고 평균



1. 11월 캠페인결과 잔고증가율이 10%이상인 고객은 1, 아니면 0으로 

    캠페인 성공 여부를 새로운 칼럼으로 표시하시오

2. 캠페인 성공률을 계산하시오

3. 캠페인의 결과로 증가된 수신고 순 증가분을 구하시오

4. 캠페인 결과 수신고 증가율을 구하시오 

*/



select cust_id, 

(case when BALANCE_201311*1.1 <= BALANCE_201312 then 1 else 0 end) as accept

from casa_201312;



select case when BALANCE_201311*1.1 <= BALANCE_201312 then 1 else 0 end as accept,

sum(case when BALANCE_201311*1.1 <= BALANCE_201312 then 1 else 0 end)*100/count(cust_id) as success_rate 

from casa_201312;

    

select sum(BALANCE_201312)-sum(BALANCE_201311) from casa_201312;



select (sum(BALANCE_201312)-sum(BALANCE_201311))*100/sum(BALANCE_201311) 

from casa_201312;



create table stud_score (

student_id int,

math_score int,

eng_score int,

phil_score int,

music_score int);



insert into stud_score values 

(123511,89,78,45,90),

(255475,88,90,null,87),

(9921100,87,null, null, 98),

(9732453,69,98,78,78),

(578981,59,90,89,null),

(768789,94,80,87,99),

(565789,58,64,72,null);



select * from stud_score;

/* 1. null값을 포함해서 행의 개수를 구하시오

1-1. null값을 포함한 행들만의 갯수..

2. null값을 제외한 음악점수 보유자의 숫자를 구하시오

3. null값 및 중복값을 제외한 영어점수 보유자의 수자를 구하시오

4. 수학점수의 총합을 구하시오

5. 음악 점수의 평균을 구하시오

6. 전과목 최고득점자의 학번을 구하시오

7. 수학점수의 최고점수와 최저점수를 구하시오

8. 평균점수가 가장 높은 과목은 무엇인가

9. 과목 당 표준편차가 가장 작은 학생의 학번을 구하시오

10. 분산이 가장 작은 과목은 무엇인가*/



select * from stud_score;

select count(*) from stud_score;

select count(*) from stud_score where eng_score is null or phil_score is null or music_score is null;

select count(distinct music_score) from stud_score;

select student_id, (math_score+eng_score+phil_score+music_score) as total from stud_score order by total desc limit 1;

select max(math_score)-min(math_score) as math_diff from stud_score;

select avg(math_score) as avgmath, avg(eng_score) as avgeng, avg(phil_score) as avgphil, avg(music_score) as avgmusic 

from stud_score;

select student_id, stddev(math_score, eng_score, phil_score, music_score) as substd from stud_score;

select var_samp(math_score), var_samp(eng_score), var_samp(phil_score), var_samp(music_score) from stud_score;



create table staff_sal (

id int,

job char(10),

current_sal int,

eng_score int);



insert into staff_sal value

(2148,'officer',40000,90),

(5780,'clerk',32000,98),

(6870, 'manager', 100000,80),

(4565, 'clerk', 30000,79),

(9687,'clerk', 33000,66),

(7337, 'manager', 100000,95),

(1321,'officer', 43000,80),

(9595, 'clerk', 30000, 50);



select * from staff_sal;



/*

1. 직위 별 연봉 평균을 구하시오

2. clerk은 7%, officer는 5%, manager는 3% 연봉을 인상하기로 하였다. 직원별 인상된 연봉을 현재연봉과 함께 계산하시오

3. 연봉인상 기준이 직급과 영어점수에 따라 다음과 같다면 사원별 인상되는 연봉금액을 계산하시오. 

clerk

officer

manager

4. 위와 같이 연봉이 인상된다면 추가되는 임금비용은 얼마인가?*/



select job, avg(current_sal) from staff_sal group by job;

  

select job, current_sal, case when job = 'clerk' then current_sal*1.07

			when job = 'officer' then current_sal*1.05

            when job = 'manager' then current_sal*1.03 

            else current_sal end as new_sal from staff_sal;

            

select job, current_sal, eng_score,

			case when job = 'clerk' and eng_score >=80 then current_sal*1.07

			when job = 'clerk' and eng_score <80 then current_sal*1.06

			when job = 'officer' and eng_score >= 80 then current_sal*1.05

            when job = 'officer' and eng_score < 80 then current_sal*1.04

            when job = 'manager' and eng_score >= 80 then current_sal*1.03 

            when job = 'manager' and eng_score < 80 then current_sal*1.02

            else current_sal end as new_sal from staff_sal;



select (sum(current_sal)- 

			sum(case when job = 'clerk' and eng_score >=80 then current_sal*1.07

			when job = 'clerk' and eng_score <80 then current_sal*1.06

			when job = 'officer' and eng_score >= 80 then current_sal*1.05

            when job = 'officer' and eng_score < 80 then current_sal*1.04

            when job = 'manager' and eng_score >= 80 then current_sal*1.03 

            when job = 'manager' and eng_score < 80 then current_sal*1.02

            else current_sal end))*(-1) from staff_sal;

create database company;

use company;



CREATE TABLE CUST_INFO

(

	RESIDENCE_ID CHAR(13) PRIMARY KEY NOT NULL,

	FIRST_NM CHAR(10) NOT NULL,

	LAST_NM CHAR(10) NOT NULL,

	ANNL_PERF DECIMAL(15,2)

);



INSERT INTO CUST_INFO VALUES ('8301111999999', 'JIHUN', 'KIM', 330.08);

INSERT INTO CUST_INFO VALUES ('7012012888888', 'JINYOUNG', 'LEE', 857.61);

INSERT INTO CUST_INFO VALUES ('6705302777666', 'MIJA', 'HAN', -76.77);

INSERT INTO CUST_INFO VALUES ('8411011555666', 'YOUNGJUN', 'HA', 468.54);

INSERT INTO CUST_INFO VALUES ('7710092666777', 'DAYOUNG', 'SUNG', -890);

INSERT INTO CUST_INFO VALUES ('7911022444555', 'HYEJIN', 'SEO', 47.44);



select * from cust_info;



/* 

1.남성은 1로 여성은 2로 출력하시어

2. 이메일을 보내기 위해 성과 이름을 결합하시오

3. 고객의 수익을 소수점 첫 째자리에서 반올림하시오. */



select 

	concat(last_nm,'  ', first_nm), 

	substr(residence_id, 7,1) as gender, 

	round(annl_perf, 1) 

from cust_info;









create table vendor_info(

id int,

name char(10),

country char(20));





insert into vendor_info values 

(1, 'sue', 'germany'),

(2, 'david', 'switzerland'),

(3, 'sam', 'france'),

(4, 'jihoon', 'brazil'),

(5, 'sunwoo', 'france'),

(6, 'berney', 'italy'),

(7, 'sandy', 'germany'),

(8, 'young', 'korea') ;



/*

1. 이름을 소문자로 변환해서 출력하시오

2. 이름을 대문자로 변환해서 출력하시오

3. 이름의 길이를 name_len라는 별칭으로 출력하시오

4. 이름의 두 번째에서 네 번째 글자를 출력하고 name_str이라는 별칭으로 출력하시오

*/





select lower(name) from vendor_info;

select upper(name) from vendor_info;

select length(name) as nm_len from vendor_info;

select substr(name, 2, 2) from vendor_info;







create table clerk (

id int,

staff_nm char(5),

def_nm char(10),

gender char(2),

birth_dt date,

emp_flag char(2) );



insert into clerk values 

(135, '이민성', '마케팅부', 'm', '1984-02-11', 'y'),

(142, '김선명', '영업지원부', 'm', '1971-12-08', 'y'),

(121, '신지원', '리스크부', 'f', '1978-05-28','y'),

(334, '고현정', '전략기획부', 'f', '1965-01-12', 'y'),

(144, '이기동', '마케팅분석부', 'm', '1981-03-03', 'y'),

(703, '송지희', '검사부', 'f', '1985-05-14', 'f'),

(732, '연승환', '기업영업지원부', 'm', '1990-01-26', 'y'),

(911, '이명준', '여의도지점', 'm', '1988-06-11', 'n');



/*

1. 직원의 생일을 기준으로 내림차순으로 정렬하시오

2. 직원의 나이를 구하시오

3. 직원의 생일에 1달을 더한 날짜를 구하시오

4. 남성의 평균 나이와 여성의 평균 나이를 구하시오

5. 평균 연령이 가장 낮은 부서는 어디인가 */



select * from clerk;



select * from clerk order by birth_dt;

select staff_nm, floor(datediff(now(), birth_dt)/365) 

	as age from clerk order by age;

select staff_nm, (year(now())-year(birth_dt)) 

	as age from clerk order by age;

select staff_nm, birth_dt, adddate(birth_dt, 30) from clerk;

select staff_nm, birth_dt, date_add(birth_dt, interval 1 month) 

	from clerk;

select gender, avg(round(datediff(now(), birth_dt)/365)) as age 

	from clerk group by gender;

select def_nm, avg(round(datediff(now(), birth_dt)/365)) as age 

	from clerk group by def_nm order by age limit 1;









select * from cust_info;

/* 

1. 고객이 남성이면 1, 여성이면 2를 출력하시오.

2. 남성의 평균 수익과 여성의 평균 수익을 구하시오

3. 수익이 가장 높은 고객의 이름을 출력하시오

*/



select first_nm, substr(residence_id, 7, 1) as gender 

	from cust_info;

select substr(residence_id, 7, 1) as gender, avg(annl_perf) 

	from cust_info group by gender;

select first_nm, annl_perf from cust_info 

	order by annl_perf desc limit 1;
CREATE TABLE CUST_PERF
(
	ID CHAR(4) PRIMARY KEY NOT NULL,
	NAME CHAR(10) NOT NULL,
	SEG CHAR(10) NOT NULL,
	TOT_AMT_1 DECIMAL(15,0),
	TOT_AMT_2 DECIMAL(15,0),
	TOT_AMT_3 DECIMAL(15,0),
	CITY CHAR(10),
	COUNTRY CHAR(10)
);

INSERT INTO CUST_PERF VALUES ('1', 'SUE', 'PRIORITY', 790, 1770, 4780, 'BERLIN', 'GERMANY');
INSERT INTO CUST_PERF VALUES ('2', 'DAVID', 'MASS', 90700, 5789, 87986, 'BERN', 'SWITZERLAND');
INSERT INTO CUST_PERF VALUES ('3', 'SAM', 'MASS', , , , 'NANTES', 'FRANCE');
INSERT INTO CUST_PERF VALUES ('4', 'KIM', 'MASS', 88805, 659860, 5130, 'BERGAMO', 'BRAZIL');
INSERT INTO CUST_PERF VALUES ('5', 'LEE', 'PRIORITY', 9846000, 5708900, 7600000, 'VERSAILLES', 'FRANCE');
INSERT INTO CUST_PERF VALUES ('6', 'BERNEY', 'MASS', , 6000, , 'BERGAMO', 'ITALY');
INSERT INTO CUST_PERF VALUES ('7', 'SANDY', 'PRIORITY', 1000400, 788000, 2378696, 'BERLIN', 'GERMANY');
INSERT INTO CUST_PERF VALUES ('8', 'YOUNG', 'MASS', , , , 'SEOUL', 'KOREA');
INSERT INTO CUST_PERF VALUES ('9', 'SALLY', 'MASS', 540, , 7700, 'TOKYO', 'JAPAN');
INSERT INTO CUST_PERF VALUES ('10', 'BRIAN', 'MASS', 254860, 578321, 432004, 'PUSAN', 'KOREA');
INSERT INTO CUST_PERF VALUES ('11', 'CHRISTINA', 'PRIORITY', 687063, 870000, 545400, 'OSAKA', 'JAPAN');







use company;

create table customers (
id int,
name char(10),
city char(15),
country char(20) );

insert into customers values 
(1, 'sue', 'berlin', 'germany'),
(2, 'david', 'bern', 'switzerland'),
(3, 'sam', 'nantes', 'france'),
(4, 'kim', ' bergamo', 'brazil'),
(5, 'lee', 'versailles', 'brazil'),
(6, 'berney', 'bergamo', 'italy'),
(7, 'sandy', 'berlin', 'germany'),
(8, 'youn','seoul','korea');



CREATE TABLE EMP
(
	ID CHAR(3) PRIMARY KEY NOT NULL,
	“POSITION” CHAR(10) NOT NULL,
	PARTY_NM CHAR(10) NOT NULL,
	MANAGER_ID CHAR(10) NOT NULL,
	TEAM_NM CHAR(10) NOT NULL,
	GRADE CHAR(10) NOT NULL
);

INSERT INTO EMP VALUES ('650', '대리', '이재훈', '1270', '마케팅부', '1');
INSERT INTO EMP VALUES ('540', '과장', '장성수', '3221', '리스크부', '2');
INSERT INTO EMP VALUES ('210', '차장', '문보미', '3914', '인사팀', '3');
INSERT INTO EMP VALUES ('347', '차장', '정호천', '3942', '기획팀', '3');
INSERT INTO EMP VALUES ('970', '부장', '김영성', '3221', '리스크부', '2');
INSERT INTO EMP VALUES ('345', '대리', '오윤경', '1270', '마케팅부', '2');
INSERT INTO EMP VALUES ('711', '과장', '이재중', '3914', '인사팀', '2');

1. 어떤 직급이 있는지?
2. 직급에 따라 어떤 고과를 받았는가
3. 인사고과 주는 사람 구하기
4. 인사고과를 몇명이 주고 있는가


select distinct position from emp;
select distinct position , grade from emp;
select distinct manager_id from emp;
select count(distinct manager_id) from emp;
##########################################################
##########################################################
##########################################################

# SQL - MySQL for Data Analytics and Business Intelligence
# Lecture and Exercise Code

##########################################################
##########################################################
##########################################################





##########################################################
##########################################################

-- SECTION: First Steps in SQL

##########################################################
##########################################################


###########
-- LECTURE: Creating a Database - Part I

sales database 생성

create database sales;

-- EXERCISE 1: Creating a Database - Part I


###########
-- LECTURE: Creating a Database - Part II

sales database 선택

use sales;

-- EXERCISE 1: Creating a Database - Part II



###########
-- LECTURE: Fixed and Floating-Point Data Types

test table 생성
test column 생성 - datatype -  DECIMAL(5,3)

create table test (test decimal(5,3));


값 10.5 입력

insert into test(test) values(10.5);

test테이블 출력

select * from test;

값 입력 - 12.55555


insert into test(test) values(12.55555);

칼럼 추가  `test_fl` - FLOAT(5,3) NULL AFTER `test`

alter table test add column 'test_f1' foat(5,3) null after 'test';

값 입력 - test_fl : 14.55555 / test : 16.55555

insert into test_f1 values(14.5555);
insert into test values(16.55555);

test table 삭제

drop table test;
###########
-- LECTURE: Creating a Table

sales 테이블 생성
	purchase_number - INT  ,
    date_of_purchase - DATE NOT NULL,     
    customer_id - INT,
    item_code - VARCHAR(10) NOT NULL
    
    
create table sales (
purchase_number  INT  auto_increment primary key,
date_of_purchase  DATE NOT NULL,     
customer_id  INT,
item_code  VARCHAR(10) NOT NULL
);



-- EXERCISE 1: Creating a Table
customers 테이블 생성
    customer_id - INT,
    first_name - varchar(255),
    last_name - varchar(255),
    email_address - varchar(255),
    number_of_complaints - int
    
    
    
create table customers (
	customer_id  INT,
    first_name  varchar(255),
    last_name  varchar(255),
    email_address  varchar(255),
    number_of_complaints  int
);


sales 테이블의 purchase_number를 primary key로 지정 - 2가지 방범/ not null로 지정/ auto_increment로 지정
customers 테이블의 customer_id를 primary key로 지정

create table customers (
	customer_id  INT primary key,
    first_name  varchar(255),
    last_name  varchar(255),
    email_address  varchar(255),
    number_of_complaints  int
    );

create table customers (
	customer_id  INT primary key,
    first_name  varchar(255),
    last_name  varchar(255),
    email_address  varchar(255),
    number_of_complaints  int,
    primary key(customer_id)
    );

alter table customers add constraint primary key(customer_id);








###########

##########################################################
##########################################################

-- SECTION: MySQL Constraints

##########################################################
##########################################################


###########
-- LECTURE: PRIMARY KEY Constraint

/


-- EXERCISE 1: PRIMARY KEY Constraint


items 테이블 생성, 
	
	primary key - item_id
    item_id - VARCHAR(255),
    item - VARCHAR(255),
    unit_price - NUMERIC(10 , 2 ),
    company_id - VARCHAR(255),
    
    create table items(
    
    item_id  VARCHAR(255) primary key,
    item  VARCHAR(255),
    unit_price  NUMERIC(10 , 2 ),
    company_id  VARCHAR(255)
    );


companies 테이블 생성, 
	primary key - company_id
    company_id - VARCHAR(255),
    company_name - VARCHAR(255),
    headquarters_phone_number - INT(12),
    
    create table companies(
		company_id  VARCHAR(255),
		company_name  VARCHAR(255),
		headquarters_phone_number  INT(12),
        primary key(company_id)
        );
    



alter - customers테이블 - email_address - unique key로 지정

ALTER TABLE customers ADD UNIQUE KEY (email_address);

alter table customers add foreign key(customer_id) references customers(customer_id) ON DELETE CASCADE;


customers테이블 gender column를 추가 - enum('M', 'F')

alter table customers add column gender enum('M', 'F') after last_name;

customers 테이블 값 추가 - 'John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0

insert into customers values('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

customers 테이블 값 추가 - first_name, last_name, gender -> 'Peter', 'Figaro', 'M'

insert into customers (first_name, last_name, gender) values('Peter', 'Figaro', 'M');


company_name을 not null로 추가

alter company_name add constraint not null(company_name);

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

ALTER TABLE companies
MODIFY company_name VARCHAR(255) NULL;

ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;


###########
-- LECTURE: SELECT - FROM

employees database 선택

use employees;


first_name, last_name 출력

select first_name, last_name from employees;

  
###########
-- LECTURE: WHERE

이름이  'Denis'인 데이터 출력

select * from employees where name='Denis';
    

###########
-- LECTURE: AND

이름이 'Denis' 이고 남성인 데이터 출력
    
select * from employees where name='Denis' and gender='M';

###########
-- LECTURE: OR

이름이 'Denis' 또는  'Elvis'인 데이터 출력

select * from employees where name = 'Denis' or name='Elvis';

###########
-- LECTURE: IN / NOT IN

이름이 'Cathie' , 'Mark', 'Nathan'에 해당하는 row출력

select * from employees where name='Cathie' or name='Mark' or name='Nathan';

select * from employees where name in ('Cathie', 'Mark', 'Nathan');

이름이 'Cathie' , 'Mark', 'Nathan'에 해당하지 않는 row출력

select * from employees where name not in ('Cathie', 'Mark', 'Nathan');

###########
-- LECTURE: LIKE / NOT LIKE 

이름이 Mar로 시작하는 row출력

select * from employees where name like ('Mar%');

이름이 ar로 끝나는 row출력

select * from employees where name like ('%ar');

이름이 Mar로 시작하고 4글자인 row출력

select * from employees where name like ('Mar_');

이름에 jack을 포한하는 row를 출력

select * from employees where first_name like ('%Jack%');
    

hire_date이 '1990-01-01' 과 '2000-01-01' 사이인 row출력

select * from employees where hire_date between '1990-01-01' and '2000-01-01';

    
salary가 66000과 70000 사이인 row출력

select * from salaries where salary between 66000 and 70000;
 
이름이 null인 row출력

select * from employees where first_name is null;
 
 이름이 null이 아닌 row출력

select * from employees where first_name is not null;
    
이름이 'Mark'가 아닌 row를 출력

select * from employees where first_name != 'Mark';
    
select * from employees

hire_date이 '2000-01-01' 이후인 데이터 출력

select * from employees where hire_date > '2000-01-01';
    
hire_date이 '1985-02-01'이전인 데이터 출력

select * from employees where hire_date < '1985-02-01';

hire_date이 '1985-02-01'이전이고 남성인인 데이터 출력
    
salary가 150000  이상인 데이터 출력
select  * from salaries where salary > 150000;


중복없는 입사일자 데이터 출력
select distinct hire_date from employees;


중복없는 이름 출력

select distinct first_name from employees;
    

###########
-- LECTURE: Introduction to Aggregate Functions    
    
사원번호 갯수를 출력

select count(emp_no) from employees;
    
    
이름 칼럼 갯수의 총 합 출력

select count(first_name) from employees;

중복없는 이름의 갯수 출력

select count(distinct first_name) from employees;

-- EXERCISE 1: Introduction to Aggregate Functions

연봉 100000이상인 사람의 총 수
    
select count(*) from salaries where salary > 100000;

메니저인 사람의 총 수 출력

select count(emp_no) from dept_manager;


이름으로 오름차순 정렬 후 하위 10개 이름 출력

select first_name from employees order by first_name limit 10;

이름으로 내림차순 정렬 후 하위 10개 이름 출력

select first_name from employees order by first_name desc limit 10;

성울 선순위, 이름을 차순위로 내림차순 정렬

select last_name, first_name from employees order by first_name asc, last_name desc;

연봉 상위 100명 이름 출력
select first_name from salaries order by salary desc limit 100;

중복 이름이 100 이상인 이름 목록 출력
select first_name from employees group by first_name having count(first_name) > 100;


평균 연봉이 120000 이상인 직원 번호와 평균 임금 출력
select emp_no, avg(salary) from employees group by emp_no having avg(salary) > 120000;
###########
-- LECTURE: WHERE vs HAVING - Part I

중복 이름이 200번 이상이면서 1999-01-01 이후에 입사한 사람의 이름과 중복된 이름의 갯수 출력

select first_name, count(first_name) from employees where hire_date > 1999-01-01 
group by first-name having count(first_name) > 200;

use employees;

employees에 데이터 삽입

insert into employees (
	emp_no,
	birth_date,
	first_name,
	last_name,
	gender,
	hire_date) values
	(999901,
    '1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'),
    
    ('1973-3-26',
    999902,
    'Patricia',
    'Lawrence',
    'F',
    '2005-01-01'),
    
    (999903,
    '1977-09-14',
    'Johnathan',
    'Creek',
    'M',
    '1999-01-01');
    
employees 내림차순 상위 10개 출력

select * from employees order by emp_no desc limit 100;

titles에 데이터 입력
insert into titles (	
    emp_no,
    title,
    from_date) values(

	999903,
    'Senior Engineer',
    '1997-10-01');
    
employees 내림차순 상위 10개 출력

 
dept_emp에 데이터 입력

insert into dept_emp (
	emp_no,
    dept_no,
    from_date,
    to_date) values(

	999903,
    'd005',
    '1997-10-01',
    '9999-01-01');


###########
-- LECTURE: Inserting Data INTO a New Table
use employees;

CREATE TABLE departments_dup 
(
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

departments의 데이터를 departments-dup에 삽입하시오

insert into departments_dup(dept_no, dept_name)  select * from departments




##########################################################
##########################################################

-- SECTION: The SQL UPDATE Statement

##########################################################
##########################################################


###########
-- LECTURE: The UPDATE Statement - Part I


USE employees;

emp_no = 999901e데이터를 수정하시오

update employees set (

first_name = 'Stella',
last_name = 'Parkinson',
birth_date = '1990-12-31',
gender = 'F') where emp_no = 999901;

emp_no 기준 내림차순으로 상위 10개를 출력하시오


###########


-- EXERCISE 1: The UPDATE Statement - Part II

departments에서 dept_no가 'd010'인 데이터의 dept_name을 'data analysis'로 수정하시오

update departments set( dept_name='data analysis') where dept_np= 'd010';


##########################################################
##########################################################

-- SECTION: The SQL DELETE Statement

##########################################################
##########################################################


###########
-- LECTURE: The DELETE Statement - Part I

USE employees;


SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;
    
    
employees 테이블에서 emp_no가 999903인 데이터를 삭제하시오

delete from employees where emp_no = 999903;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
    
    

###########
-- LECTURE: The DELETE Statement - Part II

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;


departments_dup의 모든 데이터를 삭제하시오

delete from departments_dup;


departments에서 dept_no가 'd010'인 데이터를 삭제하시오

delete from departments where dept_np='d010';
##########################################################
##########################################################

-- SECTION: MySQL Aggregate Functions

##########################################################
##########################################################


###########
-- LECTURE: COUNT()

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10; 

SELECT 
    COUNT(salary)
FROM
    salaries;   

salaries테이블에서 입사일자 총 갯수합합을 산출하시오
select count(hire_date) from salaries;

salaries테이블에서 중복없는 입사일자 총 합을 산출하시오
select count(distinct(hire_date)) from salaries;
    
salaries 테이블의 총데이터 갯수를 구하시오
select count(*) from salaries;

dept_emp에서 중복없는 dept_no의 갯수를 구하시오
select count(distinct(dept_no)) from dept_emp;


salaries에서 salary의 총 합을 구하시오.
select sum(salary) from salaries;
    
'1997-01-01'일 이후의 salary의 총합을 구하시오.
select sum(salary) from salaries where mdate > '19970-01-01';


###########
-- LECTURE: MIN() and MAX()

salaries에서 salary최대값을 구하시오.
select max(salary) from salaries;

salaries에서 salary최소값을 구하시오
select min(salary) from salaries;

salaries에서 salary 평균값을 구하시오
select avg(salary) from salaries;

salaries에서 salary 반올림한 평균값을 구하시오.
select round(salary) from salaries;




CREATE TABLE CASA_201312

(

	CUST_ID CHAR(13) PRIMARY KEY NOT NULL,

	CUST_SEG CHAR(10) NOT NULL,

	BALANCE_201311 DECIMAL(15,0),

	BALANCE_201312 DECIMAL(15,0)

);



INSERT INTO CASA_201312 VALUES ('54560', 'SILVER', 1000000, 2000000);

INSERT INTO CASA_201312 VALUES ('68477', 'GOLD', 112000, 3500);

INSERT INTO CASA_201312 VALUES ('96147', 'SILVER', 300000, 1000010);

INSERT INTO CASA_201312 VALUES ('32134', 'GOLD', 2354000, 3200000);

INSERT INTO CASA_201312 VALUES ('12478', 'DIAMOND', 6015000, 5800000);

INSERT INTO CASA_201312 VALUES ('54789', 'SILVER', 200000, 300000);

INSERT INTO CASA_201312 VALUES ('34181', 'GOLD', 4200000, 4100000);

INSERT INTO CASA_201312 VALUES ('23458', 'DIAMOND', 5000000, 6200000);

INSERT INTO CASA_201312 VALUES ('12344', 'SILVER', 210000, 200000);



select * from casa_201312;



/*

11월과 12월의 고객별 수신잔고 평균



1. 11월 캠페인결과 잔고증가율이 10%이상인 고객은 1, 아니면 0으로 

    캠페인 성공 여부를 새로운 칼럼으로 표시하시오

2. 캠페인 성공률을 계산하시오

3. 캠페인의 결과로 증가된 수신고 순 증가분을 구하시오

4. 캠페인 결과 수신고 증가율을 구하시오 

*/



select cust_id, 

(case when BALANCE_201311*1.1 <= BALANCE_201312 then 1 else 0 end) as accept

from casa_201312;



select case when BALANCE_201311*1.1 <= BALANCE_201312 then 1 else 0 end as accept,

sum(case when BALANCE_201311*1.1 <= BALANCE_201312 then 1 else 0 end)*100/count(cust_id) as success_rate 

from casa_201312;

    

select sum(BALANCE_201312)-sum(BALANCE_201311) from casa_201312;



select (sum(BALANCE_201312)-sum(BALANCE_201311))*100/sum(BALANCE_201311) 

from casa_201312;



create table stud_score (

student_id int,

math_score int,

eng_score int,

phil_score int,

music_score int);



insert into stud_score values 

(123511,89,78,45,90),

(255475,88,90,null,87),

(9921100,87,null, null, 98),

(9732453,69,98,78,78),

(578981,59,90,89,null),

(768789,94,80,87,99),

(565789,58,64,72,null);



select * from stud_score;

/* 1. null값을 포함해서 행의 개수를 구하시오

1-1. null값을 포함한 행들만의 갯수..

2. null값을 제외한 음악점수 보유자의 숫자를 구하시오

3. null값 및 중복값을 제외한 영어점수 보유자의 수자를 구하시오

4. 수학점수의 총합을 구하시오

5. 음악 점수의 평균을 구하시오

6. 전과목 최고득점자의 학번을 구하시오

7. 수학점수의 최고점수와 최저점수를 구하시오

8. 평균점수가 가장 높은 과목은 무엇인가

9. 과목 당 표준편차가 가장 작은 학생의 학번을 구하시오

10. 분산이 가장 작은 과목은 무엇인가*/



select * from stud_score;

select count(*) from stud_score;

select count(*) from stud_score where eng_score is null or phil_score is null or music_score is null;

select count(distinct music_score) from stud_score;

select student_id, (math_score+eng_score+phil_score+music_score) as total from stud_score order by total desc limit 1;

select max(math_score)-min(math_score) as math_diff from stud_score;

select avg(math_score) as avgmath, avg(eng_score) as avgeng, avg(phil_score) as avgphil, avg(music_score) as avgmusic 

from stud_score;

select student_id, stddev(math_score, eng_score, phil_score, music_score) as substd from stud_score;

select var_samp(math_score), var_samp(eng_score), var_samp(phil_score), var_samp(music_score) from stud_score;





create table staff_sal (

id int,

job char(10),

current_sal int,

eng_score int);



insert into staff_sal value

(2148,'officer',40000,90),

(5780,'clerk',32000,98),

(6870, 'manager', 100000,80),

(4565, 'clerk', 30000,79),

(9687,'clerk', 33000,66),

(7337, 'manager', 100000,95),

(1321,'officer', 43000,80),

(9595, 'clerk', 30000, 50);



select * from staff_sal;



/*

1. 직위 별 연봉 평균을 구하시오

2. clerk은 7%, officer는 5%, manager는 3% 연봉을 인상하기로 하였다. 직원별 인상된 연봉을 현재연봉과 함께 계산하시오

3. 연봉인상 기준이 직급과 영어점수에 따라 다음과 같다면 사원별 인상되는 연봉금액을 계산하시오. 

clerk

officer

manager

4. 위와 같이 연봉이 인상된다면 추가되는 임금비용은 얼마인가?*/



select job, avg(current_sal) from staff_sal group by job;

  

select job, current_sal, case when job = 'clerk' then current_sal*1.07

			when job = 'officer' then current_sal*1.05

            when job = 'manager' then current_sal*1.03 

            else current_sal end as new_sal from staff_sal;

            

select job, current_sal, eng_score,

			case when job = 'clerk' and eng_score >=80 then current_sal*1.07

			when job = 'clerk' and eng_score <80 then current_sal*1.06

			when job = 'officer' and eng_score >= 80 then current_sal*1.05

            when job = 'officer' and eng_score < 80 then current_sal*1.04

            when job = 'manager' and eng_score >= 80 then current_sal*1.03 

            when job = 'manager' and eng_score < 80 then current_sal*1.02

            else current_sal end as new_sal from staff_sal;



select (sum(current_sal)- 

			sum(case when job = 'clerk' and eng_score >=80 then current_sal*1.07

			when job = 'clerk' and eng_score <80 then current_sal*1.06

			when job = 'officer' and eng_score >= 80 then current_sal*1.05

            when job = 'officer' and eng_score < 80 then current_sal*1.04

            when job = 'manager' and eng_score >= 80 then current_sal*1.03 

            when job = 'manager' and eng_score < 80 then current_sal*1.02

            else current_sal end))*(-1) from staff_sal;

create database company;

use company;



CREATE TABLE CUST_INFO

(

	RESIDENCE_ID CHAR(13) PRIMARY KEY NOT NULL,

	FIRST_NM CHAR(10) NOT NULL,

	LAST_NM CHAR(10) NOT NULL,

	ANNL_PERF DECIMAL(15,2)

);



INSERT INTO CUST_INFO VALUES ('8301111999999', 'JIHUN', 'KIM', 330.08);

INSERT INTO CUST_INFO VALUES ('7012012888888', 'JINYOUNG', 'LEE', 857.61);

INSERT INTO CUST_INFO VALUES ('6705302777666', 'MIJA', 'HAN', -76.77);

INSERT INTO CUST_INFO VALUES ('8411011555666', 'YOUNGJUN', 'HA', 468.54);

INSERT INTO CUST_INFO VALUES ('7710092666777', 'DAYOUNG', 'SUNG', -890);

INSERT INTO CUST_INFO VALUES ('7911022444555', 'HYEJIN', 'SEO', 47.44);



select * from cust_info;



/* 

1.남성은 1로 여성은 2로 출력하시어

2. 이메일을 보내기 위해 성과 이름을 결합하시오

3. 고객의 수익을 소수점 첫 째자리에서 반올림하시오. */



select 

	concat(last_nm,'  ', first_nm), 

	substr(residence_id, 7,1) as gender, 

	round(annl_perf, 1) 

from cust_info;









create table vendor_info(

id int,

name char(10),

country char(20));





insert into vendor_info values 

(1, 'sue', 'germany'),

(2, 'david', 'switzerland'),

(3, 'sam', 'france'),

(4, 'jihoon', 'brazil'),

(5, 'sunwoo', 'france'),

(6, 'berney', 'italy'),

(7, 'sandy', 'germany'),

(8, 'young', 'korea') ;



/*

1. 이름을 소문자로 변환해서 출력하시오

2. 이름을 대문자로 변환해서 출력하시오

3. 이름의 길이를 name_len라는 별칭으로 출력하시오

4. 이름의 두 번째에서 네 번째 글자를 출력하고 name_str이라는 별칭으로 출력하시오

*/





select lower(name) from vendor_info;

select upper(name) from vendor_info;

select length(name) as nm_len from vendor_info;

select substr(name, 2, 2) from vendor_info;







create table clerk (

id int,

staff_nm char(5),

def_nm char(10),

gender char(2),

birth_dt date,

emp_flag char(2) );



insert into clerk values 

(135, '이민성', '마케팅부', 'm', '1984-02-11', 'y'),

(142, '김선명', '영업지원부', 'm', '1971-12-08', 'y'),

(121, '신지원', '리스크부', 'f', '1978-05-28','y'),

(334, '고현정', '전략기획부', 'f', '1965-01-12', 'y'),

(144, '이기동', '마케팅분석부', 'm', '1981-03-03', 'y'),

(703, '송지희', '검사부', 'f', '1985-05-14', 'f'),

(732, '연승환', '기업영업지원부', 'm', '1990-01-26', 'y'),

(911, '이명준', '여의도지점', 'm', '1988-06-11', 'n');



/*

1. 직원의 생일을 기준으로 내림차순으로 정렬하시오

2. 직원의 나이를 구하시오

3. 직원의 생일에 1달을 더한 날짜를 구하시오

4. 남성의 평균 나이와 여성의 평균 나이를 구하시오

5. 평균 연령이 가장 낮은 부서는 어디인가 */



select * from clerk;



select * from clerk order by birth_dt;

select staff_nm, floor(datediff(now(), birth_dt)/365) 

	as age from clerk order by age;

select staff_nm, (year(now())-year(birth_dt)) 

	as age from clerk order by age;

select staff_nm, birth_dt, adddate(birth_dt, 30) from clerk;

select staff_nm, birth_dt, date_add(birth_dt, interval 1 month) 

	from clerk;

select gender, avg(round(datediff(now(), birth_dt)/365)) as age 

	from clerk group by gender;

select def_nm, avg(round(datediff(now(), birth_dt)/365)) as age 

	from clerk group by def_nm order by age limit 1;









select * from cust_info;

/* 

1. 고객이 남성이면 1, 여성이면 2를 출력하시오.

2. 남성의 평균 수익과 여성의 평균 수익을 구하시오

3. 수익이 가장 높은 고객의 이름을 출력하시오

*/



select first_nm, substr(residence_id, 7, 1) as gender 

	from cust_info;

select substr(residence_id, 7, 1) as gender, avg(annl_perf) 

	from cust_info group by gender;

select first_nm, annl_perf from cust_info 

	order by annl_perf desc limit 1;
use testdb;

CREATE TABLE CARD_TRAN_201311
(
	CMF CHAR(4) PRIMARY KEY NOT NULL,
	PARTY_NM CHAR(10) NOT NULL,
	SEG CHAR(10) NOT NULL,
	PIF_AMT DECIMAL(15,0),
	INST_AMT DECIMAL(15,0),
	OVRS_AMT DECIMAL(15,0),
	CASH_AMT DECIMAL(15,0)
);

INSERT INTO CARD_TRAN_201311 VALUES ('2356', '김아름', 'PB', 1234041,null , 1301710, null);
INSERT INTO CARD_TRAN_201311 VALUES ('4570', '이선우', 'MASS',null , null, 524560, null);
INSERT INTO CARD_TRAN_201311 VALUES ('4563', '홍지은', 'MASS', 213570,null , null, 3700000);
INSERT INTO CARD_TRAN_201311 VALUES ('3266', '윤일상', 'MASS', 89641, null, null, null);
INSERT INTO CARD_TRAN_201311 VALUES ('8904', '이동건', 'PB', 1278960, 500000, null, null);
INSERT INTO CARD_TRAN_201311 VALUES ('4678', '최혜연', 'MASS', 4567780, null, null, null);
INSERT INTO CARD_TRAN_201311 VALUES ('1746', '임하영', 'PB', 7836100, 3213400, null, null);
INSERT INTO CARD_TRAN_201311 VALUES ('3120', '김지철', 'PB', null, null, null, null);
INSERT INTO CARD_TRAN_201311 VALUES ('8974', '강성범', 'MASS', 655456, null, null, null);
INSERT INTO CARD_TRAN_201311 VALUES ('3255', '김지연', 'MASS', 213, null, null, null);
INSERT INTO CARD_TRAN_201311 VALUES ('8977', '김지현', 'PB', 1300, null, 54000, 100000);

select * from card_tran_201311;

/*
cmf - 고객번호, party_nm - 이름, seg - 고객등급, pif_amt - 일시불, inst_amt - 할부사용금액,
ovrs_amt - 해외사용금액, cash_amt - 현금서비스

coalesce함수 사용

1. cmd, 이름, 총 사용금액을 총 사용금액 기준 내림차순으로 출력하시오
2. 신규 무이자 할부 카드의 홍보대상 고객을 추출하시오
3. pb고객을 대상으로 일시불사용금액의 1%를 캐시백해주는 캠페인을 진행하면 누가 얼마의 금액을 받을 것인가
4. 고객 등급별 총사용 금액을 추출하고 총사용금액 기준 내림차순 정렬
5. 사용금액이 가장 많은 서비스는
6. 사용횟수가 가장 많은 서비스는
7. pb 고객이 가장 많이 사용한 서비스는
*/


select cmf, party_nm, (coalesce(pif_amt,0) + coalesce(inst_amt,0) + coalesce(ovrs_amt,0) + coalesce(cash_amt,0)) 
as tot_amt from card_tran_201311 order by 3 desc;

select cmf, party_nm, inst_amt from card_tran_201311 where inst_amt > 0;

select cmf, party_nm, seg, pif_amt, pif_amt*0.1 as reward_amt from card_tran_201311 where seg='pb';






create table purchase_tran (
id int,
purchase_amt int,
purchase_cnt int,
last_amt int,
last_cnt int);

insert into purchase_tran values 
(145, 2000000, 12, 1231000, 21),
(455, 1273100, 1, 2237230, 22),
(463, 111463, 3, 214047, 1),
(324, 154769, 3, 7474663, 13),
(568, 25786652, 47, 1000047, 3),
(662, 106868, 1, 277763, 1),
(871, 9694470, 123, 798874, 2),
(460, 65650000, 1200, 6557741, 320),
(277, 5766300, 470, 57663000, 444),
(309, 5579800, 415, 2333000, 135);

 /*
1. 올해 구매금액이 1백만원 이상인 고객의 고객번호와 올해 구매금액을 추출하시오.
2. 작년 구매금액이 1백만원 이상 5천만원 이하인 고객의 고객 번호와 작년 구매금액을 출력하시오.
3. 올해 구입건수가 작년 구입건수 보다 많은 고객들의 고객번호, 올해구입건수, 작년구입건수를 출력하고 올래구입건수를 기준으로 오름차순 정렬하시오.
4. 올해 건당 구입금액을 구하고 이름을 평균구매금액으로 출력하시오.
5. 올해와 작년의 구매건수 당 평균 구매금액을 구하시오
*/

select * from purchase_tran;

select id, purchase_amt from purchase_tran where purchase_amt >= 1000000;
select id, last_amt from purchase_tran where  1000000 <= last_amt <= 50000000;
select id, purchase_cnt, last_cnt from purchase_tran where purchase_cnt > last_cnt order by id;
select id, purchase_amt*0.1 as income_amt from purchase_tran;
select id, purchase_amt/purchase_cnt as ticket_size from purchase_tran;
select id, card_no, cnrt_amt from ins_info where cncl_dt is null;
select id, cnrt_no, cnrt_amt from ins_info where cncl_dt is not null;




create table ins_info (
id int,
cnrt_no int,
cnrt_dt date,
cnrt_cd int,
prdt_nm char(15),
cncl_dt date,
cnrt_amt int);

insert ignore into ins_info values 
(224,	2533274,	'2013-07-01',	1,'다이렉트자동차보험', null, 1000000),
(224,	6111075,	'2012-08-07',	2,	'5년만기저축보험', '2014-01-21',	300000),
(684,	4447330,	'2014-06-12',	1,	'다이렉트자동차보험', null, 100000),
(233,	4932004,	'2011-11-23',	3, '자동차보험', null, 200000),
(762,	9633703,	'2013-05-31',	2,	'10년만기저축보험', '2013-11-03',	700000),
(789,	1378934,    '2013-01-12',	2,	'3년만기저축보험', null, 5000001),
(183,	3701447,	'2010-05-05',	1,	'다이렉트자동차보험', null, 900000),
(183,	6678966,	'2011-12-08',	3,	'10년만기저축보험', null, 10000000),
(831,	8463112,	'2013-04-16',	1,	'다이렉트자동차보험', '2013-08-11',	1000000);

drop table ins_info;
select * from ins_info;

/*
	
1. 가입금액이 1백만원 이상인 고객들의 고객번호, 계약번호, 가입금액을 추출하시오.
2. 다이렉트자동차보험 가입 고객들의 고객번호, 상품명, 계약일을 계약일 오름차순으로 출력하시오
3. 상품계약일이 2013년 4월 16일 이후인 고객들의 고객번호, 계약일, 상품명을 고객번호 오름차순으로 출력하시오.
4. 보험 계약을 해지한 고객의 고객번호를 출력하시오.
5. 계약 종류 별 평균가입금액과 가입수를 추출하시오.
6. 계약이 해지된 계약의 종류와 수를 추출하시오
7. 2013년에 가입한 계약의 수와 평균 가입금액을 추출하시오
8. 살아있는 계약의 고객번호, 상품명, 가입금액을 추출하시오
*/

select * from ins_info where cnrt_amt>= 100000;
select * from ins_info where prdt_nm = '다이렉트자동차보험' order by id;
select * from ins_info where cnrt_dt > '2013-04-16' order by  id;
select * from ins_info where cncl_dt is not null;
select prdt_nm, avg(cnrt_amt) from ins_info group by prdt_nm order by  id;
select * from ins_info where cnrt_dt between '2013-01-01' and '2013-12-31' order by  id;
select * from ins_info where cncl_dt is null order by  id;
