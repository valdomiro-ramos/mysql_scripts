select * from product p ;

select * from product p 
inner join productsubcategory pc 
	on p.ProductSubcategoryID = pc.ProductSubcategoryID;
    
select p.ProductID, p.Name produto, p.Color,p.ProductSubcategoryID,pc.Name subcategoria from product p 
left join productsubcategory pc 
	on p.ProductSubcategoryID = pc.ProductSubcategoryID;
    
    select p.ProductID, p.Name produto, p.Color,p.ProductSubcategoryID,pc.Name subcategoria from product p 
left join productsubcategory pc 
	on p.ProductSubcategoryID = pc.ProductSubcategoryID
where color ='Red';

    select p.ProductID, p.Name produto, p.Color,p.ProductSubcategoryID,pc.Name subcategoria from product p 
left join productsubcategory pc 
	on p.ProductSubcategoryID = pc.ProductSubcategoryID
where color ='Red'or color ='Black' or color ='Blue';

select p.ProductID, p.Name produto, p.Color,p.ProductSubcategoryID,pc.Name subcategoria from product p 
left join productsubcategory pc 
	on p.ProductSubcategoryID = pc.ProductSubcategoryID
where color ='Red'and color ='Black';

    select p.ProductID, p.Name produto, p.Color,p.ProductSubcategoryID,pc.Name subcategoria from product p 
left join productsubcategory pc 
	on p.ProductSubcategoryID = pc.ProductSubcategoryID
where color IN('Red','Black','Blue');


    select 
    p.ProductID, p.Name produto
    ,p.Color,p.ProductSubcategoryID,pc.Name subcategoria 
    ,p.ListPrice
    from product p 
left join productsubcategory pc 
	on p.ProductSubcategoryID = pc.ProductSubcategoryID
where p.ListPrice<>0;

    select 
    p.ProductID, p.Name produto
    ,p.Color,p.ProductSubcategoryID,pc.Name subcategoria 
    ,p.ListPrice
    from product p 
left join productsubcategory pc 
	on p.ProductSubcategoryID = pc.ProductSubcategoryID
where p.ListPrice between 50 and 70;


select * from product  p
where 
exists
( 
  select * from productsubcategory pc 
  where pc.ProductSubcategoryID = p.ProductSubcategoryID
);

select * from product  p
where 
not exists
( 
  select * from productsubcategory pc 
  where pc.ProductSubcategoryID = p.ProductSubcategoryID
);


    select 
    p.ProductID, p.Name produto
    ,p.Color,p.ProductSubcategoryID,pc.Name subcategoria 
    ,p.ListPrice
    from product p 
left join productsubcategory pc 
	on p.ProductSubcategoryID = pc.ProductSubcategoryID
where p.ListPrice  between 50 and 70;


select 
p.ProductID, p.Name produto
,p.Color,p.ProductSubcategoryID,pc.Name subcategoria 
,p.ListPrice
from product p 
left join productsubcategory pc 
on p.ProductSubcategoryID = pc.ProductSubcategoryID
where p.Name like '%Moun%';

select 
p.ProductID, p.Name produto
,p.Color,p.ProductSubcategoryID,pc.Name subcategoria 
,p.ListPrice
from product p 
left join productsubcategory pc 
on p.ProductSubcategoryID = pc.ProductSubcategoryID
where p.Name like 'Moun%';

select * from product p ;

create view vw_lista_produtos
as
select 
p.ProductID, p.Name product
,p.Color,p.ProductSubcategoryID,pc.Name subcategoria 
,p.ListPrice
,case when p.ListPrice = 0 then 1 else p.ListPrice end Listprice_calc
,CASE 
	WHEN p.ProductSubcategoryID IS NULL THEN 'INCOMPLETO' ELSE 'COMPLETO' 
 END STATUS_CADASTRO
 ,CASE
    when listPrice = 0 then 'gratuito'
    -- when p.listprice >= 1 AND p.listprice  <=20 then 'baixo'
    when p.listprice between 1  and 20 then 'baixo'
	-- WHEN p.ListPrice <=20 then 'Baixo' corrigido - Valdomiro  30/05/2022
    WHEN p.ListPrice >=21 and p.ListPrice <=70 then 'Medio'
    else
    'Alto'
END LISTA_PRECO    
from product p 
left join productsubcategory pc 
on p.ProductSubcategoryID = pc.ProductSubcategoryID
order by p.ListPrice;



select * from vw_lista_produtos;





    
    


