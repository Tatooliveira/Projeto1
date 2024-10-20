use projeto1;

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
    
-- Criação da tabela Música
create table Musica(
	ID_Mu int primary key auto_increment,
    Titulo varchar(255) not null,
    Duracao int not null,
    ID_Di int,
    foreign key (ID_Di) references Disco(ID_Di));
    
-- Criação da tabela Disco
create table Disco(
	ID_Di int primary key auto_increment,
    Titulo varchar(255) not null,
    Lancamento date not null,
    ID_Ar int,
    foreign key (ID_Ar) references Artista(ID_Ar));
    
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
    
delete from Usuario where ID_Us = 1;
select * from Musica
    