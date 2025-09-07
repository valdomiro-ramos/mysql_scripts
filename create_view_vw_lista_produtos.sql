CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vw_lista_produtos` 
AS select `p`.`ProductID` AS `ProductID`,`p`.`Name` AS `product`,`p`.`Color` AS `Color`
,`p`.`ProductSubcategoryID` AS `ProductSubcategoryID`,`pc`.`Name` AS `subcategoria`
,`p`.`ListPrice` AS `ListPrice`,(case when (`p`.`ListPrice` = 0) then 1 else `p`.`ListPrice` end) AS `Listprice_calc`
,(case when (`p`.`ProductSubcategoryID` is null) then 'INCOMPLETO' else 'COMPLETO' end) AS `STATUS_CADASTRO`
,(case when (`p`.`ListPrice` = 0) then 'gratuito' when (`p`.`ListPrice` between 1 and 20) then 'baixo' when ((`p`.`ListPrice` >= 21) and (`p`.`ListPrice` <= 70)) then 'Medio' else 'Alto' end) AS `LISTA_PRECO` 
from (`product` `p` left join `productsubcategory` `pc` on((`p`.`ProductSubcategoryID` = `pc`.`ProductSubcategoryID`))) order by `p`.`ListPrice`;
