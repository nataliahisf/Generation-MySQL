/*Crie um banco de dados para um serviço de pizzaria de uma empresa, o nome do banco
deverá ter o seguinte nome db_pizzaria_legal, onde o sistema trabalhará com as
informações dos produtos desta empresa.*/

create database db_pizzaria_legal;
use db_pizzaria_legal;

/*O sistema trabalhará com 2 tabelas tb_pizza e tb_categoria.
Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço dessa pizzaria.*/

create table tb_categoria(
id bigint not null auto_increment,
categoria varchar(50) not null,
borda varchar (50) not null,
massa varchar (50),
primary key (id)
);

/*Popule esta tabela Categoria com até 5 dados.*/

insert into tb_categoria (categoria, borda, massa) values ("Salgada","sem recheio", "fina");
insert into tb_categoria (categoria, borda, massa) values ("Salgada","recheio catupiry", "fina");
insert into tb_categoria (categoria, borda, massa) values ("Salgada","recheio mussarela", "grossa");
insert into tb_categoria (categoria, borda, massa) values ("Salgada","sem recheio", "grossa");
insert into tb_categoria (categoria, borda, massa) values ("doce","sem recheio", "fina");

select * from tb_categoria;

/*Crie uma tabela de tb_pizza e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço dessa pizzaria(não esqueça de
criar a foreign key de tb_categoria nesta tabela).*/

create table tb_pizza(
id bigint not null auto_increment,
sabor varchar(100),
dois_sabores boolean,
valor decimal (4,2),
tamanho varchar (50),
categoria_id bigint,
primary key (id),
foreign key (categoria_id) references tb_categoria (id)
);

/*Popule esta tabela pizza com até 8 dados.*/

insert into tb_pizza (sabor, dois_sabores, valor, tamanho, categoria_id) values ("Calabresa",true, 30.00, "pequena",  1);
insert into tb_pizza (sabor, dois_sabores, valor, tamanho, categoria_id) values ("Portuguesa",false, 35.00, "media",  2);
insert into tb_pizza (sabor, dois_sabores, valor, tamanho, categoria_id) values ("Marguerita",true, 40.90, "grande",  3);
insert into tb_pizza (sabor, dois_sabores, valor, tamanho, categoria_id) values ("Frango com catupiry",false, 52.00, "pequena",  4);
insert into tb_pizza (sabor, dois_sabores, valor, tamanho, categoria_id) values ("Muçarela",true, 43.30, "media",  1);
insert into tb_pizza (sabor, dois_sabores, valor, tamanho, categoria_id) values ("Chocolate Nutella com morango",false, 30.00, "grande",  5);
insert into tb_pizza (sabor, dois_sabores, valor, tamanho, categoria_id) values ("Napolitana",true, 48.00, "pequena", 3);
insert into tb_pizza (sabor, dois_sabores, valor, tamanho, categoria_id) values ("Bauru",false, 23.00, "media",  2);

select * from tb_categoria;

/*Faça um select que retorne os Produtos com o valor maior do que 45 reais.*/
select * from tb_pizza where valor > 45.00;

/*Faça um select trazendo os Produtos com valor entre 29 e 60 reais.*/
select * from tb_pizza where valor between 29.00 and 60.00;

/*Faça um select utilizando LIKE buscando os Produtos com a letra C.*/
select * from tb_pizza where sabor like "%C%";

/*Faça um select com Inner join entre tabela categoria e pizza.*/
select * from tb_pizza inner join tb_categoria on tb_categoria.id = tb_pizza.categoria_id;

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são pizza doce).*/
select * from tb_pizza inner join tb_categoria on tb_pizza.id = tb_pizza.categoria_id where tb_categoria.id = 3;