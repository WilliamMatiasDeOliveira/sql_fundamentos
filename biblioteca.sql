CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    id_autor INT,
    ano_publicacao YEAR,
    FOREIGN KEY (id_autor) REFERENCES autores(id)
);

CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE emprestimo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_livro INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    devolvido BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id),
    FOREIGN KEY (id_livro) REFERENCES livros(id)
);


/* SELECIONE TODOS OS REGISTROS DA TABELA ALUNOS */
SELECT * FROM alunos;

/* SELECIONE TITULO E ANO_PUBLICAÇÃO DA TABELA LIVROS */
SELECT titulo, ano_publicacao FROM livros;

/* SELECIONE TODOS OS ALUNOS SEM REPETIR NOMES DA TABELA ALUNOS */
SELECT DISTINCT nome FROM alunos;

/* SELECT A QUANTIDADE DE NOMES UNICOS DA TABELA ALUNOS*/
SELECT COUNT(DISTINCT nome) FROM alunos;

/* SELECIONE TODOS OS LIVROS PUBLICADOS ACIMA DE 1985 */
SELECT * FROM livros WHERE ano_publicacao > 1985;

/* SELECIONE TODOS OS LIVROS ORDENANDO POR ANO_PUBLICACAO */
SELECT * FROM livros ORDER BY ano_publicacao;
/* asc é o default pode ser desc */

/* SELECIONE TODOS OS ALUNOS POR ORDEM ALFABETICA */
SELECT * FROM alunos ORDER BY nome;
/* asc é o default pode ser desc */

/* SELECIONE TODOS OS LIVROS CUJO ANO_PUBLICAÇÃO > 1985 E
TITULO TEM O NOME QUE COMEÇA COM O*/
SELECT * FROM livros
WHERE ano_publicacao > 1985 AND titulo LIKE  'O%'; 

/* SELECIONE TODOS OS LIVROS CUJO ANO_PUBLICAÇÃO > 1932 E
TITULO TEM O NOME QUE COMEÇA COM O ou A*/
SELECT * FROM livros 
WHERE ano_publicacao > 1932 
AND (titulo LIKE 'O%' OR titulo LIKE 'A%');

/* SELECIONE TODOS OS ALUNOS COM O NOME QUE COMEÇAM COM A OU C*/
SELECT * FROM alunos 
WHERE nome LIKE 'A%' 
OR nome LIKE 'C%';

/* SELECIONE TODOS OS ALUNOS MENOS OS QUE O NOME COMEÇA COM A OU C*/
SELECT * FROM alunos 
WHERE nome NOT LIKE 'A%'
AND nome NOT LIKE 'C%';

/* SELECIONE TODOS OS LIVROS PUBLICADOS ENTRE 1920 E 1960*/
SELECT * FROM livros
WHERE ano_publicacao BETWEEN 1920 AND 1960; 

/* SELECIONE TODOS OS LIVROS CUJO ANO DE PUBLICAÇÃO NÃO SEJA 1938 E 1940*/
SELECT * FROM livros 
WHERE ano_publicacao NOT IN (1938, 1940);

/* INSIRA UM LIVRO COM O TITULO = TESTE, ANO_PUBLICAÇÃO = 2025, fk_id_autor_autores = 3*/
INSERT INTO livros(titulo, ano_publicacao, fk_id_autor_autores)
VALUES('teste', 2025, 3);

/* ATUALIZE A TABELA ALUNOS MUDE O NOME E EMAIL DO ALUNO COM ID = 1*/
UPDATE alunos
SET nome = 'teste', email = 'teste@email.com'
WHERE id = 1;

/* DELETAR O ALUNO COM ID = 1 */
DELETE FROM alunos
WHERE id = 1;

/* REMOVER UMA TABELA */
DROP TABLE alunos;

/* SELECIONAR UMA QUANTIA ESPECIFICA DE REGISTROS */
SELECT * FROM alunos 
LIMIT 5;

/* EM UMA TABELA COMO PRODUTOS */
SELECT MIN(price) AS menor_valor
FROM produtos;
/*MAX(), AVG, SUM, COUNT(*) */


/* JOIN */

/* SELECIONE TODOS OS ALUNOS E TODOS OS LIVROS QUE ELES EMPRESTARAM */
SELECT alunos.nome, livros.titulo, emprestimo.data_emprestimo, emprestimo.devolvido
FROM emprestimo
JOIN alunos ON alunos.id = emprestimo.fk_id_aluno_alunos
JOIN livros ON livros.id = emprestimo.fk_id_livro_livros
WHERE emprestimo.devolvido = FALSE;

/* ADICIONA A COLUNA IDADE NA TABELA ALUNOS*/
ALTER TABLE alunos 
ADD idade INT;

/* EXCLUI A COLUNA IDADE DA TABELA ALUNOS */
ALTER TABLE alunos
DROP COLUMN idade;

/* ALTERAR O NOME DA COLUNA NOME NA TABELA ALUNOS */
ALTER TABLE alunos
RENAME COLUMN nome TO novo_nome;

ALTER TABLE alunos 
RENAME COLUMN novo_nome TO nome;





	



























































































