create table teachers (
	teacher_id int identity(1,1) primary key,
	name_of_teacher varchar(60) not null,
	position varchar(40) not null,
	phone_no varchar(10) unique,
	salary decimal(10,2) not null,
);

drop table teachers;

insert into teachers (name_of_teacher, position, phone_no, salary) values ('Sanjay Kurmi', 'Co-ordinator', '9845225478', 1220);
insert into teachers (name_of_teacher, position, phone_no, salary) values ('Shambhu Patel', 'Co-ordinator', '9221455464', 1320);
insert into teachers (name_of_teacher, position, phone_no, salary) values ('Nandkishor Patel', 'Co-ordinator', '9562144545', 1420);
insert into teachers (name_of_teacher, position, phone_no, salary) values ('Sandeep Chaurisiya', 'Teacher', '984522135', 1200);
insert into teachers (name_of_teacher, position, phone_no, salary) values ('Santosh Patel', 'Teacher', '9854522654', 1920);

select * from teachers;