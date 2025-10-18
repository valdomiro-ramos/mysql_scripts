-- ===============================================================
-- Consultas na tabela de pedidos de venda (Sales Orders)
-- ===============================================================

-- Visualiza todos os registros da tabela de cabeçalho de pedidos
SELECT * FROM salesorderheader;

-- Visualiza todos os registros da tabela de detalhes de pedidos
SELECT * FROM salesorderdetail;

-- ===============================================================
-- Consulta combinada com join e filtros
-- ===============================================================

SELECT 
    sh.SalesOrderID,                     -- Código do pedido
    YEAR(sh.DueDate) AS Ano,             -- Ano da data de vencimento do pedido
    sh.DueDate,                          -- Data de vencimento
    ROUND(sd.LineTotal, 2) AS line_total,       -- Total da linha arredondado
    TRUNCATE(sd.LineTotal, 2) AS line_total2,   -- Total truncado (apenas parte inteira + 2 decimais)
    sd.LineTotal,                        -- Total original da linha
    (sd.OrderQty * sd.UnitPrice) AS valor_total_calculado, -- Total calculado manualmente
    sd.SalesOrderDetailID,               -- Código do detalhe do pedido
    sd.OrderQty,                         -- Quantidade pedida
    sd.ProductID,                        -- Código do produto
    sd.UnitPrice                          -- Preço unitário

FROM salesorderheader sh
INNER JOIN salesorderdetail sd
    ON sh.SalesOrderID = sd.SalesOrderID   -- Relaciona cabeçalho e detalhe do pedido

-- Filtra apenas os pedidos com total da linha entre 2.500 e 3.000
WHERE sd.LineTotal BETWEEN 2500 AND 3000;
