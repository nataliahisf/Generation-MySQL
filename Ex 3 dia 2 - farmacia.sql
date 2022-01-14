/*Crie um banco de dados para um serviço de farmácia de uma empresa, o nome do banco
deverá ter o seguinte nome db_farmacia_do_bem, onde o sistema trabalhará com as
informações dos produtos desta empresa.*/

create database db_farmacia_do_bem;
use db_farmacia_do_bem;

/*O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.
Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desta farmacia.
Popule esta tabela Categoria com até 5 dados.*/

create table tb_categoria(
id bigint not null auto_increment,
descricao varchar(255),
ativo boolean, /*pode não ter um ativo, nesse caso seria ocutado*/
primary key (id)
);

insert into tb_categoria (descricao, ativo) values ("antibiótico",true);
insert into tb_categoria (descricao, ativo) values ("antihistamínico",true);
insert into tb_categoria (descricao, ativo) values ("higiene pessoal",true);
insert into tb_categoria (descricao, ativo) values ("beleza",true);
insert into tb_categoria (descricao, ativo) values ("energético",true);


select * from tb_categoria;

/*Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5
atributos relevantes dos tb_produto para se trabalhar com o serviço deste farmacia(não
esqueça de criar a foreign key de tb_categoria nesta tabela).
Popule esta tabela Produto com até 8 dados.*/

create table tb_produto(
id bigint not null auto_increment,
nome varchar(255),
datacadastro timestamp, /*pega data e hora direto do sistema*/
quantidade int,
preco decimal (7,2),
categoria_id bigint,
primary key (id),
foreign key (categoria_id) references tb_categoria (id)
);

insert into tb_produto (nome, datacadastro, quantidade, preco, categoria_id) values ("Desodorante Rexona",current_date(),10,19.90,3);
insert into tb_produto (nome, datacadastro, quantidade, preco, categoria_id) values ("Shampoo",current_date(),20,19.90,3);
insert into tb_produto (nome, datacadastro, quantidade, preco, categoria_id) values ("Allegra",current_date(),28,19.90,2);
insert into tb_produto (nome, datacadastro, quantidade, preco, categoria_id) values ("Dorflex",current_date(),98,19.90,2);
insert into tb_produto (nome, datacadastro, quantidade, preco, categoria_id) values ("Secotex",current_date(),63,200.00,1);
insert into tb_produto (nome, datacadastro, quantidade, preco, categoria_id) values ("Monster",current_date(),7,12.60,5);
insert into tb_produto (nome, datacadastro, quantidade, preco, categoria_id) values ("Herbimicina",current_date(),20,43.20,1);
insert into tb_produto (nome, datacadastro, quantidade, preco, categoria_id) values ("LifeStrong",current_date(),50,9.60,5);

select * from tb_produto;


/*Faça um select que retorne os Produtos com o valor maior do que 50 reais.*/
select * from tb_produto where preco > 50;

/*Faça um select trazendo os Produtos com valor entre 3 e 60 reais.*/
select * from tb_produto where preco between 3 and 60;

/*Faça um select utilizando LIKE buscando os Produtos com a letra B.*/
select * from tb_produto where nome like "%B%";

/*Faça um select com Inner join entre tabela categoria e produto.*/
select * from tb_produto inner join tb_categoria on tb_categoria.id = tb_produto.categoria_id;

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são cosméticos).*/
select * from tb_produto inner join tb_categoria on tb_categoria.id = tb_produto.categoria_id where tb_categoria.id = 3;