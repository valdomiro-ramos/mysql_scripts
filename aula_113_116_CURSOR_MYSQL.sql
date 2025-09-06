-- DROP PROCEDURE pr_Somapreco;

DELIMITER $$
  CREATE  PROCEDURE pr_Somapreco (OUT resultado INT)
  BEGIN

  -- Definição de variáveis utilizadas na Procedure
  DECLARE existe_mais_linhas INT DEFAULT 0;
  DECLARE purchase_preco DOUBLE DEFAULT 0;
  DECLARE total_de_precos DOUBLE DEFAULT 0;

  -- Definição do cursor
  DECLARE meuCursor CURSOR FOR select Linetotal from purchaseorderdetail;

  -- Definição da variável de controle de looping do cursor
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET existe_mais_linhas=1;

  -- Abertura do cursor
  OPEN meuCursor;

  -- Looping de execução do cursor
  meuLoop: LOOP
  FETCH meuCursor INTO purchase_preco;

  -- Controle de existir mais registros na tabela
  IF existe_mais_linhas = 1 THEN
  LEAVE meuLoop;
  END IF;

  -- Soma o valor do registro atual com o total acumulado
  SET total_de_precos = total_de_precos + purchase_preco;

  -- Retorna para a primeira linha do loop
  END LOOP meuLoop;

  -- Setando a variável com o resultado final
  SET resultado = total_de_precos;

  END $$

  DELIMITER ;