create table class (
	class_id int identity(1,1),
	class_name varchar(20) primary key,
	class_teacher int foreign key REFERENCES teachers (teacher_id) unique,  
	no_students int not null,
	room_no int not null unique,
);

drop table class;

select * from class order by class_id asc;

insert into class (class_name, class_teacher, no_students, room_no) values('10Dip', 1, 48, 14);
insert into class (class_name, class_teacher, no_students, room_no) values('9Dip', 2, 48, 13);
insert into class (class_name, class_teacher, no_students, room_no) values('11Dip', 4, 48, 12);
insert into class (class_name, class_teacher, no_students, room_no) values('12Dip', 5, 48, 11);
