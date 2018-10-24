-- criando o banco de dados
create database prjos;

-- comando para usar o DB
use prjos;

-- criando a table de usuários
create table tbusuarios (
iduser int primary key, -- campo chave primaria
usuario varchar (50) not null, -- campo com dados obrigatorios
fone varchar (15),
login varchar (15) not null unique, -- campo com dados obrigatorios e unico
senha varchar (15) not null -- campo com dados obrigatorios
);

-- comando para descrever a tabela
describe tbusuarios;

-- inserção de dados na tabela (CRUD)
-- primeiro create -> insert
insert into tbusuarios (iduser, usuario, fone, login, senha)
values (1, 'Carlos Antonio', '8899123-2340', 'antonio2018', 'onio890');

insert into tbusuarios (iduser, usuario, fone, login, senha)
values (2, 'Administrador', '8599999-9999', 'admin', 'admin');

insert into tbusuarios (iduser, usuario, fone, login, senha)
values (3, 'Marcelo Augusto', '8599679-0412', 'camaleaoadapt', '@docker_3490');

-- comando para exibir os dados da tabela (CRUD)
-- read -> select
select * from tbusuarios;

-- modificando os dados da tabela
-- update -> update
update tbusuarios set fone= '8599130-4040'
where iduser = 2;

-- comando para apagar um registro da tabela
-- delete -> delete
delete from tbusuarios
where iduser = 1;

-- criando tabela de cadastro de clientes
create table tbclientes (
idcli int primary key auto_increment, -- campo de chave primaria com auto incremento de id
nomecli varchar (50) not null,
endcli varchar (100),
fonecli varchar (50) not null,
emailcli varchar (50)
);

-- comando para descrever a tabela
desc tbclientes;

-- inserindo os dados na tabela clientes
insert into tbclientes (nomecli, endcli, fonecli, emailcli)
values ('Maria Clara', 'Rua Ernesto Geisel', '8899911-2233', 'mclara2018@gmail.com');

select * from tbclientes;

-- gerando a tabela de ordem de serviços
create table tbos(
os int primary key auto_increment,
-- camado para capturar data e hora do servidor e inserir no campo data_os da tabela tbos
data_os timestamp default current_timestamp, 
equipamento varchar(150) not null,
defeito varchar (150) not null,
servico varchar (150),
tecnico varchar (30),
valor decimal (10,2),
-- relacinando a tb cliente com tbos
idcli int not null, -- chave estrangeira
-- realizando o referenciamento
foreign key(idcli) references tbclientes(idcli)
);

desc tbos;

-- inserindo registro na tabela tbos
insert into tbos (equipamento, defeito, servico, tecnico, valor, idcli)
values ('notebook', 'storage', 'troca do HD', 'Sousa', 150.99, 1);

select * from tbos;

-- comando para exibir informações de duas tabelas
use prjos;

select
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);

select * from tbusuarios;
select * from tbusuarios
where login='admin' and senha='admin';

-- removendo um campo da tabela
alter table tbusuarios
drop column perfil;

DELETE FROM tbclientes
WHERE idcli = 2;

-- Realizando alterações no DB e add um novo campo a tabela
alter table tbusuarios
add column perfil varchar(50) not null;

-- add dados ao campo perfil
update tbusuarios set perfil = 'admin'
where iduser =2;

update tbusuarios set perfil = 'admin'
where iduser =3;

update tbusuarios set perfil = 'user'
where iduser =1;

update tbusuarios set login = 'teste'
where iduser =1;

update tbusuarios set senha = 'teste'
where iduser =1;

update tbusuarios set login = 'tchelo'
where iduser =3;

update tbusuarios set senha = 'tchelo1234'
where iduser =3;

select * from tbusuarios;
desc tbusuarios;

select * from tbclientes;
