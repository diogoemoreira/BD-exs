create table conferencias.Pessoa(
	nome	varchar(30)	not null,
	primary key(nome),
);

create table conferencias.ArtigosCientificos(
	num	int	not null,
	titulo	varchar(30),
	primary key(num),
);

create table conferencias.CapresentaAC(
	ACnum	int	not null,
	primary key(ACnum),
	foreign key(ACnum) references conferencias.ArtigosCientificos(num),
);

create table conferencias.Instituicao(
	nome	varchar(30)	not null,
	endereco	varchar(30),
	primary key(nome),
);

create table conferencias.Autor(
	nome	varchar(30)	not null,
	email	varchar(30)	not null,
	Inome	varchar(30)	not null,
	primary key(email),
	foreign key(nome) references conferencias.Pessoa(nome),
	foreign key(Inome) references conferencias.Instituicao(nome),
);

create table conferencias.AtemAC(
	ACnum	int not null,
	Aemail	varchar(30) not null,
	primary key(ACnum,Aemail),
	foreign key(ACnum) references conferencias.ArtigosCientificos(num),
	foreign key(Aemail) references conferencias.Autor(email),
);

create table conferencias.Participante(
	nome	varchar(30) not null,
	endereco	varchar(30) not null,
	morada	varchar(30),
	primary key(endereco),
	foreign key(nome) references conferencias.Pessoa(nome),
);

create table conferencias.Estudante(
	endereco	varchar(30) not null,
	comprovativo	varchar(30) not null,
	primary key(endereco),
	foreign key(endereco) references conferencias.Participante(endereco),
);

create table conferencias.IregistaE(
	Inome	varchar(30) not null,
	Eend	varchar(30) not null,
	Primary key(Inome,Eend),
	foreign key(Eend) references conferencias.Estudante(endereco),
	foreign key(Inome) references conferencias.Instituicao(nome),
);


create table conferencias.NaoEstudante(
	endereco	varchar(30) not null,
	referencia_bancaria	varchar(30)	not null,
	primary key(endereco),
	foreign key(endereco) references conferencias.Participante(endereco),
);

create table conferencias.CregistaNE(
	NEend	varchar(30) not null,
	primary key(NEend),
	foreign key(NEend) references conferencias.NaoEstudante(endereco),
);