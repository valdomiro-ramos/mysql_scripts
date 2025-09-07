select * from customer;
select * from customeraddress;
select * from address;

-- exercicio 04

select c.CustomerID, c.AccountNumber, a.AddressLine1, a.AddressLine2, a.City, a.PostalCode,a.stateprovinceid from customer c 
inner join  customeraddress ca 
 on c.CustomerID  = ca.CustomerID
 inner join  address a 
  on a.AddressID = ca.AddressID;
  
  --  criação e alteração de view
  
  create view vw_lista_customer
  as
  select c.CustomerID, c.AccountNumber, a.AddressLine1, a.AddressLine2, a.City, a.PostalCode,a.stateprovinceid from customer c 
inner join  customeraddress ca 
 on c.CustomerID  = ca.CustomerID
 inner join  address a 
  on a.AddressID = ca.AddressID;
  
  
  -- --------------
  
    create view vw_lista_customer_2
  as
  select c.CustomerID, c.AccountNumber, a.AddressLine1, a.AddressLine2, a.City, a.PostalCode,a.stateprovinceid,st.Name province from customer c 
inner join  customeraddress ca 
 on c.CustomerID  = ca.CustomerID
 inner join  address a 
  on a.AddressID = ca.AddressID
  inner join stateprovince st 
		on a.stateprovinceid = st.StateProvinceID;  
  
  
  
  select * from vw_lista_customer;
 
   select v.*, st.Name province from vw_lista_customer v
   inner join stateprovince st 
		on v.stateprovinceid = st.StateProvinceID;
 
 
   select * from vw_lista_customer_2;
   
   select * from vw_dados_compras;
   
   
   
   -- ---------------------------
   select * from salesorderheader;
   select * from salesorderdetail;
   select * from product;
    select * from productsubcategory;
     select * from productcategory;
   
alter view vw_lista_vendas
as
select pc.ProductCategoryID, pc.Name categoria, ps.ProductSubcategoryID, ps.Name subcategoria 
,p.ProductID, p.Name produto, sd.OrderQty, sd.UnitPrice,sd.LineTotal, sh.SalesOrderID, sh.OrderDate
from salesorderheader sh 
inner join salesorderdetail sd
	on sh.SalesOrderID =sd.SalesOrderID
inner join product p
	on p.ProductID = sd.ProductID 
 inner join productsubcategory ps
	on ps.ProductSubcategoryID = p.ProductSubcategoryID
 inner join productcategory pc
  on pc.ProductCategoryID = ps.ProductCategoryID;
    
    
    
    select * from vw_lista_vendas;
    
        
    select count(1) from vw_lista_vendas;


SELECT * FROM tb_customers;

insert into tb_customers(id,name,endereco)  values ('121212','valdomiro','rua z');

call sp_insere_customer(777,'mario','rua 99');

call sp_lista_produtos_2('TD') 

create table tb_customers_4
as
select * from tb_customers

SET SQL_SAFE_UPDATES = 0;

delete from tb_customers_4 where id='121212';

truncate table tb_customers_4;

drop table  tb_customers_4;

select * from tb_customers_4

-- delete 
-- truncate
-- drop