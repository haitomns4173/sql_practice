--Example of one line comment

/* Example of
	MULTILINE comment */

create database company 




use company 




create table department(
	ID int primary key identity(1,1),
	DEPARTMENT_NAME varchar(50),
	DEPARTMET_HEAD VARCHAR(80),
	DEPARTMENT_FLOOR SMALLINT UNIQUE
	);

create table employee(
	ID int primary key identity(1,1),
	NAME varchar(80) not null,
	AGE int check (AGE>=18),
	ADDRESS VARCHAR(100),
	PHONE VARCHAR(10),
	DEPARTMENT_ID int references department(id)
	);

create table product(
	ID int primary key identity(1,1),
	PRODUCT_NAME varchar(100),
	COST decimal(18,2),
	STOCK int default 1,
);

create table customers(
	ID int primary key identity(1,1),
	NAME varchar(80) not null,
	GMAIL varchar(150) unique,
	PHONE varchar(10) not null, 
	CITY varchar(80) not null,
	ADDRESS varchar(100) not null
	);

create table order_details (
	ID int primary key identity(1,1),
	CUSTOMER_ID int references customers(ID),
	PRODUCT_ID int references product(ID),
	ORDER_DATE datetime default CURRENT_TIMESTAMP
	);

create table temp_table (
	ID int primary key identity (1,1),
	NAME varchar(80), 
	AGE smallint not null,
	SALARY decimal (18,2),
	POST varchar(50),
	);




insert into department (DEPARTMENT_NAME, DEPARTMET_HEAD, DEPARTMENT_FLOOR)
values('Administration', 'Haitomns', 1);

insert into department (DEPARTMENT_NAME, DEPARTMET_HEAD, DEPARTMENT_FLOOR)
values('Manager', 'Andrue0', 2),
('Store_Room', 'Reclock', 3), 
('Packing', 'Blak', 4),
('Delivery', 'Ethan', 5),
('Service', 'Betty', 6);

insert into employee (NAME, AGE, ADDRESS, PHONE, DEPARTMENT_ID)
values('Haitomns', 23, '2VCR+PV', 9845055654, 1);

insert into employee (NAME, AGE, ADDRESS, PHONE, DEPARTMENT_ID)
values('Andrue0', 23, 'Birgunj-12', 984577412, 2),
('Reclock', 20, '38PG+98', 9809457456, 3),
('Blak', 32, '2PVC+00', 9847655252, 4),
('Ethan', 21, '33PD+13', 9845255454, 5),
('Betty', 24, '2FDc+98', 9804547474, 6);

insert into customers (NAME, GMAIL, PHONE, CITY, ADDRESS)
values('Ashish Gupta', 'ashishgupta@gmail.com', 9809204764, 'Birgunj', '2VCR+PV'),
('Manik Shriwastav', 'manik244@gmail.com', 9845244746, 'Birgunj', 'Pipra'),
('Bikash Gupta', 'bkgupta@gmail.com', 9475445400, 'Bara', 'Parsauni'),
('Rahul Patel', 'rahulpatel12@gmail.com', 984755201, 'Bara', 'Unknown');

insert into product (PRODUCT_NAME, COST, STOCK) 
values('Asus Vivobook 15', 69921, 4),
('Mi Notebook 14', 43999, 2),
('Mi Notebook Horizon Edition', 54999, 5),
('Asus TUF Gaming', 689900, 9),
('Asus Vivobook 14',  49990, 6),
('Lenovo Ideapad S145', 49990, 5),
('Acer Swift 3', 64990, 11);

insert into order_details (CUSTOMER_ID, PRODUCT_ID)
values(4, 2),
(2, 3),
(3, 1),
(4, 4),
(1, 7),
(3, 6);

insert into temp_table (NAME, AGE, SALARY, POST)
values ('Hank', 20, 4000, 'Engineer'),
('Tom', 30, 20000, 'Doctor'),
('Vyper', 20, 30000, 'Driver'),
('Pyta', 33, 400300, 'Joker');




update customers set name = 'Aryan', gmail = 'aryan34@outlook.com' where id = 3;

update product set product_name = 'Dell Inspiron 3200', cost = 200000 where id = 2;




delete order_details where id = 4;

delete employee where id = 1;

delete department;

drop table employee;

drop database online;




backup database online to disk = 'C:\Users\haito\Desktop';

backup database online to disk = 'C:\Users\haito\Desktop' with differential;




alter table employee add DOB date; 

alter table temp_table drop POST;

alter table temp_table alter column name varchar(100);


alter table order_details 
drop constraint PK_ID;

alter table order_details 
drop constraint FK_ID;

alter table employee 
drop CHK_AGE;


alter database online modify NAME = company;


truncate table temp_table;


create index haitomns on customers (name, gmail, phone);

drop index customers.haitomns;




select * from product where cost < 10000;

select * from employee where age > 30;

select * from customers where id <= 10;

select * from customers where id >= 2;

select * from department where id = 4;

select * from customers where id != 3;

select * from product where cost < 10000 and cost > 30000;

select * from product where id >= 3 or id = 1;

select * from department where not id < 2;

select * from order_details order by ORDER_DATE asc;

select * from order_details order by CUSTOMER_ID desc;

select * from temp_table where salary is null;

select top 200 * from department; 

select top 20 percent * from department;

select * from customers where name like 'As%';

select * from customers where name like '__hu%';

select * from order_details where CUSTOMER_ID in (3,4);

select * from customers where id between 2 and 5;

select ID as id, name from customers;

select distinct * from temp_table;

select count(age) as AGE_SUM from employee; 

select * from customers where id > any (select id from customers where id =1 )

select * from customers where exists (select id from customers where id =1 )

select * from employee where age > 30
union
select * from employee where id <= 10;



select name, phone, address, customer_id, PRODUCT_ID, ORDER_DATE from customers
inner join order_details on customers.id=order_details.customer_id;

select name, age, phone, department_name, DEPARTMENT_FLOOR,DEPARTMET_HEAD from department 
left join employee on department.ID=employee.DEPARTMENT_ID;

select name, age, phone, department_name, DEPARTMENT_FLOOR,DEPARTMET_HEAD from department 
right join employee on department.ID=employee.DEPARTMENT_ID;

select name, phone, address, customer_id, PRODUCT_ID, ORDER_DATE from customers
full outer join order_details on customers.id=order_details.customer_id;

select name, phone, address, product_id, PRODUCT_NAME,COST, order_date from (customers
left join order_details on customers.id=order_details.customer_id)
left join product on product.id = order_details.PRODUCT_ID;




select sum(cost) as Cost_Sum from product;

select min(cost) as Cost_min from product;

select max(cost) as Cost_max from product;

select avg(cost) as Cost_avg from product;

select name, age gmail,
case when age>=18 then 'You are Eligible'
	 when age <18 then 'You are not elidigible'
	 else 'No age'
	 end as result
 from employee;

select NAME as NEW_COLUMN_NAME from customers;


select cost + stock as totalCostofProduct from product

select cost - stock as totalCostofProduct from product

select cost * stock as totalCostofProduct from product

select cost / stock as totalCostofProduct from product

select cost % stock as totalCostofProduct from product




create view idLessThan3 as select id, name, GMAIL, phone from customers where id <= 3;

SELECT * from idLessThan3;

drop view idLessThan3;



create procedure selectAllData as 
select * from customers
select * from department
select * from employee
select * from order_details
select * from product
select * from temp_table

exec selectAllData;


commit;

rollback;