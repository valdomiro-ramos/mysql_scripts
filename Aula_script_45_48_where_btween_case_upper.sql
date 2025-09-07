select count(p.ListPrice) produto_preco_zero 
from product p
where p.ListPrice = 0;


select ProductID, name produto, ListPrice  
from product p
where p.ListPrice = 0;

select * from salesorderheader;
select * from salesorderdetail; 

select listprice , a.* from product a where listprice ;

--------------

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
select 
p.color
,count(1) qtd_produtos
from product p group by 
p.color ;
---

select 
case when p.color is null then 'Nao definido' else p.color end color
,count(1) qtd_produtos
from product p group by 
case when p.color is null then 'Nao definido' else p.color end  ;

---
select color , count(color) qtd_produtos from 
(
	select 
	case when p.color is null then 'Nao definido' else p.color end color
	from product p
) tb
group by color;


select * from information_schema.tables 
where table_schema = 'adventureworks'
and UPPER(table_name) like '%PURCH%';

select * from information_schema.columns where UPPER(column_name) like '%PRICE%';

