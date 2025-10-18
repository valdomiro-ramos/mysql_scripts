-- ===============================================================
-- Manipulação de strings e formatação de colunas
-- ===============================================================

-- Exemplo com diversas funções de string na tabela 'product'
SELECT 
    LEFT(a.name, 10) AS produto,                -- Pega os 10 primeiros caracteres do nome do produto
    RIGHT(a.name, 5) AS produto2,               -- Pega os 5 últimos caracteres do nome do produto
    LEFT(a.productNumber, 2) AS productNumber_01, -- Pega os 2 primeiros caracteres do productNumber
    SUBSTRING(a.productNumber, 4, 4) AS productNumber_02, -- Pega 4 caracteres a partir da posição 4 do productNumber
    REPEAT('*', 10) AS COLUNA_REPEAT,           -- Repete o caractere '*' 10 vezes
    UPPER(a.name) AS produto_upper,             -- Converte o nome do produto para maiúsculas
    LOWER(a.name) AS produto_lower,             -- Converte o nome do produto para minúsculas
    INSTR(a.name, ' ') AS campo_instr,          -- Retorna a posição do primeiro espaço no nome do produto
    LEFT(a.name, INSTR(a.name, ' ')) AS produto_p1, -- Pega os caracteres até o primeiro espaço
    LEFT(a.name, IF(INSTR(a.name, ' ') = 0, LENGTH(a.name), INSTR(a.name, ' '))) AS produto_p1_2, 
        -- Mesma lógica, mas trata casos onde não existe espaço
    a.*                                          -- Retorna todas as colunas da tabela

FROM product a;

-- ===============================================================
-- Exemplo de preenchimento à esquerda com zeros (LPAD)
-- ===============================================================

SELECT LPAD(cep, 8, '0') AS cep_formatado
FROM (
    SELECT '49033080' AS cep UNION
    SELECT '433480' UNION
    SELECT '490480' UNION
    SELECT '33080' UNION
    SELECT '80' UNION
    SELECT '8887'
) tb;

-- ===============================================================
-- Concatenando texto com LPAD para formatar CEP
-- ===============================================================

SELECT CONCAT('CEP: ', LPAD(cep, 8, '0')) AS COLUNA
FROM (
    SELECT 49033080 AS cep UNION
    SELECT 433480 UNION
    SELECT 490480 UNION
    SELECT 33080 UNION
    SELECT 80 UNION
    SELECT 8887
) tb;
