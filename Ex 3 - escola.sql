/*Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará com as informações dos estudantes deste registro dessa escola.*/ 
create database db_escola;
use db_escola;

/*Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 atributos relevantes dos estudantes para se trabalhar com o serviço dessa escola.*/
create table tb_estudantes(
primary key (matricula),
matricula bigint auto_increment,
nome varchar (200) not null,
idade int not null,
serie varchar (20) not null,
nota decimal (3,1) not null
);

/*Popule esta tabela com até 8 dados;*/
insert into tb_estudantes(nome, idade, serie, nota)  values ("Agatha",15,"1 ensino medio",10.0);
insert into tb_estudantes(nome, idade, serie, nota)  values ("Agda",15,"1 ensino medio",10.0);
insert into tb_estudantes(nome, idade, serie, nota)  values ("Amanda",16,"2 ensino medio",2.5);
insert into tb_estudantes(nome, idade, serie, nota)  values ("Alana",14,"8 serie",6.0);
insert into tb_estudantes(nome, idade, serie, nota)  values ("Anderson",13,"7 serie",8.5);
insert into tb_estudantes(nome, idade, serie, nota)  values ("Antonio",16,"2 ensino medio",5.5);
insert into tb_estudantes(nome, idade, serie, nota)  values ("Ana",15,"1 ensino medio",7.9);
insert into tb_estudantes(nome, idade, serie, nota)  values ("Angelo",14,"8 serie",8.6);

select * from tb_estudantes;

/*Faça um select que retorne o/as estudantes  com a nota maior do que 7.*/
select * from tb_estudantes where nota > 7.0;

/*Faça um select que retorne o/as estudantes  com a nota menor do que 7.*/
select * from tb_estudantes where nota < 7.0;

/*Ao término atualize um dado desta tabela através de uma query de atualização.*/
update tb_estudantes set nota = 6.0 where matricula = 6;
