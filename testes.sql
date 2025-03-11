
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
 