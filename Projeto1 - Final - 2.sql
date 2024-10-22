-- Liste o título de todas as músicas e suas durações.
SELECT Titulo, Duracao 
FROM Musica;

-- Encontre o nome de todos os artistas que têm mais de 5 músicas em seu repertório.
SELECT a.Nome 
FROM Artista a
JOIN Musica_Artista ma ON a.ID_Ar = ma.ID_Ar
GROUP BY a.Nome
HAVING COUNT(ma.ID_Mu) > 5;

-- Quais são os títulos dos discos lançados após 2020?
SELECT Titulo, Lancamento
FROM Disco
WHERE Lancamento > '2020-12-31';

-- Liste os títulos das músicas e os nomes dos artistas que as interpretam, ordenados pelo título da música.
SELECT M.Titulo, A.Nome
FROM Musica M
JOIN Musica_Artista MA ON M.ID_Mu = MA.ID_Mu
JOIN Artista A ON MA.ID_Ar = A.ID_Ar
ORDER BY M.Titulo;

-- Encontre os títulos das playlists que contêm a música com o título 'Imagine'.alter.
SELECT P.Titulo
FROM Playlist P
JOIN Playlist_Musica PM ON P.ID_Pl = PM.ID_Pl
JOIN Musica M ON PM.ID_Mu = M.ID_Mu
WHERE M.Titulo = 'Imagine';

-- Liste os usuários que criaram playlists que contêm músicas do disco 'Abbey Road'.alter.
SELECT U.Nome
FROM Usuario U
JOIN Playlist P ON U.ID_Us = P.ID_Us
JOIN Playlist_Musica PM ON P.ID_Pl = PM.ID_Pl
JOIN Musica M ON PM.ID_Mu = M.ID_Mu
JOIN Disco D ON M.ID_Di = D.ID_Di
WHERE D.Titulo = 'Abbey Road';

-- Qual é a duração média das músicas de um artista específico?
SELECT AVG(M.Duracao) AS Duracao_Media
FROM Musica M
JOIN Musica_Artista MA ON M.ID_Mu = MA.ID_Mu
JOIN Artista A ON MA.ID_Ar = A.ID_Ar
WHERE A.Nome = 'Dominique Rivers';

-- Encontre todos os artistas que não têm músicas:
SELECT A.Nome
FROM Artista A
LEFT JOIN Musica_Artista MA ON A.ID_Ar = MA.ID_Ar
WHERE MA.ID_Mu IS NULL;

-- Liste todos os discos que contêm mais de 10 músicas
SELECT D.Titulo
FROM Disco D
JOIN Musica M ON D.ID_Di = M.ID_Di
GROUP BY D.ID_Di
HAVING COUNT(M.ID_Mu) > 10;

-- Quais são os nomes dos artistas que têm discos lançados antes de 2010 e que têm músicas na playlist 'Top 50'.
SELECT A.Nome
FROM Artista A
JOIN Disco D ON A.ID_Ar = D.ID_Ar
JOIN Musica M ON D.ID_Di = M.ID_Di
JOIN Playlist_Musica PM ON M.ID_Mu = PM.ID_Mu
JOIN Playlist P ON PM.ID_Pl = P.ID_Pl
WHERE D.Lancamento < '2010-01-01' AND P.Titulo = 'Top 50';

-- Quais músicas são interpretadas por mais de um artista.
SELECT M.Titulo
FROM Musica M
JOIN Musica_Artista MA ON M.ID_Mu = MA.ID_Mu
GROUP BY M.ID_Mu
HAVING COUNT(MA.ID_Ar) > 1;

-- Liste os títulos das músicas que aparecem em mais de uma playlist:
SELECT M.Titulo
FROM Musica M
JOIN Playlist_Musica PM ON M.ID_Mu = PM.ID_Mu
GROUP BY M.ID_Mu
HAVING COUNT(PM.ID_Pl) > 1;

-- Encontre os nomes dos usuários que têm playlists que incluem a música 'Bohemian Rhapsody':
SELECT U.Nome
FROM Usuario U
JOIN Playlist P ON U.ID_Us = P.ID_Us
JOIN Playlist_Musica PM ON P.ID_Pl = PM.ID_Pl
JOIN Musica M ON PM.ID_Mu = M.ID_Mu
WHERE M.Titulo = 'Bohemian Rhapsody';

-- Qual é o título da música mais longa do disco 'Dark Side of the Moon'?
SELECT M.Titulo
FROM Musica M
JOIN Disco D ON M.ID_Di = D.ID_Di
WHERE D.Titulo = 'Dark Side of the Moon'
ORDER BY M.Duracao DESC
LIMIT 1;

-- Liste todos os discos lançados por um artista específico em um determinado ano:
SELECT D.Titulo
FROM Disco D
JOIN Artista A ON D.ID_Ar = A.ID_Ar
WHERE A.Nome = 'Nome do Artista' AND YEAR(D.Lancamento) = 2023;

-- Quais são os nomes dos artistas que têm músicas em playlists criadas por um usuário específico?
SELECT A.Nome
FROM Artista A
JOIN Musica_Artista MA ON A.ID_Ar = MA.ID_Ar
JOIN Musica M ON MA.ID_Mu = M.ID_Mu
JOIN Playlist_Musica PM ON M.ID_Mu = PM.ID_Mu
JOIN Playlist P ON PM.ID_Pl = P.ID_Pl
JOIN Usuario U ON P.ID_Us = U.ID_Us
WHERE U.Nome = 'Nome do Usuário';

-- Encontre a lista de músicas que não estão em nenhuma playlist:
SELECT M.Titulo
FROM Musica M
LEFT JOIN Playlist_Musica PM ON M.ID_Mu = PM.ID_Mu
WHERE PM.ID_Mu IS NULL;

-- Liste os títulos das músicas e os nomes dos artistas que têm mais de 3 músicas em uma mesma playlist:
SELECT M.Titulo, A.Nome
FROM Musica M
JOIN Musica_Artista MA ON M.ID_Mu = MA.ID_Mu
JOIN Artista A ON MA.ID_Ar = A.ID_Ar
JOIN Playlist_Musica PM ON M.ID_Mu = PM.ID_Mu
GROUP BY PM.ID_Pl, M.ID_Mu
HAVING COUNT(M.ID_Mu) > 3;

-- Quais são os discos que contêm músicas de artistas que têm pelo menos 2 discos lançados?
SELECT D.Titulo
FROM Disco D
JOIN Artista A ON D.ID_Ar = A.ID_Ar
JOIN Musica M ON D.ID_Di = M.ID_Di
WHERE (SELECT COUNT(*) FROM Disco WHERE ID_Ar = A.ID_Ar) >= 2;

-- Liste todos os usuários e suas playlists, mas apenas para playlists que contêm pelo menos 5 músicas:
SELECT U.Nome, P.Titulo
FROM Usuario U
JOIN Playlist P ON U.ID_Us = P.ID_Us
JOIN Playlist_Musica PM ON P.ID_Pl = PM.ID_Pl
GROUP BY P.ID_Pl
HAVING COUNT(PM.ID_Mu) >= 5;