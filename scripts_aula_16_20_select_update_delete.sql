-- consulta de registros

select * from cidade;
SELECT * FROM DBCADASTRO.cliente;

----------------------

-- exclusao de registros

DELETE FROM cidade WHERE idcidade = 30;


------------------------

-- atualização de registros

update cliente set endereco = 'rua z' where idcliente = 20;

---------------------------------


 -- criacao de copia de tabelas
 
create table cliente_bkp
as
SELECT * FROM cliente;

-----------------------------

select* from cliente_bkp;

---------------------------------

--- ativar desativar  permissão de exclusao e atualização em massa  

SET SQL_SAFE_UPDATES = 1;

--------------------------------

-- elimina tabelas 

drop table cliente_bkp;

--------------------------------

create table cidade_bkp
as
select * from cidade;


select * from cidade_bkp;
select * from cidade;

SET SQL_SAFE_UPDATES = 0;

update cidade set descricao = 'rua tttt';

select * from cidade a
inner join cidade_bkp b
	on a.idcidade = b.idcidade;
------------------------------
create table cidade_bkp2
as
select * from cidade_bkp;

-----------------------------