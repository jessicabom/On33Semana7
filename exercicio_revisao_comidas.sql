-- tabela cardapio
CREATE TABLE cardapio(
  id INTEGER PRIMARY KEY,
  nome TEXT,
  tipo TEXT
  );
  
INSERT into cardapio (nome, tipo) VALUES ('macarronada', 'italiana');
INSERT into cardapio (nome, tipo) VALUES ('lasanha', 'italiana');
INSERT into cardapio (nome, tipo) VALUES ('croissant', 'francesa');
INSERT into cardapio (nome, tipo) VALUES ('yakissoba', 'japonesa');
INSERT into cardapio (nome, tipo) VALUES ('barca de sushi', 'japonesa');
INSERT INTO cardapio (nome, tipo) VALUES ('lasanha_pedaco', 'italiana');
INSERT INTO cardapio (nome, tipo) VALUES ('feijoada', 'brasileira');

SELECT * FROM cardapio

UPDATE cardapio SET nome = 'lasanha_inteira' WHERE id = 2



--tabela precos
CREATE TABLE precos(
  id INTEGER PRIMARY KEY,
  id_comida INTEGER,
  preco REAL,
  FOREIGN KEY (id_comida) REFERENCES cardapio(id)
  );
  
INSERT INTO precos (id_comida, preco) VALUES (1, 15.50);
INSERT INTO precos (id_comida, preco) VALUES (2, 25.00);
INSERT INTO precos (id_comida, preco) VALUES (3, 13.00);
INSERT INTO precos (id_comida, preco) VALUES (4, 20.00);
INSERT INTO precos (id_comida, preco) VALUES (5, 62.30);
INSERT INTO precos (id_comida, preco) VALUES (6, 12.00);
INSERT INTO precos (id_comida, preco) VALUES (7, 30.00);

SELECT * FROM precos

--tabela estoque
CREATE TABLE estoque(
  id INTEGER PRIMARY KEY,
  id_comida INTEGER,
  quantidade INTEGER,
  data_validade DATE
  );
  
    
INSERT into estoque (id_comida, quantidade, data_validade) VALUES (1, 20, 2024-08-30);
INSERT into estoque (id_comida, quantidade, data_validade) VALUES (2, 25, 2024-08-30);
INSERT into estoque (id_comida, quantidade, data_validade) VALUES (3, 30, 2024-09-30);
INSERT into estoque (id_comida, quantidade, data_validade) VALUES (4, 20, 2024-10-30);
INSERT into estoque (id_comida, quantidade, data_validade) VALUES (5, 25, 2024-11-30);
INSERT into estoque (id_comida, quantidade, data_validade) VALUES (6, 40, 2024-10-30);
INSERT into estoque (id_comida, quantidade, data_validade) VALUES (7, 30, 2024-11-30);

SELECT * FROM estoque

UPDATE estoque SET data_validade = '2024-07-30' WHERE id = 1;
UPDATE estoque SET data_validade = '2024-08-30' WHERE id = 2;
UPDATE estoque SET data_validade = '2024-09-30' WHERE id = 3;
UPDATE estoque SET data_validade = '2024-10-30' WHERE id = 4;
UPDATE estoque SET data_validade = '2024-11-30' WHERE id = 5;
UPDATE estoque SET data_validade = '2024-10-30' WHERE id = 6;
UPDATE estoque SET data_validade = '2024-11-30' WHERE id = 7;

DELETE FROM estoque WHERE id = 6

--CONSULTAS
--Consulta Geral: nome / preço / quantidade / validade

SELECT cardapio.nome,
precos.preco,
estoque.quantidade,
estoque.data_validade

FROM cardapio

JOIN precos ON precos.id_comida = cardapio.id
JOIN estoque ON estoque.id_comida = cardapio.id


--Consulta por data de validade
SELECT cardapio.nome,
estoque.quantidade,
estoque.data_validade

FROM cardapio

JOIN estoque ON estoque.id_comida = cardapio.id
WHERE data_validade > '2024-10-01'


--Consulta com condicional tipo de comida
SELECT nome, tipo FROM cardapio WHERE tipo = 'italiana'


--Consulta com quantidade total por tipo de comida
SELECT cardapio.tipo,
SUM(estoque.quantidade) AS total_no_estoque
FROM estoque
JOIN cardapio ON cardapio.id = estoque.id_comida
GROUP BY tipo
ORDER BY total_no_estoque DESC



