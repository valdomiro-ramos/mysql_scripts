-- Criação da tabela de backup
create table cidade_BKP2
as
select * from cidade_full;

-- Consulta dos registros da tabela
select * from cidade_BKP2;

-- Apaga a tabela
drop table cidade_BKP2;

-- Limpa todos os registros da tabela
truncate table cidade_BKP2;

-- Consulta geral
select * from cidade_bkp2;

-- Inserção de um registro manual
insert into cidade_bkp2(idcidade, descricao, uf)
values (77, 'campo grande2', 'MS');

-- Desativa o modo seguro para atualizações/exclusões
set SQL_SAFE_UPDATES = 0;

-- Exclusões de registros específicas
delete from cidade_bkp2 where idcidade = 77;
delete from cidade_bkp2 where descricao = 'cascavel';
delete from cidade_bkp2 where upper(descricao) like 'S%';

-- Atualização de registros
update cidade_bkp2
set descricao = upper(descricao)
where idcidade = 38;

-- Atualização geral das descrições e UFs para maiúsculas
update cidade_bkp2 set descricao = upper(descricao);
update cidade_bkp2 set uf = upper(uf);

-- Consulta da tabela atualizada
select * from cidade_bkp2;

-- Consulta com filtro por UF
select * from cidade_full where uf = 'RJ';

-- Inserção de registros filtrados de outra tabela
insert into cidade_bkp2(idcidade, descricao, uf)
select * from cidade_full where uf = 'MG';

-- Exclusão com join entre tabelas
delete cbk
from cidade_full cf
inner join cidade_bkp2 cbk
	on cf.uf = cbk.uf
where cf.uf = 'RJ';

-- Exclusão direta por UF
delete from cidade_bkp2 where uf = 'RJ';

-- Consulta após exclusões
select * from cidade_bkp2;

-- Inserção de registros com transformação para maiúsculas
insert into cidade_bkp2(idcidade, descricao, uf)
select idcidade, upper(descricao), uf
from cidade_full
where uf = 'RJ';

-- Consulta final de verificação
select * from cidade_bkp2;

-- Consulta de origem para comparação
select * from cidade_full where uf = 'RJ';

-- Atualização com join entre tabelas
update cidade_bkp2 a
inner join cidade_full b
	on a.idcidade = b.idcidade
set a.descricao = b.descricao
where b.uf = 'RJ';
