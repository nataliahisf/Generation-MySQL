/*Crie um banco de dados para um e commerce, onde o sistema trabalhará com as informações dos produtos deste ecommerce. */
create database db_ecommerce;
use db_ecommerce;

/*Crie uma tabela produtos e utilizando a habilidade de abstração e determine 5 atributos relevantes dos produtos para se trabalhar com o serviço deste ecommerce.*/
create table tb_produtos(
primary key (cod),
cod bigint auto_increment,
nome varchar (200) not null,
valor decimal (10,2) not null,
categoria varchar (50),
quantidade int
);

/*Popule esta tabela com até 8 dados;*/
insert into tb_produtos(nome, valor, categoria, quantidade)  values ("Motorola G1",100.00,"celular",14);
insert into tb_produtos(nome, valor, categoria, quantidade)  values ("Motorola G2",200.00,"celular",29);
insert into tb_produtos(nome, valor, categoria, quantidade)  values ("Motorola G3",300.00,"celular",20);
insert into tb_produtos(nome, valor, categoria, quantidade)  values ("Xiaomi X7",400.00,"smartphone",06);
insert into tb_produtos(nome, valor, categoria, quantidade)  values ("Hwaei H3",500.00,"smartphone",10);
insert into tb_produtos(nome, valor, categoria, quantidade)  values ("Hwaei H5",600.00,"smartphone",08);
insert into tb_produtos(nome, valor, categoria, quantidade)  values ("Samsung T3",700.00,"tablet",10);
insert into tb_produtos(nome, valor, categoria, quantidade)  values ("Samsung SW1",800.00,"smartwatch",10);

/*Faça um select que retorne os produtos com o valor maior do que 500.*/
select * from tb_produtos where valor > 500.00;

/*Faça um select que retorne os produtos com o valor menor do que 500.*/
select * from tb_produtos where valor < 500.00;

select * from tb_produtos;

/*Ao término atualize um dado desta tabela através de uma query de atualização.*/
update tb_produtos set valor = 80.00 where cod = 1;