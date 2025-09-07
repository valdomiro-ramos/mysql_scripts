select *  from salesorderheader;
select * from salesorderdetail;

select 
	sh.SalesOrderID, year(sh.DueDate) Ano ,sh.DueDate,round(sd.LineTotal,2) line_total
    ,truncate(sd.LineTotal,2) line_total2,sd.LineTotal, (sd.OrderQty * sd.UnitPrice) valor_total_calculado
    ,sd.SalesOrderDetailID, sd.OrderQty,sd.ProductID,sd.UnitPrice
from salesorderheader sh 
inner join salesorderdetail sd
	on sh.SalesOrderID = sd.SalesOrderID
where  sd.LineTotal between 2500 and 3000;