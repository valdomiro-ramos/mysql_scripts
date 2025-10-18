-- Criação da view 'vw_lista_produtos'
-- A view reúne informações de produtos e suas subcategorias,
-- acrescentando colunas calculadas e classificações.

CREATE ALGORITHM=UNDEFINED 
DEFINER=`root`@`%` 
SQL SECURITY DEFINER 
VIEW `vw_lista_produtos` AS
SELECT 
    p.ProductID AS ProductID,                 -- Código do produto
    p.Name AS product,                        -- Nome do produto
    p.Color AS Color,                         -- Cor do produto
    p.ProductSubcategoryID AS ProductSubcategoryID, -- Código da subcategoria
    pc.Name AS subcategoria,                  -- Nome da subcategoria
    p.ListPrice AS ListPrice,                 -- Preço original do produto
    
    -- Corrige preços iguais a zero (define como 1 para cálculos)
    CASE 
        WHEN p.ListPrice = 0 THEN 1 
        ELSE p.ListPrice 
    END AS ListPrice_calc,
    
    -- Indica se o cadastro está completo ou incompleto
    CASE 
        WHEN p.ProductSubcategoryID IS NULL THEN 'INCOMPLETO' 
        ELSE 'COMPLETO' 
    END AS STATUS_CADASTRO,
    
    -- Classificação dos produtos por faixa de preço
    CASE 
        WHEN p.ListPrice = 0 THEN 'Gratuito'
        WHEN p.ListPrice BETWEEN 1 AND 20 THEN 'Baixo'
        WHEN p.ListPrice BETWEEN 21 AND 70 THEN 'Médio'
        ELSE 'Alto'
    END AS LISTA_PRECO

FROM product p
LEFT JOIN productsubcategory pc
    ON p.ProductSubcategoryID = pc.ProductSubcategoryID

-- Ordena os resultados pelo preço do produto
ORDER BY p.ListPrice;
