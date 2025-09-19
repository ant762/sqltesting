
# MYSQL

## 📚 Sumário

- [Comandos](#comandos)
- [DML](#dml)
- [DDL](#ddl)

<h3 id="comandos"> 📌 Comandos </h3>

- 🔤 ***Tipos de String:***
    - ``CHAR:`` tamanho fixo
    - ``VARCHAR:`` tamanho variável
    - ``TINYTEXT:`` string de tamanho bem reduzido
    - ``TEXT:`` string pequena
    - ``MEDIUMTEXT:`` string de tamanho comum
    - ``LONGTEXT:`` string de tamanho grande
    - ``ENUM:`` string com um valor de uma lista predefinida na criação da tabala

- 🗓️ ***Tipos de data:***
    - ``DATE:`` data 'AAAA-MM-DD'
    - ``TIME:`` horário 'hh:mm:ss'
    - ``TIMESTAMP:`` data e horário 'AAAA-MM-DD hh:mm:ss'
    - ``YEAR:`` ano 'AAAA' OU 'AA'

- 🔢 ***Tipos de números:***

    - ``TINYINT:`` número inteiro muito pequeno
    - ``SMALLINT:`` número intero pequeno
    - ``MEDIUMINT`` número inteiro m´dio
    - ``INT:`` número inteiro de tamanho comum
    - ``BIGINT:`` número inteiro de tamanho grande
    - ``DECIMAL:`` número decimal, de ponto fixo
        - **EX:** decimal (3,2) => 1,27
    - ``FLOAT:`` número de ponto flutuante de precisão simples (32 bits)
    - ``BIT:`` campo de um bit
    
<br>

<h3 id="dml"> 📌 DML </h3>

- **DML:** Linguagem de Manipulação de Dados

    - Conjunto de comandos usados para **armazenar, modificar, recuperar, excluir e atualizar** dados em um banco de dados.



- **Comandos DML:**
    
    - ``INSERT INTO``: Usado para inserir novos registros em uma tabela.

    ```sql
    INSERT INTO nome_da_tabela
    (coluna_01, coluna_02, coluna_03) 
    VALUES
    (valor_01, valor_02, valor_03);

    -- Se não forem especificadas as colunas,
    -- O INSERT tentará preencher todas as colunas da tabela
    ```

    ```sql
    INSERT INTO Pessoas
    (id, nome, nascimento, sexo, peso, altura)
    VALUES
    (1, 'Fulano', '1881-03-27', 'M', 83.4, 1.73);
    ```

    - ``SELECT``: A instrução é usada para selecionar dados de um banco de dados.

    ```sql
    SELECT * FROM nome_da_tabela;  -- Seleciona todas as colunas
    ```

<br>

<h3 id="ddl"> 📌 DDL </h3>

- **DDL:** Data Definition Language
    - A DDL é usada para definir e gerenciar estruturas de dados, como bancos, tabelas e colunas.

<br>

- **Comandos DDL:**
    - ``CREATE``: É usada para criar bancos de dados e tabelas.
    ```sql
    -- Criando o banco de dados
    CREATE DATABASE nome_sql;

    -- Criando uma tabela
    CREATE TABLE nome_tabela (
        -- atributos...
    );
    ```
    
    - ``ALTER``: A instrução é usada para modificar a estrutura de uma tabela já existente.  

        - **ADD**: adiciona uma nova coluna  
        ```sql
        ALTER TABLE Pessoas
        ADD email VARCHAR(150);
        ```

        - **MODIFY**: altera o tipo de dado ou restrição de uma coluna existente  
        ```sql
        ALTER TABLE Pessoas
        MODIFY nome VARCHAR(200) NOT NULL;
        ```

        - **RENAME COLUMN**: renomeia uma coluna  
        ```sql
        ALTER TABLE Pessoas
        RENAME COLUMN nome TO nome_completo;
        ```

        - **RENAME TABLE**: renomeia a tabela  
        ```sql
        ALTER TABLE Pessoas
        RENAME TO Usuarios;
        ```

        - **DROP COLUMN**: remove uma coluna  
        ```sql
        ALTER TABLE Pessoas
        DROP COLUMN altura;
        ```

    - ``UPDATE``: A instrução é usada para atualizar valores já existentes em uma tabela. 

    ```sql
    UPDATE nome_da_tabela
    SET coluna_01 = novo_valor
    WHERE condição;
    ```

    ```sql
    UPDATE Pessoas
    SET peso = 85.0, altura = 1.75
    WHERE id = 1;
    ```

    - ``DELETE``: A instrução é usada para remover registros de uma tabela.  

    ```sql
    DELETE FROM nome_da_tabela
    WHERE condição;
    ```

    ```sql
    DELETE FROM Pessoas
    WHERE id = 1;
    ```

    - ``DROP``: A instrução é usada para remover bancos de dados ou tabelas existentes. 
    
    ```sql
    -- Excluindo tabela
    DROP TABLE Pessoas;

    -- Excluindo banco de dados
    DROP DATABASE exemplo_sql;
    ```
<br>

<h3 id="select"> 📌 SELECT </h3>

- Usado para consulta dados de uma ou mais tabelas.

    - **Selecionando dados:**

    ```sql
    SELECT * FROM nome_da_tabela;               -- todas as colunas
    SELECT nome, idade FROM Pessoas;            -- colunas específicas
    SELECT nome AS NomeCompleto FROM Pessoas;   -- renomeando coluna
    SELECT DISTINCT cidade FROM Pessoas;        -- valores distintos
    ```

    - **Ordenando resultados:**

    ```sql
    SELECT * FROM Pessoas ORDER BY nome ASC; -- Crescente
    SELECT * FROM Pessoas ORDER BY idade DESC; -- Crescente
    ```

    - **Filtrando com WHERE:**

    ```sql
    SELECT * FROM Pessoas WHERE idade > 18; -- Idades maiores que 18
    SELECT * FROM Pessoas WHERE cidade = 'São Paulo';
    ```

    - **Busca por padrão (LIKE):**

    ```sql
    SELECT * FROM Pessoas WHERE nome LIKE 'A%';       -- começa com A
    SELECT * FROM Pessoas WHERE nome LIKE '%A';       -- termina com A
    SELECT * FROM Pessoas WHERE nome LIKE '%A%';      -- contém A
    ```

    - **Funções de agregação:**

    ```sql
    SELECT COUNT(*) FROM Pessoas;       -- total de registros
    SELECT AVG(idade) FROM Pessoas;     -- idade média
    SELECT MAX(idade) FROM Pessoas;     -- maior idade
    SELECT MIN(idade) FROM Pessoas;     -- menor idade
    SELECT SUM(peso) FROM Pessoas;      -- soma dos pesos
    ```

    - **Agrupando resultados:**

    ```sql
    SELECT cidade, COUNT(*) 
    FROM Pessoas 
    GROUP BY cidade;
    ```

    - **Filtrando grupos (HAVING):**

    ```sql
    SELECT cidade, COUNT(*) 
    FROM Pessoas 
    GROUP BY cidade
    HAVING COUNT(*) > 5;
    ```
