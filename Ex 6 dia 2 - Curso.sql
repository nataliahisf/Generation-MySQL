/*Crie um banco de dados para um serviço de um site de cursos onlines, o nome do banco
deverá ter o seguinte nome db_cursoDaMinhaVida, onde o sistema trabalhará com as
informações dos produtos desta empresa.*/

create database db_cursoDaMinhaVida;
use db_cursoDaMinhaVida;

/*Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço deste site de cursos onlines.*/

create table tb_categoria(
id bigint auto_increment,
tipo varchar(20) not null,
vagas int not null,
primary key (id)
);

/*Popule esta tabela Categoria com até 5 dados.*/

INSERT INTO tb_categoria (tipo, vagas) VALUES ("EAD",100);
INSERT INTO tb_categoria (tipo, vagas) VALUES ("Presencial", 40);
INSERT INTO tb_categoria (tipo, vagas) VALUES ("Híbrido", 30);
INSERT INTO tb_categoria (tipo, vagas) VALUES ("Intensivo presencial", 40);
INSERT INTO tb_categoria (tipo, vagas) VALUES ("Intensivo EAD", 80);

select * from tb_categoria;

/*Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5
atributos relevantes dos tb_produto para se trabalhar com o serviço de um site de cursos
onlines(não esqueça de criar a foreign key de tb_categoria nesta tabela).*/

create table tb_produto (
id bigint auto_increment,
nome varchar (255) not null,
dataInicio date,
dataFim date,
precoMensal decimal(6,2) not null,
categoria_id bigint,
primary key (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id)
);

/*Popule esta tabela Produto com até 8 dados.*/
INSERT INTO tb_produto (nome, dataInicio, dataFim, precoMensal, categoria_id) VALUES ("Curso JAVA iniciante", "2021-11-23", "2021-12-21", 60.00,1);
INSERT INTO tb_produto (nome, dataInicio, dataFim, precoMensal, categoria_id) VALUES ("Curso JAVA intermediário", "2022-01-10", "2022-04-01", 79.90,1);
INSERT INTO tb_produto (nome, dataInicio, dataFim, precoMensal, categoria_id) VALUES ("Curso JAVA Avançado", "2022-04-15", "2022-06-20", 93.00,1);
INSERT INTO tb_produto (nome, dataInicio, dataFim, precoMensal, categoria_id) VALUES ("Curso CSS iniciante", "2021-11-23", "2021-12-21", 45.00,2);
INSERT INTO tb_produto (nome, dataInicio, dataFim, precoMensal, categoria_id) VALUES ("Curso CSS intermediário", "2022-01-10", "2022-04-01", 62.00,2);
INSERT INTO tb_produto (nome, dataInicio, dataFim, precoMensal, categoria_id) VALUES ("Curso CSS avançado", "2022-04-15", "2022-06-20", 69.00,2);
INSERT INTO tb_produto (nome, dataInicio, dataFim, precoMensal, categoria_id) VALUES ("Lógica de Programação", "2022-02-01", "2022-05-01", 119.90,4);
INSERT INTO tb_produto (nome, dataInicio, dataFim, precoMensal, categoria_id) VALUES ("Lógica de Programação", "2022-02-01", "2022-04-01", 87.90,4);


/*Faça um select que retorne os Produtos com o valor maior do que 50 reais.*/
select * from tb_produto where precoMensal > 50;

/*Faça um select trazendo os Produtos com valor entre 3 e 60 reais.*/
select * from tb_produto where precoMensal between 3 and 60;

/*Faça um select utilizando LIKE buscando os Produtos com a letra J.*/
select * from tb_produto where nome like "%J%";

/*Faça um um select com Inner join entre tabela categoria e produto.*/
select * from tb_produto inner join tb_categoria on tb_categoria.id = tb_produto.categoria_id;

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são da categoria Java).*/
select * from tb_produto inner join tb_categoria on tb_categoria.id = tb_produto.categoria_id where tb_categoria.id = 4;