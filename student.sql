create table student (
	roll int identity(1,1) primary key,
	student_name varchar(60) not null,
	class varchar(20) foreign key REFERENCES class(class_name),
	phone_no varchar(10) not null,
	medium varchar(10) foreign key REFERENCES courses(course_id),
);

drop table student;

insert into student (student_name, class, phone_no, medium) 
	values('Alok Gupta', '10Dip', 9845200254, 'Dip');
insert into student (student_name, class, phone_no, medium) 
	values('Ashish Gupta', '9Dip', 9845255254, 'Dip');
insert into student (student_name, class, phone_no, medium) 
	values('Satender Chauhan', '12Dip', 9842542214, 'Dip');
insert into student (student_name, class, phone_no, medium) 
	values('Manik Shriwastav', '11Dip', 9845554698, 'Dip');
insert into student (student_name, class, phone_no, medium) 
	values('Bikash Gupta', '11Dip', 9845554698, 'Dip');
insert into student (student_name, class, phone_no, medium) 
	values('Rahul Patel', '10Dip', 9845544798, 'Dip');

delete student where student_name = 'Mnaik shriwastav';


select * from student