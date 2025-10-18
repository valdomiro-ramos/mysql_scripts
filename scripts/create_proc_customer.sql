-- Define novo delimitador para permitir o uso de blocos BEGIN...END
DELIMITER $$

-- Criação da procedure 'sp_Sel_customer' com um parâmetro de entrada
CREATE DEFINER=`root`@`%` PROCEDURE `sp_Sel_customer`(IN ID_CUSTOMER INT)
BEGIN

  -- Seleciona todos os campos da tabela 'customer' filtrando pelo ID recebido como parâmetro
  SELECT * 
  FROM customer 
  WHERE CustomerID = ID_CUSTOMER;

END$$

-- Retorna o delimitador padrão
DELIMITER ;
