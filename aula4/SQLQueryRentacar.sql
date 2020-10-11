CREATE TABLE rentacar.Cliente(
	Nome VARCHAR(30)	NOT NULL,
	Endereco VARCHAR(30)	NOT NULL,
	NumCarta INT,
	NIF INT,
	PRIMARY KEY(NIF),
);

CREATE TABLE rentacar.Balcao(
	Nome VARCHAR(30),
	Numero INT,
	Endereco VARCHAR(30),
	PRIMARY KEY(Numero),
);

CREATE TABLE rentacar.Tipo_Veiculo(
	Designacao VARCHAR(30),
	Ar_condicionado	BIT,
	Codigo INT,
	PRIMARY KEY(Codigo),
);

CREATE TABLE rentacar.Veiculo(
	Ano DATE,
	Matricula CHAR(8),
	Marca CHAR,
	Tipo_Veiculo_codigo INT,
	PRIMARY KEY(Matricula),
	FOREIGN KEY(Tipo_Veiculo_codigo)	REFERENCES rentacar.Tipo_Veiculo(Codigo)
);

CREATE TABLE rentacar.Aluguer(
	Data_Aluguer DATE,
	Numero INT	NOT NULL,
	Duracao INT,
	Cliente_NIF INT	NOT NULL,
	Balcao_numero INT,
	Veiculo_matricula INT,
	PRIMARY KEY(Numero),
	FOREIGN KEY(Cliente_NIF)	REFERENCES rentacar.Cliente(NIF),
	FOREIGN KEY(Balcao_numero)	REFERENCES rentacar.Balcao(Numero),
);

CREATE TABLE rentacar.Pesado(
	Peso INT,
	Passageiros INT,
	Tipo_Veiculo_Codigo INT,
	PRIMARY KEY(Tipo_Veiculo_Codigo),
	FOREIGN KEY(Tipo_Veiculo_Codigo) REFERENCES rentacar.Tipo_Veiculo(Codigo)
);

CREATE TABLE rentacar.Ligeiro(
	Portas INT,
	Num_lugares INT,
	Combustivel INT,
	Tipo_Veiculo_Codigo INT,
	PRIMARY KEY(Tipo_Veiculo_Codigo),
	FOREIGN KEY(Tipo_Veiculo_Codigo) REFERENCES rentacar.Tipo_Veiculo(Codigo),
);

CREATE TABLE rentacar.Similaridade(
	Codigo_Veiculo1	INT,
	Codigo_Veiculo2	INT,
	FOREIGN KEY(Codigo_Veiculo1)	REFERENCES rentacar.Tipo_Veiculo(Codigo),
	FOREIGN KEY(Codigo_Veiculo2)	REFERENCES rentacar.Tipo_Veiculo(Codigo),
);