-- Criação da tabela Usuário
create table Usuario(
	ID_Us int primary key auto_increment,
    Nome varchar(255) not null,
    Email varchar(255) not null,
    Registro date not null);
    
-- Criação da tabela Playlist
create table Playlist(
	ID_Pl int primary key auto_increment,
    Titulo varchar(255) not null,
    ID_Us int,
    foreign key (ID_Us) references Usuario(ID_Us));

-- Criação da tabela Disco
create table Disco(
	ID_Di int primary key auto_increment,
    Titulo varchar(255) not null,
    Lancamento date not null,
    ID_Ar int,
    foreign key (ID_Ar) references Artista(ID_Ar));    

-- Criação da tabela Música
create table Musica(
	ID_Mu int primary key auto_increment,
    Titulo varchar(255) not null,
    Duracao int not null,
    ID_Di int,
    foreign key (ID_Di) references Disco(ID_Di));
    
-- Criação da tabela Artista
create table Artista(
	ID_Ar int primary key auto_increment,
    Nome varchar(255) not null,
    Nascimento date not null);
    
-- Criação da tabela de junção Música - Artista
create table Musica_Artista(
	ID_Mu int,
	ID_Ar int,
    foreign key (ID_Mu) references Musica(ID_mu),
    foreign key (ID_Ar) references Artista(ID_Ar));

-- Criação da tabela de junção Playlist - Música
create table Playlist_Musica(
	ID_Pl int,
    ID_Mu int,
    foreign key (ID_Pl) references Playlist(ID_Pl),
    foreign key (ID_Mu) references Musica(ID_Mu));
    
-- Exercício 2: inserindo artistas com mais de 5 músicas no repertório.

INSERT INTO Musica (Titulo, Duracao) VALUES 
('Come Together', 259),
('Something', 182),
('I Want You', 467),
('Here Comes The Sun', 185),
('Let It Be', 243),
('Hey Jude', 431);

INSERT INTO Musica_Artista (ID_Mu, ID_Ar) VALUES 
(LAST_INSERT_ID()-5, 1),
(LAST_INSERT_ID()-4, 1),
(LAST_INSERT_ID()-3, 1),
(LAST_INSERT_ID()-2, 1),
(LAST_INSERT_ID()-1, 1),
(LAST_INSERT_ID(), 1);

INSERT INTO Musica (Titulo, Duracao) VALUES 
('Breathe', 163),
('Time', 420),
('Money', 382),
('Wish You Were Here', 334),
('Shine On You Crazy Diamond', 810),
('Comfortably Numb', 384);

INSERT INTO Musica_Artista (ID_Mu, ID_Ar) VALUES 
(LAST_INSERT_ID()-5, 2),
(LAST_INSERT_ID()-4, 2),
(LAST_INSERT_ID()-3, 2),
(LAST_INSERT_ID()-2, 2),
(LAST_INSERT_ID()-1, 2),
(LAST_INSERT_ID(), 2);

INSERT INTO Musica (Titulo, Duracao) VALUES 
('Black Dog', 296),
('Rock and Roll', 225),
('Stairway to Heaven', 482),
('Kashmir', 515),
('Whole Lotta Love', 333),
('Immigrant Song', 145);

INSERT INTO Musica_Artista (ID_Mu, ID_Ar) VALUES 
(LAST_INSERT_ID()-5, 3),
(LAST_INSERT_ID()-4, 3),
(LAST_INSERT_ID()-3, 3),
(LAST_INSERT_ID()-2, 3),
(LAST_INSERT_ID()-1, 3),
(LAST_INSERT_ID(), 3);

-- Criando playlist com título Imagine
INSERT INTO Usuario (Nome, Email, Registro) VALUES 
('Jonas', 'jonas.s@gmail.com', '2024-10-20'),
('Elias', 'Elias.s@gmail.com', '2024-10-21'),
('Giovanna', 'Giovanna.a@gmail.com', '2024-10-22');

INSERT INTO Playlist (Titulo, ID_Us) VALUES 
('Imagine Peace', 21),   
('Imagine Dragons Hits', 22),  
('Imagine the Best Songs', 23);  

INSERT INTO Playlist_Musica (ID_Pl, ID_Mu) VALUES 
(7, 50),  
(8, 50),  
(9, 50);  

INSERT INTO Musica (Titulo, Duracao, ID_Di) VALUES 
('Imagine - John Lennon', 183, 1),  
('Imagine - A Perfect Circle', 250, 2),  
('Imagine - Eva Cassidy', 300, 3);

INSERT INTO Musica (Titulo, Duracao, ID_Di) VALUES 
('Imagine - John Lennon', 183, 1),
('Imagine - A Perfect Circle', 250, 2),
('Imagine - Eva Cassidy', 300, 3);

INSERT INTO Disco (Titulo, Lancamento, ID_Ar) VALUES 
('Imagine - John Lennon', '1971-09-09', 1),  
('The Dark Side of the Moon - Pink Floyd', '1973-03-01', 2),  
('Led Zeppelin IV - Led Zeppelin', '1971-11-08', 3); 

INSERT INTO Musica (Titulo, Duracao, ID_Di) VALUES 
('Imagine', 183, 1),
('Jealous Guy', 259, 1),
('Instant Karma', 212, 1),
('Working Class Hero', 182, 1),
('Love', 145, 1),
('God', 255, 1),
('Happy Xmas (War Is Over)', 183, 1),
('Give Peace a Chance', 209, 1),
('Woman', 180, 1),
('Mind Games', 217, 1),
('Beautiful Boy', 199, 1),
('Watching the Wheels', 190, 1);

INSERT INTO Musica (Titulo, Duracao, ID_Di) VALUES 
('Speak to Me', 90, 2),
('Breathe', 163, 2),
('On the Run', 216, 2),
('Time', 420, 2),
('The Great Gig in the Sky', 274, 2),
('Money', 382, 2),
('Us and Them', 384, 2),
('Any Colour You Like', 225, 2),
('Brain Damage', 245, 2),
('Eclipse', 123, 2),
('The Last Refugee', 193, 2),
('Fearless', 235, 2);

INSERT INTO Musica (Titulo, Duracao, ID_Di) VALUES 
('Black Dog', 296, 3),
('Rock and Roll', 225, 3),
('Stairway to Heaven', 482, 3),
('Misty Mountain Hop', 277, 3),
('Four Sticks', 282, 3),
('Going to California', 218, 3),
('When the Levee Breaks', 431, 3),
('The Battle of Evermore', 195, 3),
('Over the Hills and Far Away', 210, 3),
('The Rain Song', 314, 3),
('Dancing Days', 204, 3),
('Bron-Yr-Aur Stomp', 192, 3); 
