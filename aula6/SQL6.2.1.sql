/*Schema creation*/
create schema Company;
/**/
/* Tables destruction */
alter table Company.Employee drop constraint employeeSuper;
alter table Company.Employee drop constraint employeeDept;
alter table Company.Dept_locations drop constraint deptLocDpet;
alter table Company.Project drop constraint projcetDpet;
alter table Company.Works_on drop constraint worksProject;
alter table Company.Works_on drop constraint worksEmployee;
alter table [Company.Dependent] drop constraint dependentEmployee;

drop table Company.Employee;
drop table Company.Department;
drop table Company.Dept_locations;
drop table Company.Project;
drop table Company.Works_on;
drop table Company.Dependent_;
/**/

create table Company.Department(
	Dname			varchar(30)		not null,
	Dnumber			int				not null,
	Mgr_Ssn			char(9)					,
	Mgr_start_date	date,

	primary key (Dnumber)
);

create table Company.Employee (
	Fname		varchar(30)		not null,
	Minit		char(1)					,
	Lname		varchar(30)		not null,
	Ssn			char(9)			not null,
	Bdate		date,
	[Address]	varchar(30),
	Sex			char(1)			not null,
	Salary		decimal(6,2)	not null,
	Super_ssn	char(9),
	Dno			int				not null,
	
	primary key (Ssn),
	foreign key (Super_ssn) references Company.Employee (Ssn),
	foreign key (Dno) references Company.Department (Dnumber)
);

create table Company.Dept_locations(
	Dnumber		int			not null,
	Dlocation	varchar(30)	not null,

	primary key (Dnumber,Dlocation),
	foreign key (Dnumber) references Company.Department (Dnumber)
);

create table Company.Project(
	Pname		varchar(30)		not null,
	Pnumber		int				not null,
	Plocation	varchar(30)		not null,
	Dnum		int				not null,

	primary key (Pnumber),
	foreign key (Dnum) references Company.Department (Dnumber)
);

create table Company.Works_on(
	Essn	char(9)			not null,
	Pno		int				not null,
	CW_Hours	decimal(3,1)	not null,

	primary key (Essn,Pno),
	foreign key (Pno) references Company.Project (Pnumber),
	foreign key (Essn) references Company.Employee (Ssn)
);

create table Company.Dependent_(
	Essn			char(9)		not null,
	Dependent_name	varchar(30)	not null,
	Sex				char(1)		not null,
	Bdate			date				,
	Relationship	varchar(30)	not null

	primary key (Essn,Dependent_name),
	foreign key (Essn) references Company.Employee (Ssn)
);

/* inserting info in tables */
insert into Company.Department values ('Investigacao',1,'21312332','2010-08-02');
insert into Company.Department values ('Comercial',2,'321233765','2013-05-16');
insert into Company.Department values ('Logistica',3,'41124234','2013-05-16');
insert into Company.Department values ('Recursos Humanos',4,'12652121','2014-04-02');
insert into Company.Department values ('Desporto',5,NULL,NULL);

insert into Company.Employee values ('Paula','A','Sousa','183623612','2001-08-11','Rua da FRENTE','F',1450.00,NULL,3);
insert into Company.Employee values ('Carlos','D','Gomes','21312332','2000-01-01','Rua XPTO','M',1200.00,NULL,1);
insert into Company.Employee values ('Juliana','A','Amaral','321233765','1980-08-11','Rua BZZZZ','F',1350.00,NULL,3);
insert into Company.Employee values ('Maria','I','Pereira','342343434','2001-05-01','Rua JANOTA','F',1250.00,'21312332',2);
insert into Company.Employee values ('Joao','G','Costa','41124234','2001-01-01','Rua YGZ','M',1300.00,'21312332',2);
insert into Company.Employee values ('Ana','L','Silva','12652121','1990-03-03','Rua ZIG ZAG','F',1400.00,'21312332',2);

insert into Company.Dependent_ values ('21312332' ,'Joana Costa','F','2008-04-01', 'Filho');
insert into Company.Dependent_ values ('21312332' ,'Maria Costa','F','1990-10-05', 'Neto');
insert into Company.Dependent_ values ('21312332' ,'Rui Costa','M','2000-08-04','Neto');
insert into Company.Dependent_ values ('321233765','Filho Lindo','M','2001-02-22','Filho');
insert into Company.Dependent_ values ('342343434','Rosa Lima','F','2006-03-11','Filho');
insert into Company.Dependent_ values ('41124234' ,'Ana Sousa','F','2007-04-13','Neto');
insert into Company.Dependent_ values ('41124234' ,'Gaspar Pinto','M','2006-02-08','Sobrinho');

insert into Company.Dept_locations values (2,'Aveiro');
insert into Company.Dept_locations values (3,'Coimbra');

insert into Company.Project values ('Aveiro Digital',1,'Aveiro',3);
insert into Company.Project values ('BD Open Day',2,'Espinho',2);
insert into Company.Project values ('Dicoogle',3,'Aveiro',3);
insert into Company.Project values ('GOPACS',4,'Aveiro',3);

insert into Company.Works_on values ('183623612',1,20.0);
insert into Company.Works_on values ('183623612',3,10.0);
insert into Company.Works_on values ('21312332' ,1,20.0);
insert into Company.Works_on values ('321233765',1,25.0);
insert into Company.Works_on values ('342343434',1,20.0);
insert into Company.Works_on values ('342343434',4,25.0);
insert into Company.Works_on values ('41124234' ,2,20.0);
insert into Company.Works_on values ('41124234' ,3,30.0);