-- TABLE
CREATE TABLE alunos(
  id INTEGER PRIMARY KEY,
  nome TEXT,
  idade INTEGER
);
CREATE TABLE demo (ID integer primary key, Name varchar(20), Hint text );
CREATE TABLE livros(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  titulo TEXT,
  autor TEXT,
  ano_publicacao INTEGER,
  preco REAL
  );
CREATE TABLE testando(
  id INTEGER PRIMARY KEY,
  nome TEXT,
  idade INTEGER,
  cidade TEXT
  );
CREATE TABLE vendas(
  id INTEGER PRIMARY KEY,
  livro_id INTEGER,
  data_venda DATE,
  quantidade INTEGER,
  FOREIGN KEY (livro_id) REFERENCES livros(id)
  );
CREATE TABLE votos(
  id INTEGER PRIMARY KEY,
  id_usuario INTEGER,
  id_livro INTEGER,
  estoque INTEGER
  );
CREATE TABLE "votos_sala"(
  id INTEGER PRIMARY KEY,
  id_usuario INTEGER,
  id_livro INTEGER,
  data_voto DATETIME
  );
CREATE TABLE "votos__"(
  id INTEGER PRIMARY KEY,
  id_usuario INTEGER,
  estoque INTEGER
  );
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
