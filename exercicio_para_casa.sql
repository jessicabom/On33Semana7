-- TABLE
CREATE TABLE demo (ID integer primary key, Name varchar(20), Hint text );
CREATE TABLE estoque(
  id INTEGER PRIMARY KEY,
  livro_id INTEGER,
  quantidade INTEGER,
  FOREIGN KEY (livro_id) REFERENCES livros(id)
  );
CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    autor TEXT,
    ano_publicacao INTEGER,
    preco REAL
);
 

 ..............................
 -- Criar a tabela 'livros'
CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    autor TEXT,
    ano_publicacao INTEGER,
    preco REAL
);

-- Inserir os registros de livros
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('Dom Quixote', 'Miguel de Cervantes', 1605, 29.90);
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('Orgulho e Preconceito', 'Jane Austen', 1813, 25.50);
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('1984', 'George Orwell', 1949, 35.75);

SELECT * from livros


......................................

CREATE TABLE estoque(
  id INTEGER PRIMARY KEY,
  livro_id INTEGER,
  quantidade INTEGER,
  FOREIGN KEY (livro_id) REFERENCES livros(id)
  );
  
INSERT INTO estoque (livro_id, quantidade) VALUES (1, 5);
INSERT INTO estoque (livro_id, quantidade) VALUES (1, 3);
INSERT INTO estoque (livro_id, quantidade) VALUES (2, 1);
INSERT INTO estoque (livro_id, quantidade) VALUES (2, 7);
INSERT INTO estoque (livro_id, quantidade) VALUES (3, 1);

--Adicionar unidades(quantidade) ao estoque de um livro específico
UPDATE estoque SET quantidade = quantidade + 1, livro_id = 2 where id = 2

--Atualizar unidades(quantidade) do estoque de um livro específico
UPDATE estoque SET quantidade = 5, livro_id = 1 WHERE id = 1


--CONSULTAS:

-- Consulta geral do estoque
SELECT * FROM estoque

--Consulta: obter a quantidade disponível em estoque para um determinado livro
SELECT livros.titulo,
SUM(estoque.quantidade), COUNT(*) AS entradas_no_estoque
FROM estoque
JOIN livros ON livros.id = estoque.livro_id
WHERE livro_id = 2


--Consulta: obter a quantidade disponível para todos os livros
SELECT livros.titulo,
SUM(estoque.quantidade), COUNT(*) AS entradas_no_estoque
FROM estoque
JOIN livros ON livros.id = estoque.livro_id
--WHERE livro_id = 2
GROUP BY titulo
order by SUM(estoque.quantidade) DESC


-- INDEX
 
-- TRIGGER
 
-- VIEW
 
