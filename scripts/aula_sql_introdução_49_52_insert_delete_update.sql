-- ===============================================================
-- Script: Relacionamentos, Views e Manipulação de Dados (AdventureWorks)
-- Autor: Valdomiro Ramos
-- Banco de dados: MySQL (base AdventureWorks)
-- Objetivo: Demonstrar junções entre tabelas, criação e uso de views,
--           além de comandos de manipulação (INSERT, DELETE, TRUNCATE, DROP)
-- ===============================================================

-- Visualiza as tabelas básicas de clientes e endereços
SELECT * FROM customer;
SELECT * FROM customeraddress;
SELECT * FROM address;

-- ===============================================================
-- 🔸 Exercício 04 – Junção entre Customer, CustomerAddress e Address
-- ===============================================================

-- Exibe dados de clientes e seus respectivos endereços
SELECT 
    c.CustomerID,
    c.AccountNumber,
    a.AddressLine1,
    a.AddressLine2,
    a.City,
    a.PostalCode,
    a.StateProvinceID
FROM customer c
INNER JOIN customeraddress ca ON c.CustomerID = ca.CustomerID
INNER JOIN address a ON a.AddressID = ca.AddressID;

-- ===============================================================
-- 🔸 Criação e alteração de Views
-- ===============================================================

-- Cria uma view com lista de clientes e endereços básicos
CREATE VIEW vw_lista_customer AS
SELECT 
    c.CustomerID,
    c.AccountNumber,
    a.AddressLine1,
    a.AddressLine2,
    a.City,
    a.PostalCode,
    a.StateProvinceID
FROM customer c
INNER JOIN customeraddress ca ON c.CustomerID = ca.CustomerID
INNER JOIN address a ON a.AddressID = ca.AddressID;

-- ===============================================================
-- 🔸 Criação de uma segunda view com dados complementares (StateProvince)
-- ===============================================================

CREATE VIEW vw_lista_customer_2 AS
SELECT 
    c.CustomerID,
    c.AccountNumber,
    a.AddressLine1,
    a.AddressLine2,
    a.City,
    a.PostalCode,
    a.StateProvinceID,
    st.Name AS province
FROM customer c
INNER JOIN customeraddress ca ON c.CustomerID = ca.CustomerID
INNER JOIN address a ON a.AddressID = ca.AddressID
INNER JOIN stateprovince st ON a.StateProvinceID = st.StateProvinceID;

-- ===============================================================
-- 🔸 Consultas às views criadas
-- ===============================================================

-- Consulta à primeira view (lista simples de clientes)
SELECT * FROM vw_lista_customer;

-- Faz join entre a view e a tabela stateprovince para trazer o nome do estado
SELECT 
    v.*, 
    st.Name AS province
FROM vw_lista_customer v
INNER JOIN stateprovince st ON v.StateProvinceID = st.StateProvinceID;

-- Consulta à segunda view (já contém o nome do estado)
SELECT * FROM vw_lista_customer_2;

-- Visualiza outra view existente no banco (provavelmente de dados de compras)
SELECT * FROM vw_dados_compras;

-- ===============================================================
-- 🔸 Consultas de vendas e produtos (preparação de view de vendas)
-- ===============================================================

SELECT * FROM salesorderheader;
SELECT * FROM salesorderdetail;
SELECT * FROM product;
SELECT * FROM productsubcategory;
SELECT * FROM productcategory;

-- ===============================================================
-- 🔸 Alteração de view de vendas (vw_lista_vendas)
-- ===============================================================

-- Cria ou altera uma view consolidando informações de vendas
ALTER VIEW vw_lista_vendas AS
SELECT 
    pc.ProductCategoryID,
    pc.Name AS categoria,
    ps.ProductSubcategoryID,
    ps.Name AS subcategoria,
    p.ProductID,
    p.Name AS produto,
    sd.OrderQty,
    sd.UnitPrice,
    sd.LineTotal,
    sh.SalesOrderID,
    sh.OrderDate
FROM salesorderheader sh
INNER JOIN salesorderdetail sd ON sh.SalesOrderID = sd.SalesOrderID
INNER JOIN product p ON p.ProductID = sd.ProductID
INNER JOIN productsubcategory ps ON ps.ProductSubcategoryID = p.ProductSubcategoryID
INNER JOIN productcategory pc ON pc.ProductCategoryID = ps.ProductCategoryID;

-- Visualiza o conteúdo da view de vendas
SELECT * FROM vw_lista_vendas;

-- Conta a quantidade de registros da view
SELECT COUNT(1) FROM vw_lista_vendas;

-- ===============================================================
-- 🔸 Operações com tabela de clientes personalizada
-- ===============================================================

-- Exibe tabela de clientes personalizada
SELECT * FROM tb_customers;

-- Insere um novo cliente manualmente
INSERT INTO tb_customers (id, name, endereco) VALUES ('121212', 'valdomiro', 'rua z');

-- Chamada de procedure que insere um cliente automaticamente
CALL sp_insere_customer(777, 'mario', 'rua 99');

-- Chamada de procedure que lista produtos com filtro (exemplo com prefixo “TD”)
CALL sp_lista_produtos_2('TD');

-- Cria uma cópia da tabela de clientes
CREATE TABLE tb_customers_4 AS
SELECT * FROM tb_customers;

-- Desativa o modo de segurança para permitir deleções sem WHERE com chave primária
SET SQL_SAFE_UPDATES = 0;

-- Exclui um registro específico
DELETE FROM tb_customers_4 WHERE id = '121212';

-- Remove todos os registros da tabela, mas mantém sua estrutura
TRUNCATE TABLE tb_customers_4;

-- Remove completamente a tabela do banco
DROP TABLE tb_customers_4;

-- Tenta visualizar o conteúdo da tabela (irá falhar se a tabela foi dropada)
SELECT * FROM tb_customers_4;

-- ===============================================================
-- 🔸 Diferença entre os comandos de exclusão
-- ===============================================================
-- DELETE   → Remove registros específicos (com WHERE)
-- TRUNCATE → Remove todos os registros, mas mantém a tabela
-- DROP     → Apaga completamente a tabela (estrutura e dados)
-- ===============================================================
