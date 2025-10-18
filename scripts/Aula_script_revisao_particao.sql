-- Exibe todos os registros da tabela de clientes
SELECT * FROM tb_customers;

-- Exibe todos os registros da tabela de detalhes de pedidos de compra
SELECT * FROM purchaseorderdetail;

-- Retorna apenas os anos distintos encontrados na coluna DueDate,
-- agrupando por ano (útil para verificar em quais anos há dados)
SELECT YEAR(DueDate)
FROM purchaseorderdetail
GROUP BY YEAR(DueDate);

-- Cria uma nova tabela chamada purchaseorderdetail_2
-- copiando toda a estrutura e dados da tabela purchaseorderdetail
CREATE TABLE purchaseorderdetail_2 AS
SELECT * FROM purchaseorderdetail;

-- Verifica se a nova tabela foi criada corretamente
SELECT * FROM purchaseorderdetail_2;

-- Consulta metadados no dicionário de dados do MySQL,
-- mostrando informações sobre partições da tabela criada.
-- (Útil se você quiser checar se há particionamento aplicado)
SELECT *
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 'purchaseorderdetail_2'
ORDER BY PARTITION_ORDINAL_POSITION;

-- Conta a quantidade de registros por ano do campo DueDate
-- na nova tabela (purchaseorderdetail_2)
SELECT YEAR(DueDate), COUNT(1)
FROM purchaseorderdetail_2
GROUP BY YEAR(DueDate);

-- (Comentado) Exemplo de INSERT para adicionar registros à tabela purchaseorderdetail_2
-- usando dados da própria tabela, alterando o campo DueDate para 4 anos à frente
-- Apenas os registros com PurchaseOrderID = 2808 e cujo novo ano seja 2008 serão inseridos.
-- Isso é útil para simular dados futuros ou históricos modificados.

-- INSERT INTO purchaseorderdetail_2
SELECT 
    po.PurchaseOrderID,             -- ID do pedido de compra
    po.PurchaseOrderDetailID,       -- ID do item de detalhe do pedido
    DATE_ADD(po.DueDate, INTERVAL +4 YEAR) AS DueDate,  -- DueDate acrescido de 4 anos
    po.OrderQty,                    -- Quantidade pedida
    po.ProductID,                   -- ID do produto
    po.UnitPrice,                   -- Preço unitário
    po.LineTotal,                   -- Valor total da linha
    po.ReceivedQty,                 -- Quantidade recebida
    po.RejectedQty,                 -- Quantidade rejeitada
    po.StockedQty,                  -- Quantidade estocada
    po.ModifiedDate                 -- Data da última modificação
FROM purchaseorderdetail_2 po
WHERE po.PurchaseOrderID = 2808
  AND YEAR(DATE_ADD(po.DueDate, INTERVAL +4 YEAR)) = 2008;
