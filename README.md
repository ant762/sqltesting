# SQL - Guia Completo

Destinado a aprendizagem de programador de sistemas do SENAI.

## Sumário

- [Introdução ao SQL](#introdução-ao-sql)
- [Comandos Básicos](#comandos-básicos)
- [Consultas (SELECT)](#consultas-select)
- [Filtros e Condições (WHERE)](#filtros-e-condições-where)
- [Ordenação (ORDER BY)](#ordenação-order-by)
- [Joins (INNER JOIN, LEFT JOIN, RIGHT JOIN)](#joins-inner-join-left-join-right-join)
- [Subconsultas (Subqueries)](#subconsultas-subqueries)
- [Agrupamento de Dados (GROUP BY)](#agrupamento-de-dados-group-by)
- [Funções Agregadas (SUM, AVG, COUNT)](#funções-agregadas-sum-avg-count)
- [Alteração de Dados (INSERT, UPDATE, DELETE)](#alteração-de-dados-insert-update-delete)
- [Criação e Modificação de Tabelas](#criação-e-modificação-de-tabelas)
- [Transações e Controle de Erros](#transações-e-controle-de-erros)

---

SQL (Structured Query Language) é a linguagem padrão usada para interagir com bancos de dados relacionais. Com o SQL, você pode: criar e manipular tabelas e índices, inserir, atualizar, excluir e consultar dados, além de definir e controlar o acesso a dados. SQL é essencial para o desenvolvimento de sistemas que utilizam bancos de dados.

---

```sql
-- Mostrar todas as tabelas no banco de dados
SHOW TABLES;

-- Mostrar a estrutura de uma tabela
DESCRIBE nome_da_tabela;

-- Seleciona todas as colunas de uma tabela
SELECT * FROM nome_da_tabela;

-- Seleciona colunas específicas de uma tabela
SELECT coluna1, coluna2 FROM nome_da_tabela;

-- Seleciona todos os usuários com idade maior que 18
SELECT * FROM usuarios WHERE idade > 18;

-- Seleciona usuários com nome específico
SELECT * FROM usuarios WHERE nome = 'João';

-- Ordena os resultados por idade (ascendente)
SELECT * FROM usuarios ORDER BY idade ASC;

-- Ordena os resultados por nome (descendente)
SELECT * FROM usuarios ORDER BY nome DESC;

-- INNER JOIN: Retorna registros que têm correspondência nas duas tabelas
SELECT u.nome, o.valor
FROM usuarios u
INNER JOIN pedidos o ON u.id = o.usuario_id;

-- LEFT JOIN: Retorna todos os registros da tabela à esquerda e os correspondentes da tabela à direita
SELECT u.nome, o.valor
FROM usuarios u
LEFT JOIN pedidos o ON u.id = o.usuario_id;

-- RIGHT JOIN: Retorna todos os registros da tabela à direita e os correspondentes da tabela à esquerda
SELECT u.nome, o.valor
FROM usuarios u
RIGHT JOIN pedidos o ON u.id = o.usuario_id;

-- Seleciona usuários que fizeram pedidos
SELECT nome
FROM usuarios
WHERE id IN (SELECT usuario_id FROM pedidos);

-- Conta o número de pedidos por usuário
SELECT usuario_id, COUNT(*) AS numero_de_pedidos
FROM pedidos
GROUP BY usuario_id;

-- Soma o valor dos pedidos por usuário
SELECT usuario_id, SUM(valor) AS total_gasto
FROM pedidos
GROUP BY usuario_id;

-- Soma dos valores de pedidos
SELECT SUM(valor) FROM pedidos;

-- Média dos valores de pedidos
SELECT AVG(valor) FROM pedidos;

-- Contagem do número de pedidos
SELECT COUNT(*) FROM pedidos;

-- Inserir um novo registro
INSERT INTO usuarios (nome, idade, email)
VALUES ('Carlos', 25, 'carlos@exemplo.com');

-- Atualizar um registro existente
UPDATE usuarios
SET idade = 26
WHERE nome = 'Carlos';

-- Deletar um registro
DELETE FROM usuarios
WHERE nome = 'Carlos';

-- Criar uma nova tabela
CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    idade INT,
    email VARCHAR(100)
);

-- Adicionar uma nova coluna à tabela
ALTER TABLE usuarios
ADD COLUMN endereco VARCHAR(255);

-- Modificar uma coluna existente
ALTER TABLE usuarios
MODIFY COLUMN idade INT(3);

-- Iniciar uma transação
START TRANSACTION;

-- Realizar operações
INSERT INTO usuarios (nome, idade, email) VALUES ('Ana', 30, 'ana@exemplo.com');
UPDATE usuarios SET idade = 31 WHERE nome = 'Ana';

-- Commit (confirma as alterações)
COMMIT;

-- Rollback (desfaz as alterações)
ROLLBACK;
