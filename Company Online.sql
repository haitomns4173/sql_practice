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

select name, phone, address, product_id, PRODUCT_NAME,COST, order_date from (customers
left join order_details on customers.id=order_details.customer_id)
join product on product.id = order_details.PRODUCT_ID;