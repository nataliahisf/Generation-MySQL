/*Crie um banco de dados para um serviço de uma loja de produtos de construção, o nome
do banco deverá ter o seguinte nome db_construindo_a_nossa_vida, onde o sistema
trabalhará com as informações dos produtos desta empresa.*/

create database db_construindo_a_nossa_vida;
use db_construindo_a_nossa_vida;

/*Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço deste ecommerce.*/

create table tb_categorias(
id bigint auto_increment,
tipo varchar(255) not null,
ativo boolean not null,
primary key (id)
);

/*Popule esta tabela Categoria com até 5 dados.*/
INSERT INTO tb_categorias (tipo, ativo) VALUES ("Hidráulico", true);
INSERT INTO tb_categorias (tipo, ativo) VALUES ("Elétrico", true);
INSERT INTO tb_categorias (tipo, ativo) VALUES ("Acabamento", true);
INSERT INTO tb_categorias (tipo, ativo) VALUES ("Pneumático", false);
INSERT INTO tb_categorias (tipo, ativo) VALUES ("Pregos", true);

select * from tb_categorias;

/*Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço de uma loja de produtos (não
esqueça de criar a foreign key de tb_categoria nesta tabela).*/

create table tb_produto (
id bigint auto_increment,
nome varchar (255) not null,
modelo varchar (255) not null,
preco decimal(6,2) not null,
quantidade int not null,
categoria_id bigint,
primary key (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categorias (id)
);

/*Popule esta tabela Produto com até 8 dados.*/

INSERT INTO tb_produto (nome, modelo, preco, quantidade, categoria_id) VALUES ("Parafuso achatado", "amanco soluções", 29.90, 70, 5);
INSERT INTO tb_produto (nome, modelo, preco, quantidade, categoria_id) VALUES ("Cano PVC", "tigre T 2/4", 2.00, 50, 1);
INSERT INTO tb_produto (nome, modelo, preco, quantidade, categoria_id) VALUES ("Disjuntor", "WEG 50W", 130.20, 10, 2);
INSERT INTO tb_produto (nome, modelo, preco, quantidade, categoria_id) VALUES ("Rejunte", "Color seca rápido", 80.00, 100, 3);
INSERT INTO tb_produto (nome, modelo, preco, quantidade, categoria_id) VALUES ("Valvula pneumática", "DECA solucoes pneumaticas", 309.90, 2, 4);
INSERT INTO tb_produto (nome, modelo, preco, quantidade, categoria_id) VALUES ("martelo", "LP prega 289", 189.90, 6, 5);
INSERT INTO tb_produto (nome, modelo, preco, quantidade, categoria_id) VALUES ("Furadeira", "Tilbone power 5", 740.80, 2, 3);
INSERT INTO tb_produto (nome, modelo, preco, quantidade, categoria_id) VALUES ("Bacia", "Deca branca oval 2", 306.90, 2, 3);

select * from tb_produto;

/*Faça um select que retorne os Produtos com o valor maior do que 50 reais.*/
select * from tb_produto where preco > 50;


/*Faça um select trazendo os Produtos com valor entre 3 e 60 reais.*/
select * from tb_produto where preco between 3 and 60;

/*Faça um select utilizando LIKE buscando os Produtos com a letra C.*/
select * from tb_produto where nome like "%C%";

/*Faça um um select com Inner join entre tabela categoria e produto.*/
select * from tb_produto inner join tb_categorias on tb_categorias.id = tb_produto.categoria_id;

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são da categoria hidráulica).*/
select * from tb_produto inner join tb_categorias on tb_categorias.id = tb_produto.categoria_id where tb_categorias.id = 1;