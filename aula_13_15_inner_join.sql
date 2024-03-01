use adventureworks;

select * from product;
select * from productsubcategory;
select * from productcategory;

select *
from product a 
inner join productsubcategory b
on a.ProductSubcategoryID = b.ProductSubcategoryID;

select a.ProductID, a.Name, a.Color, a.ProductNumber,a.StandardCost , a.ListPrice
,b.ProductCategoryID,b.Name
from product a 
inner join productsubcategory b
on a.ProductSubcategoryID = b.ProductSubcategoryID;


select a.ProductID, a.Name, a.Color, a.ProductNumber,a.StandardCost , a.ListPrice
,b.ProductCategoryID,b.Name
from product a 
left join productsubcategory b
on a.ProductSubcategoryID = b.ProductSubcategoryID;
 
select * from product a 
left join productsubcategory b
on a.ProductSubcategoryID = b.ProductSubcategoryID;
 


select * from address;

select * from adventureworks.product;

select * from adventureworks.address;

