select 
left(a.name,10) produto,
right(a.name,5) produto2,
left(a.productNumber,2) productNumber_01,
SUBSTRING(a.productNumber,4,4) productNumber_02,
repeat('*',10) COLUNA_REPEAT,
--SUBSTRING(a.name,5,3) produto3,
UPPER(a.name) produto_upper,
lower(a.name) produto_lower,
instr(a.name,' ')  campo_instr,
left(a.name,instr(a.name,' ')) produto_p1,
left(a.name,if(instr(a.name,' ')=0,length(a.name),instr(a.name,' '))) produto_p1_2,
 a.* 
from product a ;

select LPAD(cep,8,'0') from
(
	select  '49033080' cep union
	select  '433480' union
	select  '490480' union
	select  '33080' union
	select  '80' union
	select  '8887' 
) tb ;

select CONCAT('CEP: ' , LPAD(cep,8,'0') )  COLUNA from
(
	select  49033080 cep union
	select  433480 union
	select  490480 union
	select  33080 union
	select  80 union
	select  8887 
) tb ;








