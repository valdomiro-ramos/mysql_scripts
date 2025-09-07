select * from product;
select * from productsubcategory;

select 
p.ProductID, p.name produto, p.Color,p.ListPrice , x.ProductSubcategoryID
,x.name subcategoria
from product p
inner join  productsubcategory x
	on p.ProductSubcategoryID = x.ProductSubcategoryID;
    
----------------------------------------

select 
x.Name
,count(x.Name) qtd_registros
from product p
inner join  productsubcategory x
	on p.ProductSubcategoryID = x.ProductSubcategoryID
group by x.Name;
    
select 
x.Name subcategoria
,p.color cores
,count(x.Name) qtd_reg
from product p
inner join  productsubcategory x
	on p.ProductSubcategoryID = x.ProductSubcategoryID
group by x.Name,p.color;

select 
p.color
,count(x.Name) qtd_registros
from product p
inner join  productsubcategory x
	on p.ProductSubcategoryID = x.ProductSubcategoryID
group by p.color
order by count(x.Name) desc;

select 
count(x.Name) qtd_registros
from product p
inner join  productsubcategory x
	on p.ProductSubcategoryID = x.ProductSubcategoryID;
    
select 
pd.PurchaseOrderID ,pc.Name categoria ,ps.Name subcategoria, pd.ProductID ,p.Name produto, p.Color,pd.OrderQty,pd.StockedQty,pd.UnitPrice
from purchaseorderdetail pd
left  join product p 
	on p.ProductID = pd.ProductID
left join productsubcategory ps 
	on ps.ProductSubcategoryID = p.ProductSubcategoryID
left join  productcategory pc 
	on pc.ProductCategoryID = ps.ProductCategoryID;
    
-----------------------------------


select 
pd.PurchaseOrderID ,pc.Name categoria ,ps.Name subcategoria, pd.ProductID ,p.Name produto, p.Color,pd.OrderQty,pd.StockedQty,pd.UnitPrice
from purchaseorderdetail pd
left  join product p 
	on p.ProductID = pd.ProductID
left join productsubcategory ps 
	on ps.ProductSubcategoryID = p.ProductSubcategoryID
left join  productcategory pc 
	on pc.ProductCategoryID = ps.ProductCategoryID;

------------------------------------    
    
SELECT pc.Name categoria,
       ps.Name subcategoria,
       p.Color,
       count(pc.Name) qtd_registros,
       sum(pd.OrderQty) qtd_compra,
       sum(pd.StockedQty) qtd_estoque,
       sum(pd.OrderQty * pd.UnitPrice) valor_de_compra,
	avg(pd.OrderQty * pd.UnitPrice) media_de_compra
FROM purchaseorderdetail pd
INNER JOIN product p 
	ON p.ProductID = pd.ProductID
INNER JOIN productsubcategory ps 
	ON ps.ProductSubcategoryID = p.ProductSubcategoryID
INNER JOIN productcategory pc 
	ON pc.ProductCategoryID = ps.ProductCategoryID
GROUP BY pc.Name, ps.Name, p.Color;

-------------------------------------

select year(a.DueDate) ano 
,month(a.DueDate) mes 
,day(a.DueDate) dia
,a .* from purchaseorderdetail a ;

----------------
select * from purchaseorderdetail;
----------------

SELECT year(a.DueDate) ano ,
       month(a.DueDate) mes ,
       sum(a.OrderQty * a.UnitPrice) vl_compra,
       a.StockedQty * a.UnitPrice vl_estoque
FROM purchaseorderdetail a
GROUP BY year(a.DueDate),month(a.DueDate);


SELECT year(a.DueDate) ano ,
       sum(a.OrderQty * a.UnitPrice) vl_compra,
       a.StockedQty * a.UnitPrice vl_estoque
FROM purchaseorderdetail a
GROUP BY year(a.DueDate);
    
-------------------

CREATE VIEW vw_dados_compras
as
SELECT 
       year(pd.DueDate) ano ,
       month(pd.DueDate) mes ,
	   pc.Name categoria,
       ps.Name subcategoria,
       p.Color,
       count(pc.Name) qtd_registros,
       sum(pd.OrderQty) qtd_compra,
       sum(pd.StockedQty) qtd_estoque,
       sum(pd.OrderQty * pd.UnitPrice) valor_de_compra,
	avg(pd.OrderQty * pd.UnitPrice) media_de_compra
FROM purchaseorderdetail pd
LEFT JOIN product p 
	ON p.ProductID = pd.ProductID
LEFT JOIN productsubcategory ps 
	ON ps.ProductSubcategoryID = p.ProductSubcategoryID
LEFT JOIN productcategory pc 
	ON pc.ProductCategoryID = ps.ProductCategoryID
GROUP BY year(pd.DueDate), month(pd.DueDate) ,pc.Name, ps.Name, p.Color;




select * from vw_dados_compras;

