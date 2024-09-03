create table Filme (
	id_filme serial PRIMARY KEY,
	titulo varchar(255) NOT NULL,
	categoria varchar(50) NOT NULL
);

create table DVD(
	id_dvd serial PRIMARY KEY,
	id_filme integer NOT NULL,
	constraint id_filme foreign key(id_filme) references Filme(id_filme)
);

create table Ator(
	id_ator serial PRIMARY KEY,
	nome varchar(255) NOT NULL,
	data_n date
);

create table Cliente(
	id_cliente serial PRIMARY KEY,
	nome varchar(255) NOT NULL,
	telefone varchar(14),
	data_n date,
	endereco varchar(255)
);

create table Locacao(
	id_locacao serial PRIMARY KEY,
	id_cliente integer NOT NULL,
	id_dvd integer NOT NULL,
	data_loca date,	
	constraint id_cliente foreign key(id_cliente) references Cliente(id_cliente),
	constraint id_dvd foreign key(id_dvd) references DVD(id_dvd)
);

create table Estrela(
	id_filme integer,
	id_ator integer,
	PRIMARY KEY(id_filme, id_ator),
	foreign key(id_filme) references Filme(id_filme),
	foreign key(id_ator) references Ator(id_ator)
);

select * from Filme

insert into Filme(titulo, categoria) values ('missao impossivel', 'acao');
insert into Filme(titulo, categoria) values ('titanic', 'romance');
insert into Filme(titulo, categoria) values ('anabele', 'terror');
insert into Filme(titulo, categoria) values ('gol', 'esporte');
insert into Filme(titulo, categoria) values ('cosmos', 'documentario');
insert into Filme(titulo, categoria) values ('debi loide', 'comedia');


select * from DVD

insert into DVD(id_filme) values ('1');
insert into DVD(id_filme) values ('2');
insert into DVD(id_filme) values ('3');
insert into DVD(id_filme) values ('4');
insert into DVD(id_filme) values ('5');
insert into DVD(id_filme) values ('6');


select * from Ator;

insert into Ator(nome , data_n) values ('tom cruise', '03-07-1968');
insert into Ator(nome , data_n) values ('leonardo dicaprio', '11-11-1974');
insert into Ator(nome , data_n) values ('annabelle wallis', '05-09-1984');
insert into Ator(nome , data_n) values ('kuno becker', '05-09-1978');
insert into Ator(nome , data_n) values ('carl sagan', '09-09-1934');
insert into Ator(nome , data_n) values ('jim carrey', '17-01-1962');


select * from Cliente;

insert into Cliente(nome, telefone, data_n, endereco) values ('lucas santos', '1234-5678', '1992-01-17', 'Rua A, 123');
insert into Cliente(nome, telefone, data_n, endereco) values ('fernanda pereira', '2345-6789', '1987-08-19', 'Avenida B, 456');
insert into Cliente(nome, telefone, data_n, endereco) values ('marcos lima', '3456-7890', '1985-11-05', 'Praça C, 789');
insert into Cliente(nome, telefone, data_n, endereco) values ('juliana martins', '4567-8901', '1990-03-22', 'Rua D, 101');
insert into Cliente(nome, telefone, data_n, endereco) values ('roberto almeida', '5678-9012', '1979-12-30', 'Avenida E, 202');

select * from Locacao; 

insert into Locacao(id_cliente, id_dvd, data_loca) values (1, 1, '2024-08-01');
insert into Locacao(id_cliente, id_dvd, data_loca) values (1, 2, '2024-08-02');
insert into Locacao(id_cliente, id_dvd, data_loca) values (2, 3, '2024-08-05');
insert into Locacao(id_cliente, id_dvd, data_loca) values (3, 4, '2024-08-10');
insert into Locacao(id_cliente, id_dvd, data_loca) values (4, 5, '2024-08-12');

select * from Estrela;

insert into Estrela(id_filme, id_ator) values ('1','1');
insert into Estrela(id_filme, id_ator) values ('2','2');
insert into Estrela(id_filme, id_ator) values ('3','3');
insert into Estrela(id_filme, id_ator) values ('4','4');
insert into Estrela(id_filme, id_ator) values ('5','5');




alter table Ator add column genero VARCHAR(10);

update Ator set genero = 'masculino' where nome in ('tom cruise');
update Ator set genero = 'masculino' where nome in ('leonardo dicaprio');
update Ator set genero = 'masculino' where nome in ('kuno becker');
update Ator set genero = 'masculino' where nome in ('carl sagan');
update Ator set genero = 'feminino' where nome in ('annabelle wallis');
update Ator set genero = 'masculino' where nome in ('jim carrey');



select * from Filme;

select nome from Ator where genero = 'masculino' order by nome;

select nome from Ator where nome like 'a%';

select titulo as nome_filme , categoria from Filme;

select titulo as nome_filme, categoria from Filme where categoria = 'comedia' order by titulo;

select distinct c.nome from Cliente c inner join Locacao l on c.id_cliente = l.id_cliente order by c.nome;

select count(*) from Locacao;

select c.nome, count(l.id_locacao) as qtd_locacoes from Cliente c inner join Locacao l on c.id_cliente = l.id_cliente
group by c.nome order by qtd_locacoes desc;

select f.titulo as nome_filme, count(e.id_ator) as qtd_atores from Filme f inner join  Estrela e on f.id_filme
= e.id_filme group by f.titulo order by qtd_atores desc;

select f.titulo as nome_filme, count(e.id_ator) as qtd_atores from Filme f left join  Estrela e on f.id_filme
= e.id_filme group by f.titulo order by qtd_atores desc;


