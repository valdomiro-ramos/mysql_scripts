-- ===============================================================
-- Script: Consultas e relacionamentos entre tabelas no banco AdventureWorks
-- Autor: Valdomiro Ramos
-- Banco de dados: MySQL (base AdventureWorks importada)
-- Objetivo: Demonstrar uso de JOINs e leitura de tabelas relacionadas
-- ===============================================================

-- Seleciona o banco de dados AdventureWorks para uso
USE adventureworks;

-- ===============================================================
-- 🔸 Visualização das tabelas individuais
-- ===============================================================

-- Exibe todos os registros da tabela de produtos
SELECT * FROM product;

-- Exibe todos os registros da tabela de subcategorias de produtos
SELECT * FROM productsubcategory;

-- Exibe todos os registros da tabela de categorias de produtos
SELECT * FROM productcategory;

-- ===============================================================
-- 🔸 Exemplo de INNER JOIN (junção interna)
-- ===============================================================

-- Junta as tabelas product e productsubcategory
-- Somente os registros que possuem correspondência entre as duas tabelas
-- (ou seja, produtos que possuem uma subcategoria definida)
SELECT *
FROM product a
INNER JOIN productsubcategory b
    ON a.ProductSubcategoryID = b.ProductSubcategoryID;

-- Versão mais específica do INNER JOIN, exibindo apenas colunas selecionadas
-- Mostra informações do produto e sua categoria associada
SELECT 
    a.ProductID,          -- ID do produto
    a.Name,               -- Nome do produto
    a.Color,              -- Cor do produto
    a.ProductNumber,      -- Código do produto
    a.StandardCost,       -- Custo padrão
    a.ListPrice,          -- Preço de lista
    b.ProductCategoryID,  -- ID da categoria associada à subcategoria
    b.Name                -- Nome da subcategoria
FROM product a
INNER JOIN productsubcategory b
    ON a.ProductSubcategoryID = b.ProductSubcategoryID;

-- ===============================================================
-- 🔸 Exemplo de LEFT JOIN (junção externa à esquerda)
-- ===============================================================

-- Mesmo relacionamento anterior, mas usando LEFT JOIN.
-- Isso retorna todos os produtos, mesmo os que NÃO possuem subcategoria associada.
SELECT 
    a.ProductID,
    a.Name,
    a.Color,
    a.ProductNumber,
    a.StandardCost,
    a.ListPrice,
    b.ProductCategoryID,
    b.Name
FROM product a
LEFT JOIN productsubcategory b
    ON a.ProductSubcategoryID = b.ProductSubcategoryID;

-- Exemplo mostrando todas as colunas (sem seleção específica)
-- útil para analisar todos os campos retornados no join
SELECT *
FROM product a
LEFT JOIN productsubcategory b
    ON a.ProductSubcategoryID = b.ProductSubcategoryID;

-- ===============================================================
-- 🔸 Outras consultas simples
-- ===============================================================

-- Exibe todos os registros da tabela de endereços (Address)
SELECT * FROM address;

-- Exemplo alternativo com o nome completo do banco antes do nome da tabela
SELECT * FROM adventureworks.product;

-- Outro exemplo equivalente, acessando diretamente a tabela Address
SELECT * FROM adventureworks.address;

-- ===============================================================
-- 🔸 Observações
-- - INNER JOIN → retorna apenas registros com correspondência em ambas as tabelas.
-- - LEFT JOIN  → retorna todos os registros da tabela à esquerda (product),
--                e dados da tabela à direita (productsubcategory) apenas quando houver correspondência.
-- ===============================================================
