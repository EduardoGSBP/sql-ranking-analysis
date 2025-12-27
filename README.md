📊 SQL Ranking Analysis Pipeline

Este repositório documenta meu estudo prático de SQL avançado, com foco em ranking de dados, subqueries, tabelas temporárias, window functions (RANK, DENSE_RANK), PARTITION BY e LEFT JOIN aplicados a cenários analíticos reais.

O objetivo do projeto não é apenas executar comandos SQL, mas entender a lógica analítica por trás das consultas e como elas são usadas para responder perguntas de negócio.

🎯 Objetivo do Projeto

Consolidar e demonstrar, de forma organizada, os seguintes conceitos de SQL:

RANK e DENSE_RANK

Ranking avançado com Subqueries

Uso de Tabelas Temporárias para análise

Ranking por grupo com PARTITION BY

Combinação de Ranking + LEFT JOIN

Criação de relatórios analíticos a partir de rankings

Tudo isso seguindo uma progressão lógica, semelhante a um pipeline de análise de dados.

🧠 Estrutura do Projeto

Este projeto foi intencionalmente organizado em um único arquivo SQL, para facilitar o estudo contínuo e a leitura sequencial.

sql-ranking-analysis-pipeline/
├── README.md
├── sql_ranking_analysis_pipeline.sql
└── docs/
    └── project_flow.md

📄 Arquivo principal

sql_ranking_analysis_pipeline.sql
Contém todo o código SQL, dividido em seções bem definidas, com comentários explicando o propósito de cada query.

🗂️ Conteúdos Abordados no SQL

O arquivo SQL está organizado nos seguintes blocos:

Criação do Schema

Tabela base de vendas

Tabela de vendedores

RANK e DENSE_RANK (Básico)

Diferença entre os dois métodos de ranking

Ordenação global dos dados

RANK + Subquery (Avançado)

Uso de subqueries para filtrar rankings

Isolamento do Top N registros

RANK + Subquery + Tabela Temporária

Persistência temporária de rankings

Otimização de análises repetidas

RANK + PARTITION BY

Ranking por categoria

Identificação do melhor desempenho dentro de cada grupo

RANK + LEFT JOIN (Avançado)

Inclusão de entidades sem dados associados

Preservação de informações mesmo sem vendas

Relatório Analítico Final

Consolidação de métricas

Ranking aplicado a contexto de negócio

💡 Aprendizados Principais

Durante este projeto, alguns pontos ficaram claros:

SQL não é apenas sintaxe — é lógica aplicada a dados

WINDOW FUNCTIONS permitem análises que seriam muito complexas com GROUP BY

Subqueries ajudam a organizar o raciocínio, não apenas o código

Tabelas temporárias são fundamentais para auditoria e validação

Ranking é uma ferramenta poderosa para análise comparativa

🚀 Tecnologias Utilizadas

SQL padrão (conceitos compatíveis com PostgreSQL / SQL Server)

Window Functions

Subqueries

Tabelas Temporárias

📌 Observação Importante

Este projeto tem foco educacional e analítico.
A organização em um único arquivo SQL foi uma escolha consciente para facilitar:

estudo

revisão

explicação em entrevistas

clareza da progressão de aprendizado
