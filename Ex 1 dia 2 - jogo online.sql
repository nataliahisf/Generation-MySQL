/*Crie um banco de dados para um serviço de um game Online , o nome do banco deverá ter
o seguinte nome db_generation_game_online, onde, o sistema trabalhará com as
informações dos personagens desse game.*/

create database db_generation_game_online;
use db_generation_game_online;

/*O sistema trabalhará com 2 tabelas tb_personagem e tb_classe.
Crie uma tabela tb_classe utilizando a habilidade de abstração e determine 3 atributos
relevantes da classe para se trabalhar com o serviço desse game Online.
Popule esta tabela classe com até 5 dados.*/

create table tb_classe(
id bigint not null auto_increment,
classe varchar(100),
lvl int,
primary key (id)
);

insert into tb_classe (classe, lvl) values ("Barbaro",15);
insert into tb_classe (classe, lvl) values ("Guerreiro",02);
insert into tb_classe (classe, lvl) values ("Arqueiro",11);
insert into tb_classe (classe, lvl) values ("Soldado",23);
insert into tb_classe (classe, lvl) values ("Mágico",25);

select * from tb_classe;

/*Crie uma tabela tb_personagem e utilizando a habilidade de abstração e determine 5
atributos relevantes dos funcionários para se trabalhar com o serviço desse game Online
(não esqueça de criar a foreign key de tb_classe nesta tabela).
Popule esta tabela personagem com até 8 dados.*/

create table tb_personagem(
id bigint not null auto_increment,
nome varchar(100),
arma varchar (20),
ataque int,
defesa int,
categoria_id bigint,
primary key (id),
foreign key (categoria_id) references tb_classe (id)
);

insert into tb_personagem (nome, arma, ataque, defesa, categoria_id) values ("Luck","lança",2200,1300,4);
insert into tb_personagem (nome, arma, ataque, defesa, categoria_id) values ("Venesa","arco",5100,3300,3);
insert into tb_personagem (nome, arma, ataque, defesa, categoria_id) values ("Beidou","pistola",1800,1500,2);
insert into tb_personagem (nome, arma, ataque, defesa, categoria_id) values ("XangXing","catalisador",2700,2000,5);
insert into tb_personagem (nome, arma, ataque, defesa, categoria_id) values ("Keqing","espada",1400,913,1);
insert into tb_personagem (nome, arma, ataque, defesa, categoria_id) values ("Jean","Claymore",4200,2900,5);
insert into tb_personagem (nome, arma, ataque, defesa, categoria_id) values ("Venti","arco",2200,1300,3);
insert into tb_personagem (nome, arma, ataque, defesa, categoria_id) values ("Traveler","cajado",2900,2800,5);

select * from tb_personagem;

/*Faça um select que retorne os personagens com o poder de ataque maior do que 2000.*/
select * from tb_personagem where ataque > 2000;

/*Faça um select trazendo os personagens com poder de defesa entre 1000 e 2000.*/
select * from tb_personagem where defesa between 1000 and 2000;

/*Faça um select utilizando LIKE buscando os personagens com a letra C.*/
select * from tb_personagem where nome like "%C%";

/*Faça um select com Inner join entre tabela classe e personagem.*/
select * from tb_classe inner join tb_personagem on tb_classe.id = tb_personagem.categoria_id;

/*Faça um select onde traga todos os personagem de uma classe específica (exemplo todos
os personagens que são arqueiros).*/
select * from tb_classe inner join tb_personagem on tb_classe.id = tb_personagem.categoria_id where tb_classe.classe = "Mágico";