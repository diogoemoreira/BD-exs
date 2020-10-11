create table encomendas.Fornecedor(
	codigo int	not null,
	designacao varchar(30),
	fax int	not null,
	endereco varchar(30)	not null,
	NIF int	not null,
	nome varchar(30) not null,
	condicoes_pagamento varchar(30)	not null, --pronto,30dias,60dias,etc
	primary key(codigo),
);
create table encomendas.Encomenda(
	numero int	not null,
	data_encomenda	date,
	Fcodigo	int	not null,
	primary key(numero),
	foreign key(Fcodigo) references encomendas.Fornecedor(codigo),
);
create table encomendas.Produto(
	codigo	int	not null,
	nome	varchar(30)	not null,
	preco	int,
	iva		int,
	primary key(codigo),
);
create table encomendas.EcontemP(
	Pcod	int	not null,
	Enum	int	not null,
	quantidade	int,
	primary key(Pcod,Enum),
	foreign key(Pcod) references encomendas.Produto(codigo),
	foreign key(Enum) references encomendas.Encomenda(numero)
);
create table encomendas.Armazem(
	Pcod	int	not null,
	primary key(Pcod),
	foreign key(Pcod)	references encomendas.Produto(codigo),
);
create table encomendas.Iva(
	ID	int	not null,
	Taxa	int,
	primary key(ID),
);