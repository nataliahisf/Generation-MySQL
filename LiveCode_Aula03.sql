create database db_cidade_das_carnes;

use db_cidade_das_carnes;

create table tb_categoria(
id bigint auto_increment,
descricao varchar(255) not null,
ativo boolean not null,
primary key (id)
);

insert into tb_categoria (descricao, ativo) values ("Bovino",true);
insert into tb_categoria (descricao, ativo) values ("Suino",true);
insert into tb_categoria (descricao, ativo) values ("Aves",true);
insert into tb_categoria (descricao, ativo) values ("pertence feijoada",true);
insert into tb_categoria (descricao, ativo) values ("imbutidos",true);
insert into tb_categoria (descricao, ativo) values ("soja",true);
insert into tb_categoria (descricao, ativo) values ("outros",true);

select * from tb_categoria;

create table tb_produtos (
id bigint auto_increment,
nome varchar (255) not null,
preco decimal(6,2) not null,
qtproduto int not null,
dtvalidade date,
categoria_id bigint,
primary key (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id)
);

insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("ASA",40.00,30, "2021-11-07", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Picanha",20.00,30, "2021-11-08", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("coxa de frango",20.00,30, "2021-11-07", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Bacon",30.00,30, "2021-11-09", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("hamburguer",60.00,30, "2021-09-07", 5);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Cupim",20.00,30, "2021-11-10", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Peito de frango",25.00,30, "2021-11-09", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Orelha de porco",20.00,30, "2021-11-07", 4);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Salame",18.00,30, "2021-11-21", 5);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("medalhao",50.00,30, "2021-11-15", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("mocoto",20.00,30, "2021-10-05", 2);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("chuleta",20.00,30, "2021-10-07", 1);
insert into tb_produtos (nome, preco, qtProduto) values ("acendedor de churrasqueira",20.00,30);
insert into tb_produtos (nome, preco, qtProduto) values ("soprador de churrasqueira",35.00,30);

select * from tb_produtos;

select * from tb_produtos order by nome; -- Fará ordenação de A a Z pelo nome do produto --

select * from tb_produtos order by nome DESC; -- Fará ordenação de Z a A pelo nome do produto -- 

-- Operadores lógicos: AND, OR, NOT --
select * from tb_produtos WHERE preco > 20 and categoria_id = 1;

select * from tb_produtos WHERE preco > 20 or categoria_id = 1;

select * from tb_produtos WHERE NOT categoria_id = 1; -- Traz todos os produtos onde a categoria NÃO é igual a 1 --

-- Operadores IN (define o que quer ser exibido) e BETWEEN (define o intervalo) --
select * from tb_produtos WHERE preco (20, 30, 40); /*  uma forma simplificada do OR em vez de você ficar 
digitando preco = 20 or preco = 30 or preco = 40 com o In você só escreve preco in (20,30,40) */ 

select * from tb_produtos WHERE preco BETWEEN 20 and 40;

select * from tb_produtos WHERE dtvalidade between '2021-11-07' and '2021-11-15';

-- SELECT LIKE: % = QUALQUER TEXTO --
select * from tb_produtos where nome like "%ha"; -- O texto está no final --

select * from tb_produtos where nome like "ha%"; -- O texto está no ínicio --

select * from tb_produtos where nome like "%ha%"; -- Não importa a posição do texto, contanto que exista --

-- Matemática --
select count(*) from tb_produtos; -- COUNT realiza a contagens de itens --

select count(categoria_id) from tb_produtos;

select sum(preco) from tb_produtos; -- SUM faz somas. --

select avg(preco) from tb_produtos group by categoria_id; -- AVG faz a média aritmetica // GROUP BY: Faz média de preço de acordo com a categoria --

select max(preco) as MAIOR_PREÇO from tb_produtos; -- AS: Serve para dar um apelido para o que você quer mostrar. --

select min(preco) as MENOR_PREÇO from tb_produtos;

/* INNER JOIN: o resultado trará somente as linhas que sejam comum entre as 2 tabelas, 
ligadas pelos campos em questão da pesquisa.  Se tiver algo que falta em algum dos lados, essa opção
não irá aparecer*/
select tb_produtos.nome, tb_produtos.preco, tb_categoria.descrição -- Selecione pra mim xxx -- 
from tb_produtos inner join tb_categoria -- Da tabela xxx ligada a tabela xxx --
on tb_categoria.id = tb_produtos.categoria_id; -- Onde xxx (PK) é igual a xxx (FK) --

/* LEFT JOIN: Retorna os valores da tabela esquerda e associados a direita. Se tiver um produto na esquerda
que não possui categoria, por exemplo, ele vai aparecer mesmo assim.*/
select tb_produtos.nome, tb_produtos.preco, tb_categoria.descrição 
from tb_produtos left join tb_categoria 
on tb_categoria.id = tb_produtos.categoria_id;

/* RIGHT JOIN: Retorna os valores da tabela direita e associados a esquerda. Se tiver uma categoria na 
direita que não possui produto na direita, por exemplo, ela vai aparecer mesmo assim.*/ 
select tb_produtos.nome, tb_produtos.preco, tb_categoria.descrição 
from tb_produtos right join tb_categoria 
on tb_categoria.id = tb_produtos.categoria_id;