-- Remove a procedure anterior (caso já exista),
-- garantindo que o código possa ser recriado sem erro.
-- DROP PROCEDURE pr_Somapreco;

-- Define o novo delimitador de comando como "$$"
-- Isso permite que o MySQL interprete corretamente os blocos BEGIN/END
-- sem encerrar o comando antes do final da procedure.
DELIMITER $$

-- Criação da procedure chamada pr_Somapreco
-- Ela retorna um valor de saída (OUT) chamado "resultado"
-- que contém a soma de todos os valores da coluna LineTotal da tabela purchaseorderdetail
CREATE PROCEDURE pr_Somapreco (OUT resultado INT)
BEGIN

  -- ==========================================================
  -- 🔸 Declaração das variáveis internas da procedure
  -- ==========================================================

  -- Controla se o cursor chegou ao fim dos registros (0 = há registros, 1 = fim)
  DECLARE existe_mais_linhas INT DEFAULT 0;

  -- Armazena temporariamente o valor atual do campo LineTotal
  DECLARE purchase_preco DOUBLE DEFAULT 0;

  -- Acumulador para somar todos os valores lidos do cursor
  DECLARE total_de_precos DOUBLE DEFAULT 0;

  -- ==========================================================
  -- 🔸 Definição do cursor
  -- ==========================================================

  -- O cursor "meuCursor" percorre todos os valores da coluna LineTotal
  -- da tabela purchaseorderdetail
  DECLARE meuCursor CURSOR FOR
      SELECT LineTotal FROM purchaseorderdetail;

  -- ==========================================================
  -- 🔸 Tratamento de exceção de fim do cursor
  -- ==========================================================

  -- Define um manipulador (handler) que, quando não há mais linhas a buscar,
  -- altera a variável existe_mais_linhas para 1, encerrando o loop.
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET existe_mais_linhas = 1;

  -- ==========================================================
  -- 🔸 Execução principal da procedure
  -- ==========================================================

  -- Abre o cursor para leitura
  OPEN meuCursor;

  -- Início do loop para percorrer todas as linhas retornadas pelo cursor
  meuLoop: LOOP

      -- Busca o próximo valor do cursor e armazena em purchase_preco
      FETCH meuCursor INTO purchase_preco;

      -- Verifica se o cursor chegou ao fim dos registros
      IF existe_mais_linhas = 1 THEN
          -- Se sim, sai do loop
          LEAVE meuLoop;
      END IF;

      -- Soma o valor atual ao total acumulado
      SET total_de_precos = total_de_precos + purchase_preco;

  -- Retorna ao início do loop para buscar o próximo registro
  END LOOP meuLoop;

  -- ==========================================================
  -- 🔸 Finalização e retorno do resultado
  -- ==========================================================

  -- Atribui o valor total acumulado à variável de saída "resultado"
  SET resultado = total_de_precos;

  -- Fecha o cursor (boa prática)
  CLOSE meuCursor;

END $$

-- Retorna o delimitador padrão ";"
DELIMITER ;

-- Declara uma variável para receber o valor de saída
CALL pr_Somapreco(@total);

-- Exibe o resultado
SELECT @total AS Soma_Total;
