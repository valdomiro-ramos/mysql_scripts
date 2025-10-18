-- ===============================================================
-- Consultas na tabela de produtos e subcategorias
-- ===============================================================

-- Visualiza todos os produtos
SELECT * FROM product p;

-- Inner join com subcategoria para relacionar produtos às categorias
SELECT *
FROM product p
INNER JOIN productsubcategory pc
    ON p.ProductSubcategoryID = pc.ProductSubcategoryID;

-- Left join para incluir produtos que não tenham subcategoria
SELECT 
    p.ProductID,
    p.Name AS produto,
    p.Color,
    p.ProductSubcategoryID,
    pc.Name AS subcategoria
FROM product p
LEFT JOIN productsubcategory pc
    ON p.ProductSubcategoryID = pc.ProductSubcategoryID;

-- Filtra produtos da cor 'Red'
SELECT 
    p.ProductID,
    p.Name AS produto,
    p.Color,
    p.ProductSubcategoryID,
    pc.Name AS subcategoria
FROM product p
LEFT JOIN productsubcategory pc
    ON p.ProductSubcategoryID = pc.ProductSubcategoryID
WHERE color = 'Red';

-- Filtra produtos com cores Red, Black ou Blue
SELECT 
    p.ProductID,
    p.Name AS produto,
    p.Color,
    p.ProductSubcategoryID,
    pc.Name AS subcategoria
FROM product p
LEFT JOIN productsubcategory pc
    ON p.ProductSubcategoryID = pc.ProductSubcategoryID
WHERE color IN ('Red', 'Black', 'Blue');

-- Filtra produtos com ListPrice diferente de zero
SELECT 
    p.ProductID,
    p.Name AS produto,
    p.Color,
    p.ProductSubcategoryID,
    pc.Name AS subcategoria,
    p.ListPrice
FROM product p
LEFT JOIN productsubcategory pc
    ON p.ProductSubcategoryID = pc.ProductSubcategoryID
WHERE p.ListPrice <> 0;

-- Filtra produtos com ListPrice entre 50 e 70
SELECT 
    p.ProductID,
    p.Name AS produto,
    p.Color,
    p.ProductSubcategoryID,
    pc.Name AS subcategoria,
    p.ListPrice
FROM product p
LEFT JOIN productsubcategory pc
    ON p.ProductSubcategoryID = pc.ProductSubcategoryID
WHERE p.ListPrice BETWEEN 50 AND 70;

-- Produtos que possuem subcategoria
SELECT *
FROM product p
WHERE EXISTS (
    SELECT *
    FROM productsubcategory pc
    WHERE pc.ProductSubcategoryID = p.ProductSubcategoryID
);

-- Produtos que não possuem subcategoria
SELECT *
FROM product p
WHERE NOT EXISTS (
    SELECT *
    FROM productsubcategory pc
    WHERE pc.ProductSubcategoryID = p.ProductSubcategoryID
);

-- Filtra produtos pelo nome contendo 'Moun'
SELECT 
    p.ProductID,
    p.Name AS produto,
    p.Color,
    p.ProductSubcategoryID,
    pc.Name AS subcategoria,
    p.ListPrice
FROM product p
LEFT JOIN productsubcategory pc
    ON p.ProductSubcategoryID = pc.ProductSubcategoryID
WHERE p.Name LIKE '%Moun%';

-- Filtra produtos pelo nome começando com 'Moun'
SELECT 
    p.ProductID,
    p.Name AS produto,
    p.Color,
    p.ProductSubcategoryID,
    pc.Name AS subcategoria,
    p.ListPrice
FROM product p
LEFT JOIN productsubcategory pc
    ON p.ProductSubcategoryID = pc.ProductSubcategoryID
WHERE p.Name LIKE 'Moun%';

-- ===============================================================
-- Criação de view consolidada de produtos com cálculos e status
-- ===============================================================

CREATE VIEW vw_lista_produtos AS
SELECT 
    p.ProductID,
    p.Name AS product,
    p.Color,
    p.ProductSubcategoryID,
    pc.Name AS subcategoria,
    p.ListPrice,
    
    -- Corrige ListPrice igual a zero
    CASE 
        WHEN p.ListPrice = 0 THEN 1 
        ELSE p.ListPrice 
    END AS Listprice_calc,
    
    -- Verifica se o cadastro está completo
    CASE
        WHEN p.ProductSubcategoryID IS NULL THEN 'INCOMPLETO'
        ELSE 'COMPLETO'
    END AS STATUS_CADASTRO,
    
    -- Classificação do produto por faixa de preço
    CASE
        WHEN p.ListPrice = 0 THEN 'Gratuito'
        WHEN p.ListPrice BETWEEN 1 AND 20 THEN 'Baixo'
        WHEN p.ListPrice BETWEEN 21 AND 70 THEN 'Medio'
        ELSE 'Alto'
    END AS LISTA_PRECO

FROM product p
LEFT JOIN productsubcategory pc
    ON p.ProductSubcategoryID = pc.ProductSubcategoryID

ORDER BY p.ListPrice;

-- Consulta final da view criada
SELECT * FROM vw_lista_produtos;
