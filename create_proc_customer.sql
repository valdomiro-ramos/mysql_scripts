DELIMITER $$
CREATE DEFINER=`root`@`%` PROCEDURE `sp_Sel_customer`(IN ID_CUSTOMER int)
BEGIN

select * from customer where CustomerID = ID_CUSTOMER;

END$$
DELIMITER ;
