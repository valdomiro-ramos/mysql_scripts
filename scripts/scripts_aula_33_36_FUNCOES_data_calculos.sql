-- ===============================================================
-- Consultas na tabela de detalhes de pedidos (salesorderdetail)
-- ===============================================================

-- Exibe 15 registros da tabela com cálculos de valores
SELECT 
    a.*,
    a.UnitPrice * a.OrderQty AS valor_total,         -- Calcula valor total do pedido (quantidade * preço unitário)
    a.LineTotal / 3 AS valor_divido,                 -- Divide o LineTotal por 3
    (a.LineTotal * 0.2) + a.LineTotal AS valor_acrescido, -- Acrescenta 20% ao LineTotal
    (a.LineTotal * 1.2) AS valor_acrescido_2        -- Outra forma de acrescentar 20% (multiplicação direta)
FROM salesorderdetail a
LIMIT 15;

-- Filtra pedidos com LineTotal entre 1000 e 3500, ordenando pelo total
SELECT 
    a.*,
    a.UnitPrice * a.OrderQty AS valor_total,
    a.LineTotal / 3 AS valor_divido,
    (a.LineTotal * 0.2) + a.LineTotal AS valor_acrescido,
    (a.LineTotal * 1.2) AS valor_acrescido_2
FROM salesorderdetail a
WHERE a.LineTotal >= 1000 AND a.LineTotal <= 3500
ORDER BY a.LineTotal;

-- Filtra pedidos entre 1000 e 3500, excluindo LineTotal igual a 1000.26
SELECT 
    a.*,
    a.UnitPrice * a.OrderQty AS valor_total,
    a.LineTotal / 3 AS valor_divido,
    (a.LineTotal * 0.2) + a.LineTotal AS valor_acrescido,
    (a.LineTotal * 1.2) AS valor_acrescido_2
FROM salesorderdetail a
WHERE a.LineTotal <> 1000.26
  AND a.LineTotal >= 1000 AND a.LineTotal <= 3500
ORDER BY a.LineTotal;

-- Mesma lógica usando BETWEEN para filtrar valores
SELECT 
    a.*,
    a.UnitPrice * a.OrderQty AS valor_total,
    a.LineTotal / 3 AS valor_divido,
    (a.LineTotal * 0.2) + a.LineTotal AS valor_acrescido,
    (a.LineTotal * 1.2) AS valor_acrescido_2
FROM salesorderdetail a
WHERE a.LineTotal <> 1000.26
  AND a.LineTotal BETWEEN 1000 AND 3500
ORDER BY a.LineTotal;

-- ===============================================================
-- Consultas na tabela de cabeçalho de pedidos (salesorderheader)
-- ===============================================================

SELECT 
    DATEDIFF(sh.duedate, sh.orderdate) AS dif_dias,       -- Diferença de dias entre due date e order date
    DATE_ADD(orderdate, INTERVAL 5 DAY) AS add_dia,       -- Adiciona 5 dias à orderdate
    DATE_ADD(orderdate, INTERVAL 1 MONTH) AS add_mes,     -- Adiciona 1 mês à orderdate
    CASE 
        WHEN sh.shipdate IS NULL THEN DATEDIFF(CURDATE(), sh.orderdate) ELSE 0 
    END AS dias_atraso,                                   -- Calcula dias de atraso se shipdate estiver vazio
    DAYOFWEEK(CURDATE()) AS dia_semana,                  -- Retorna dia da semana da data atual
    sh.*
FROM salesorderheader sh
LIMIT 500;

-- Teste de funções de arredondamento
SELECT TRUNCATE(188.375, 2), ROUND(188.375, 2);

-- Consulta específica por IDs de pedidos
SELECT * 
FROM salesorderheader a 
WHERE a.SalesOrderID IN (43659, 43660);

-- Exemplo de atualização comentada para zerar shipdate de pedidos específicos
/*
UPDATE salesorderheader a 
SET a.shipdate = NULL
WHERE a.SalesOrderID IN (43659, 43660);
*/
