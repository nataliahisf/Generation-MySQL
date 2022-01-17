/*Crie um banco de dados para um serviço de um açougue ou uma quitanda, o nome do
banco deverá ter o seguinte nome db_cidade_das_carnes ou db_cidade_das_frutas, onde o
sistema trabalhará com as informações dos produtos desta empresa.*/

create database db_cidade_das_frutas;
use db_cidade_das_frutas;

/*Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desse açougue.*/

create table tb_categoria(
id bigint not null auto_increment,
categoria varchar(50) not null,
tipo varchar (50),
ativo boolean,
primary key (id)
);

/*Popule esta tabela Categoria com até 5 dados.*/
insert into tb_categoria (categoria, tipo, ativo) values ("fruta","cítrica", true);
insert into tb_categoria (categoria, tipo, ativo) values ("salada de fruta","semi-ácidas", false);
insert into tb_categoria (categoria, tipo, ativo) values ("fruta","semi-ácidas", true);
insert into tb_categoria (categoria, tipo, ativo) values ("danone","cítricas", true);
insert into tb_categoria (categoria, tipo, ativo) values ("vitamina","semi-ácidas", true);

select * from tb_categoria;

/*Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço desse açougue(não esqueça de
criar a foreign key de tb_categoria nesta tabela).*/

create table tb_produto(
id bigint not null auto_increment,
nome varchar(255),
preco_kl decimal (4,2),
quantidade int,
data_atualizacao datetime,
categoria_id bigint,
primary key (id),
foreign key (categoria_id) references tb_categoria (id)
);

/*Popule esta tabela Produto com até 8 dados.*/
insert into tb_produto (nome, preco_kl, quantidade, data_atualizacao, categoria_id) values ("Laranja",6.00,300,"2022-01-15",1);
insert into tb_produto (nome, preco_kl, quantidade, data_atualizacao, categoria_id) values ("Maça",2.00,180,"2022-01-13",3);
insert into tb_produto (nome, preco_kl, quantidade, data_atualizacao, categoria_id) values ("maça vermelha, caqui,goiaba e manga",15.00,3,"2022-01-10",2);
insert into tb_produto (nome, preco_kl, quantidade, data_atualizacao, categoria_id) values ("pera",4.00,50,"2022-01-16",3);
insert into tb_produto (nome, preco_kl, quantidade, data_atualizacao, categoria_id) values ("maça vermelha, morango, framboesa",65.00,9,"2022-01-15",4);
insert into tb_produto (nome, preco_kl, quantidade, data_atualizacao, categoria_id) values ("jabuticaba",9.00,277,"2022-01-13",1);
insert into tb_produto (nome, preco_kl, quantidade, data_atualizacao, categoria_id) values ("goiaba",7.00,180,"2022-01-14",3);
insert into tb_produto (nome, preco_kl, quantidade, data_atualizacao, categoria_id) values ("banana, abacate, maça",23.00,5,"2022-01-16",5);

select * from tb_produto;

/*Faça um select que retorne os Produtos com o valor maior do que 50 reais.*/
select * from tb_produto where preco_kl > 50;

/*Faça um select trazendo os Produtos com valor entre 3 e 60 reais.*/
select * from tb_produto where preco_kl between 3.00 and 60.00;

/*Faça um select utilizando LIKE buscando os Produtos com a letra C.*/
select * from tb_produto where nome like "%C%";

/*Faça um um select com Inner join entre tabela categoria e produto.*/
select * from tb_produto inner join tb_categoria on tb_categoria.id = tb_produto.categoria_id;

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são aves ou legumes).*/
select * from tb_produto inner join tb_categoria on tb_categoria.id = tb_produto.categoria_id where tb_categoria.id = 4;