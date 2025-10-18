-- exemplo de query de contagem de valores

select count(p.ListPrice) produto_preco_zero 
from product p
where p.ListPrice = 0;

-- exemplo de query com criterio condicional

select ProductID, name produto, ListPrice  
from product p
where p.ListPrice = 0;

-- exemplo de consultas em tabelas

select * from salesorderheader;
select * from salesorderdetail; 

--------------

-- exemplo de consulta usando a clausula between
-- exemplo de consulta usando a estrutura case

select sd.*, p.listprice ,
case when p.listprice  between 3000  and  4000 then 1000 else p.listprice end listprice_calc,
sd.OrderQty * (case when p.listprice  between 3000  and  4000 then 1000 else p.listprice end) valor_calculado,
(case when p.listprice  between 3000  and  4000 then 1000 else p.listprice end)*1.10 listprice_calc_acrescido
from salesorderheader sh
inner join salesorderdetail sd 
	on sh.SalesOrderID = sd.SalesOrderID
inner join product p 
	on p.ProductID = sd.ProductID;
    
-------------

-----

-- exemplo de criação de tabela em tempo de execução com base em uma consulta de dados
-- exemplo de subconsulta de dados
create table tb_relatorio
as
select 
tb.SalesOrderID,tb.SalesOrderDetailID,tb.OrderQty,tb.ProductID, tb.produto, tb.color
,Round(tb.OrderQty * tb.listprice_calc,2) valor_calculado
,Round(tb.listprice_calc * 1.1,2) listprice_calc_acrescido
from 
(
	select sd.*, p.name produto, p.color, p.listprice ,
	case when p.listprice  between 3000  and  4000 then 1100 else p.listprice end listprice_calc
	from salesorderheader sh
	inner join salesorderdetail sd 
		on sh.SalesOrderID = sd.SalesOrderID
	inner join product p 
		on p.ProductID = sd.ProductID
) tb;

select * from tb_relatorio;

select 
p.productid
,p.name 
,p.color
,p.StandardCost
from product p;

---------------------

-- exemplo de consulta com a função de contagem de valoes

select 
p.color
,count(1) qtd_produtos
from product p group by 
p.color ;
---
-- exemplo de consulta com a função de contagem de valores e com a clausula case when 
select 
case when p.color is null then 'Nao definido' else p.color end color
,count(1) qtd_produtos
from product p group by 
case when p.color is null then 'Nao definido' else p.color end  ;

---

-- exemplo de subconsulta com agrupamento de dados

select color , count(color) qtd_produtos from 
(
	select 
	case when p.color is null then 'Nao definido' else p.color end color
	from product p
) tb
group by color;

-- exemplode consulta de dados em tabela de sistema para buscar nome de tabelas com clausula condicional

select * from information_schema.tables 
where table_schema = 'adventureworks'
and UPPER(table_name) like '%PURCH%';

-- exemplo de função para transformar valores em maiuscula em consulta de dados usando a clausula like 

select * from information_schema.columns where UPPER(column_name) like '%PRICE%';

