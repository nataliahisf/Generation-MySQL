/*Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema trabalhará com as informações dos funcionaries desta empresa. */
create database db_RH;

use db_RH;

/* Crie uma tabela de funcionaries e utilizando a habilidade de abstração e determine 5 atributos relevantes dos funcionaries para se trabalhar com o serviço deste RH.*/
create table tb_funcionaries(
id bigint auto_increment,
nome varchar (200) not null,
data_nascimento date not null,
cargo varchar (50) not null,
salario decimal (10,2) not null,
primary key (id) 
);

/*Popule esta tabela com até 5 dados;*/
insert into tb_funcionaries (nome, data_nascimento, cargo, salario) values ("Joao","1990-12-12","Auxiliar de limpeza",3400.00);
insert into tb_funcionaries (nome, data_nascimento, cargo, salario) values ("Maria","1998-07-15","Diretora",7478.20);
insert into tb_funcionaries (nome, data_nascimento, cargo, salario) values ("Paula","1993-09-05","Gerente",8000.00);
insert into tb_funcionaries (nome, data_nascimento, cargo, salario) values ("Rodolfo","1989-01-06","Gerente",8000.00);

/*Ao término atualize um dado desta tabela através de uma query de atualização.*/
-- mudar salário e cargo id 4 - rodolfo
update tb_funcionaries set salario = 1500.00 where id = 4;
update tb_funcionaries set cargo = "office boy" where id = 4;

select * from tb_funcionaries;

/*Faça um select que retorne os funcionaries com o salário maior do que 2000.*/
select * from tb_funcionaries where salario > 2000.00;

/*Faça um select que retorne os funcionaries com o salário menor do que 2000.*/
select * from tb_funcionaries where  salario < 2000.00;