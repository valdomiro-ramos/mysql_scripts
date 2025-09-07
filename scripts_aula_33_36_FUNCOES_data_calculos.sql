select 
a.*
,a.UnitPrice*a.OrderQty  valor_total
,a.LineTotal / 3  valor_divido
,(a.LineTotal * 0.2)+ a.LineTotal  valor_acrescido
,(a.LineTotal * 1.2)  valor_acrescido_2
from salesorderdetail a limit 15 ;

----
select 
a.*
,a.UnitPrice*a.OrderQty  valor_total
,a.LineTotal / 3  valor_divido
,(a.LineTotal * 0.2)+ a.LineTotal  valor_acrescido
,(a.LineTotal * 1.2)  valor_acrescido_2
from salesorderdetail a
where a.LineTotal >=1000 and a.LineTotal<=3500
order by a.LineTotal  ;

select 
a.*
,a.UnitPrice*a.OrderQty  valor_total
,a.LineTotal / 3  valor_divido
,(a.LineTotal * 0.2)+ a.LineTotal  valor_acrescido
,(a.LineTotal * 1.2)  valor_acrescido_2
from salesorderdetail a
where a.LineTotal <> 1000.26
and  a.LineTotal >=1000 and a.LineTotal<=3500
order by a.LineTotal  ;

select 
a.*
,a.UnitPrice*a.OrderQty  valor_total
,a.LineTotal / 3  valor_divido
,(a.LineTotal * 0.2)+ a.LineTotal  valor_acrescido
,(a.LineTotal * 1.2)  valor_acrescido_2
from salesorderdetail a
where a.LineTotal <> 1000.26
and  a.LineTotal between  1000 and 3500
order by a.LineTotal  ;

 
select 
datediff(sh.duedate,sh.orderdate) dif_dias
,DATE_ADD(orderdate, interval 5 day) add_dia
,DATE_ADD(orderdate, interval 1 month) add_mes
,case 
 when sh.shipdate is null then  datediff(curdate(),sh.orderdate) else 0 end dias_atraso
 ,dayofweek(curdate())
,sh.* 
from  salesorderheader sh limit 500;

select truncate(188.375,2),round(188.375,2);

select * from salesorderheader a where a.SalesOrderID in (43659,43660);
/*
-update salesorderheader a 
set a.shipdate = null
where a.SalesOrderID in (43659,43660);
*/

