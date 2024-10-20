import mysql.connector
from faker import Faker
import random
from datetime import timedelta, date

# Conexão com o banco de dados
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="celina65",
    database="projeto1"
)
cursor = conn.cursor()

# Inicializando Faker para geração de dados
fake = Faker()

# Função para inserir dados na tabela Usuario
def insert_usuarios(n):
    usuarios = []
    for _ in range(n):
        nome = fake.name()
        email = fake.email()
        registro = fake.date_this_decade()
        cursor.execute("INSERT INTO Usuario (Nome, Email, Registro) VALUES (%s, %s, %s)", (nome, email, registro))
        usuarios.append(cursor.lastrowid)
    conn.commit()
    return usuarios

# Função para inserir dados na tabela Playlist
def insert_playlists(usuarios, n):
    playlists = []
    for _ in range(n):
        titulo = fake.sentence(nb_words=3)
        id_us = random.choice(usuarios)
        cursor.execute("INSERT INTO Playlist (Titulo, ID_Us) VALUES (%s, %s)", (titulo, id_us))
        playlists.append(cursor.lastrowid)
    conn.commit()
    return playlists

# Função para inserir dados na tabela Artista
def insert_artistas(n):
    artistas = []
    for _ in range(n):
        nome = fake.name()
        nascimento = fake.date_of_birth(minimum_age=20, maximum_age=60)
        cursor.execute("INSERT INTO Artista (Nome, Nascimento) VALUES (%s, %s)", (nome, nascimento))
        artistas.append(cursor.lastrowid)
    conn.commit()
    return artistas

# Função para inserir dados na tabela Disco
def insert_discos(artistas, n):
    discos = []
    for _ in range(n):
        titulo = fake.sentence(nb_words=2)
        lancamento = fake.date_between(start_date="-30y", end_date="today")
        id_ar = random.choice(artistas)
        cursor.execute("INSERT INTO Disco (Titulo, Lancamento, ID_Ar) VALUES (%s, %s, %s)", (titulo, lancamento, id_ar))
        discos.append(cursor.lastrowid)
    conn.commit()
    return discos

# Função para inserir dados na tabela Musica
def insert_musicas(discos, n):
    musicas = []
    for _ in range(n):
        titulo = fake.sentence(nb_words=3)
        duracao = random.randint(120, 420)  # Duração entre 2 e 7 minutos
        id_di = random.choice(discos)
        cursor.execute("INSERT INTO Musica (Titulo, Duracao, ID_Di) VALUES (%s, %s, %s)", (titulo, duracao, id_di))
        musicas.append(cursor.lastrowid)
    conn.commit()
    return musicas

# Função para inserir dados na tabela Playlist_Musica
def insert_playlist_musica(playlists, musicas, n):
    for _ in range(n):
        id_pl = random.choice(playlists)
        id_mu = random.choice(musicas)
        cursor.execute("INSERT INTO Playlist_Musica (ID_Pl, ID_Mu) VALUES (%s, %s)", (id_pl, id_mu))
    conn.commit()

# Função para inserir dados na tabela Musica_Artista
def insert_musica_artista(musicas, artistas, n):
    for _ in range(n):
        id_mu = random.choice(musicas)
        id_ar = random.choice(artistas)
        cursor.execute("INSERT INTO Musica_Artista (ID_Mu, ID_Ar) VALUES (%s, %s)", (id_mu, id_ar))
    conn.commit()

# Gerando e inserindo dados
usuarios = insert_usuarios(10)  # Insere 10 usuários
artistas = insert_artistas(10)  # Insere 10 artistas
discos = insert_discos(artistas, 10)  # Insere 10 discos
musicas = insert_musicas(discos, 20)  # Insere 20 músicas
playlists = insert_playlists(usuarios, 5)  # Insere 5 playlists
insert_playlist_musica(playlists, musicas, 10)  # Insere 10 relações Playlist-Música
insert_musica_artista(musicas, artistas, 10)  # Insere 10 relações Música-Artista

# Fechando conexão
cursor.close()
conn.close()
