create database school;

use school;

create table courses (
	course_id varchar(10) primary key,
	head_teacher_id int foreign key REFERENCES teachers (teacher_id),  
	name_of_course varchar(50),
	cost decimal(10,2),
);

drop table courses;

insert into courses (course_id, head_teacher_id, name_of_course, cost) values ('Dip', 1, 'Computer Diploma', 500);
insert into courses (course_id, head_teacher_id, name_of_course, cost) values ('Eng', 2, 'Engish Medium', 1500);
insert into courses (course_id, head_teacher_id, name_of_course, cost) values ('Nep', 3, 'Neapli Medium', 200);


update courses set name_of_course = 'Computer Diploma' where course_id='Dip';

select * from courses;
 