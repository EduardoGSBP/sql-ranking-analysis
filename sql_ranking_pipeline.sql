/* ============================================================
   SQL RANKING PIPELINE
   Banco: PostgreSQL
   Autor: Eduardo
   Foco: RANK, DENSE_RANK, JOINs e Subqueries
   ============================================================ */


/* ============================================================
   SEÇÃO 1 — TABELAS BASE
   Objetivo: criar estrutura mínima para ranking real
   ============================================================ */

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    product_category VARCHAR(50)
);

CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    product_id INT,
    amount NUMERIC(10,2)
);


/* ============================================================
   SEÇÃO 2 — INSERÇÃO DE DADOS
   Objetivo: simular cenários com empates e categorias
   ============================================================ */

INSERT INTO products (product_name, product_category) VALUES
('Notebook', 'Eletrônicos'),
('Celular', 'Eletrônicos'),
('Fone de Ouvido', 'Eletrônicos'),
('Livro SQL', 'Livros'),
('Livro Python', 'Livros'),
('Tênis', 'Esporte');

INSERT INTO sales (product_id, amount) VALUES
(1, 1200.00),
(2, 850.00),
(2, 850.00),
(3, 400.00),
(4, 120.00),
(5, 120.00),
(6, 550.00),
(6, 300.00);


/* ============================================================
   SEÇÃO 3 — JOIN BÁSICO
   Objetivo: enriquecer vendas com informações do produto
   ============================================================ */

SELECT
    p.product_name,
    p.product_category,
    s.amount
FROM sales s
INNER JOIN products p
    ON s.product_id = p.product_id;


/* ============================================================
   SEÇÃO 4 — RANKING GLOBAL (APÓS JOIN)
   Objetivo: comparar todas as vendas
   ============================================================ */

SELECT
    p.product_name,
    p.product_category,
    s.amount,
    RANK() OVER (ORDER BY s.amount DESC) AS rank_global
FROM sales s
INNER JOIN products p
    ON s.product_id = p.product_id;


/* ============================================================
   SEÇÃO 5 — RANK vs DENSE_RANK
   Objetivo: evidenciar diferença prática
   ============================================================ */

SELECT
    p.product_name,
    s.amount,
    RANK() OVER (ORDER BY s.amount DESC) AS rank_result,
    DENSE_RANK() OVER (ORDER BY s.amount DESC) AS dense_rank_result
FROM sales s
INNER JOIN products p
    ON s.product_id = p.product_id;


/* ============================================================
   SEÇÃO 6 — RANK POR CATEGORIA (PARTITION BY)
   Objetivo: ranking dentro de cada grupo
   ============================================================ */

SELECT
    p.product_category,
    p.product_name,
    s.amount,
    RANK() OVER (
        PARTITION BY p.product_category
        ORDER BY s.amount DESC
    ) AS rank_por_categoria
FROM sales s
INNER JOIN products p
    ON s.product_id = p.product_id;


/* ============================================================
   SEÇÃO 7 — SUBQUERY COM RANK
   Objetivo: reutilizar ranking como camada lógica
   ============================================================ */

SELECT *
FROM (
    SELECT
        p.product_category,
        p.product_name,
        s.amount,
        RANK() OVER (
            PARTITION BY p.product_category
            ORDER BY s.amount DESC
        ) AS rank_categoria
    FROM sales s
    INNER JOIN products p
        ON s.product_id = p.product_id
) ranked_products;


/* ============================================================
   SEÇÃO 8 — TOP PRODUTO POR CATEGORIA
   Objetivo: filtrar apenas o primeiro colocado
   ============================================================ */

SELECT
    product_category,
    product_name,
    amount
FROM (
    SELECT
        p.product_category,
        p.product_name,
        s.amount,
        RANK() OVER (
            PARTITION BY p.product_category
            ORDER BY s.amount DESC
        ) AS rank_categoria
    FROM sales s
    INNER JOIN products p
        ON s.product_id = p.product_id
) ranked_products
WHERE rank_categoria = 1;
