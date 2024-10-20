-- Liste o título de todas as músicas e suas durações.
SELECT Titulo, Duracao 
FROM Musica;

-- Encontre o nome de todos os artistas que têm mais de 5 músicas em seu repertório.

-- Quais são os títulos dos discos lançados após 2020?
SELECT Titulo, Lancamento
FROM Disco
WHERE Lancamento > '2019-12-31';

-- Liste os títulos das músicas e os nomes dos artistas que as interpretam, ordenados pelo título da música.
