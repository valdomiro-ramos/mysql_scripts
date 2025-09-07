select * from tb_customers;

select * from purchaseorderdetail;


select year(DueDate) from purchaseorderdetail
group by year(DueDate);

create table purchaseorderdetail_2
as
select * from purchaseorderdetail;


select * from purchaseorderdetail_2;


SELECT * FROM INFORMATION_SCHEMA.PARTITIONS WHERE
TABLE_NAME = 'purchaseorderdetail_2' ORDER BY PARTITION_ORDINAL_POSITION;



select year(DueDate),count(1) from purchaseorderdetail_2
group by year(DueDate);

 -- insert into purchaseorderdetail_2
select 
po.PurchaseOrderID
,po.PurchaseOrderDetailID
,date_add(po.DueDate,interval +4 year)
,po.OrderQty
,po.ProductID
,po.UnitPrice
,po.LineTotal
,po.ReceivedQty
,po.RejectedQty
,po.StockedQty
,po.ModifiedDate 
from purchaseorderdetail_2 po where PurchaseOrderID = 2808 
and year(date_add(po.DueDate,interval +4 year)) = 2008;

