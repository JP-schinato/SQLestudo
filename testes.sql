-- aprendizados com sql

-- Selecionando todas as linhas e colunas da tabela pedidos

SELECT * FROM pedidos;

-- Selecinando colunas específicas

SELECT * FROM clientes;

SELECT 
ID_Cliente,
 Nome, 
 Data_Nascimento,
 Email
 FROM clientes;
 
 -- usando as para alterar nome de colunas
 
 SELECT 
ID_Cliente,
 Nome as 'nome',
 Data_Nascimento as 'nasc',
 Email as 'eml'
 FROM clientes;
 
 -- selecionando quanatas linhas eu quiser primeiras linhas
 
 SELECT * FROM produtos
 limit 8;
 
 -- selecionar todas as linhas da tabela produto mas ordenando pela coluna Preco_unit
 
 SELECT * FROM produtos
 order by Preco_Unit;
 select * from produtos
 order by Preco_unit desc;
 
 -- filtrando dados da tabela
 
 SELECT * FROM produtos
 where Marca_Produto = 'DELL';
 
 -- alteração de valores da tabela
 
 UPDATE produtos
 SET Custo_Unit = 200.50
 WHERE Marca_Produto = 'SONY';
 
 select * from produtos;
 
 -- excluir linhas da tabela
 
DELETE FROM produtos
WHERE ID_Produto = 2;

SELECT * FROM produtos;

-- exclusao de dados da tabela 

 -- TRUNCATE TABLE produtos; <--
 
 -- mostrar preços iguais ou maiores que 1000
 
 SELECT * FROM produtos
 WHERE Preco_Unit >= 1000;
 
 
 
 -- >= maior e igual <= menor e igual = igual > maior < menor
 
 
 
 -- filtrar datas
 
 SELECT * FROM pedidos
WHERE Data_Venda = '2019-01-03';

-- filtrar duas coisas ao mesmo tempo
-- mostra apenas os clientes do sexo masculino que sao solteiros

SELECT * FROM clientes
WHERE Estado_Civil = 'S' AND  Sexo = 'M';
 
SELECT * FROM produtos
WHERE Marca_Produto = 'DELL' OR Marca_Produto = 'SONY';

















-- Funções do mySQL de contagem, soma, média e etc...




-- contagem de produtos
SELECT COUNT(Nome_Produto) FROM produtos;

-- contagem de linhas de uma tabela

SELECT COUNT(*) FROM pedidos;

-- Contagem de escolaridade distinta da tabela clientes

SELECT COUNT(DISTINCT Escolaridade)
FROM clientes;






-- somar o valor da receita da tabela pedidos

	SELECT * FROM pedidos;
    SELECT SUM(Receita_Venda) FROM pedidos;
    
    
-- Retornar media da receita da tabela pedidos

SELECT AVG(Receita_Venda) FROM pedidos;

-- Retornar mínimo da receita da tabela pedidos

SELECT MIN(Receita_Venda) FROM pedidos;

-- Retornar maximo da receita databela pedidos

SELECT MAX(Receita_Venda) FROM PEDIDOS;

-- Todas em um só
 SELECT * FROM pedidos;
SELECT
	SUM(Receita_Venda) AS 'Soma das receitas',
    AVG(Receita_Venda) AS 'Média das Vendas',
    MIN(Receita_Venda) AS 'Menor Receita',
    MAX(Receita_Venda) AS 'Maior Receita'
    FROM pedidos;
    
-- usando com o group by

-- vendo as quantidades de clientes por sexo

SELECT Sexo, COUNT(*) AS 'Quantidade de clientes'
FROM clientes
 GROUP BY Sexo;

-- total de produtos por marca da tabela produtos

SELECT * FROM produtos;

SELECT Marca_Produto, COUNT(*) AS 'Qtd Produtos'
FROM produtos
GROUP BY Marca_Produto;

-- receita e custo total por loja

 SELECT * FROM pedidos;
 
 SELECT ID_Loja,
	SUM(Receita_Venda) AS 'Receita total',
    SUM(Custo_Venda) AS 'TOTAL DO CUSTO'
 FROM pedidos GROUP BY ID_Loja;
 
 
 
 
 
 
 
 # INNER JOIN
 
 -- juntando tabela pedidos com tabela lojas
 
SELECT * FROM pedidos;
SELECT * FROM lojas;

-- TABELA A ---> TABELA FATO ---> TABELA PEDIDOS
-- TABELA B ---> TABELA DIMENSÃO ---> TABELA LOJAS

-- CHAVE PRIMARIA --> ID_Loja
-- CHAVE ESTRANGEIRA --> ID_Loja

SELECT 
	pedidos.*,
    lojas.loja,
    lojas.gerente,
    lojas.telefone
FROM pedidos
INNER JOIN lojas
ON pedidos.ID_Loja = lojas.ID_Loja;
-- Aprendendo Window FUNCTION

SELECT SUM(Qtd_Vendida) FROM pedidos;


-- Entendo OVER junto com PARTITION BY
SELECT
	ID_Loja,
    Data_Venda,
	Custo_Venda,
    Custo_Unit,
    SUM(Qtd_Vendida) OVER(PARTITION BY ID_Loja) AS 'Total Vendido' FROM pedidos;
    
    --Buscando total de clientes por gerente
SELECT
	Endereco,
    Gerente,
    ID_Loja,
    loja,
    Num_Funcionarios,
    Telefone,
    SUM(Num_Funcionarios) OVER(PARTITION BY Gerente) AS 'Funcionarios por Gerente'
FROM lojas;
    

-- FIM DO MEU APRENDIZADO