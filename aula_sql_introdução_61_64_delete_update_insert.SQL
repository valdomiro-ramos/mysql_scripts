create table cidade_BKP2
AS
select * from cidade_full;

SELECT * FROM cidade_BKP2;

drop table cidade_BKP2; -- apaga a tabela

truncate table cidade_BKP2; -- limpa os registros na sua totalidade.

SELECT * FROM cidade_bkp2;

insert into cidade_bkp2(idcidade,descricao,uf) values (77 ,'campo grande2','MS' );

SET SQL_SAFE_UPDATES = 0;

delete from cidade_bkp2 where idcidade=77;

delete from cidade_bkp2 where descricao = 'cascavel';

delete from cidade_bkp2 where upper(descricao) like 'S%';

update cidade_bkp2 
set  descricao= upper(descricao) 
where idcidade = 38;

update cidade_bkp2 set  descricao= upper(descricao) ;

update cidade_bkp2 set  uf= upper(uf) ;

select * from cidade_bkp2;

select * from cidade_full WHERE UF='RJ';

insert into cidade_bkp2(idcidade,descricao,uf)
select * from cidade_full WHERE UF='MG';

/*
delete  a
from  tabela1 b
	inner join tabela2 a
    on a.idcidade = b.idcidade
where  a.descricao = b.descricao;
*/

delete  cbk
from cidade_full cf 
inner join cidade_bkp2 cbk
	on cf.uf = cbk.uf
where   cf.uf ='RJ' ;


/*
update tabela1 a
inner join tabela2 b
	on a.idcidade = b.idcidade
set a.descricao = b.descricao;
 where  b.idcidade = 1999;
*/
DELETE FROM  cidade_bkp2 WHERE UF = 'RJ';

SELECT * FROM cidade_bkp2;

insert into cidade_bkp2(idcidade,descricao,uf)
select idcidade,upper(descricao),uf from cidade_full WHERE UF='RJ';


SELECT * FROM cidade_bkp2;

select * from cidade_full WHERE UF='RJ';

update cidade_bkp2 a
inner join cidade_full b
	on a.idcidade = b.idcidade
set a.descricao = b.descricao
 where  b.uf = 'RJ';



