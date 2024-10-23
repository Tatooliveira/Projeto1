from faker import Faker
import random

class Usuario:
    def __init__(self, nome, email, registro):
        self.nome = nome
        self.email = email
        self.registro = registro

    def create(self):
        return f"INSERT INTO Usuario (Nome, Email, Registro) VALUES ('{self.nome}', '{self.email}', '{self.registro}');\n"

class Playlist:
    def __init__(self, titulo, usuario_id):
        self.titulo = titulo
        self.usuario_id = usuario_id

    def create(self):
        return f"INSERT INTO Playlist (Titulo, ID_Us) VALUES ('{self.titulo}', {self.usuario_id});\n"

class Artista:
    def __init__(self, nome, nascimento):
        self.nome = nome
        self.nascimento = nascimento

    def create(self):
        return f"INSERT INTO Artista (Nome, Nascimento) VALUES ('{self.nome}', '{self.nascimento}');\n"

class Disco:
    def __init__(self, titulo, lancamento, artista_id):
        self.titulo = titulo
        self.lancamento = lancamento
        self.artista_id = artista_id

    def create(self):
        return f"INSERT INTO Disco (Titulo, Lancamento, ID_Ar) VALUES ('{self.titulo}', '{self.lancamento}', {self.artista_id});\n"

class Musica:
    def __init__(self, titulo, duracao, disco_id):
        self.titulo = titulo
        self.duracao = duracao
        self.disco_id = disco_id

    def create(self):
        return f"INSERT INTO Musica (Titulo, Duracao, ID_Di) VALUES ('{self.titulo}', {self.duracao}, {self.disco_id});\n"

class MusicaArtista:
    def __init__(self, musica_id, artista_id):
        self.musica_id = musica_id
        self.artista_id = artista_id

    def create(self):
        return f"INSERT INTO Musica_Artista (ID_Mu, ID_Ar) VALUES ({self.musica_id}, {self.artista_id});\n"

class PlaylistMusica:
    def __init__(self, playlist_id, musica_id):
        self.playlist_id = playlist_id
        self.musica_id = musica_id

    def create(self):
        return f"INSERT INTO Playlist_Musica (ID_Pl, ID_Mu) VALUES ({self.playlist_id}, {self.musica_id});\n"

fake = Faker(['pt_BR'])

usuarios = [Usuario(fake.name(), fake.email(), fake.date_between(start_date='-5y', end_date='today')) for _ in range(20)]
artistas = [Artista(fake.name(), fake.date_of_birth(minimum_age=20, maximum_age=60)) for _ in range(10)]
discos = [Disco(fake.sentence(nb_words=3), fake.date_between(start_date='-10y', end_date='today'), random.randint(1, len(artistas))) for _ in range(30)]
musicas = [Musica(fake.sentence(nb_words=4), random.randint(180, 300), random.randint(1, len(discos))) for _ in range(100)]
playlists = [Playlist(fake.sentence(nb_words=3), random.randint(1, len(usuarios))) for _ in range(15)]

musica_artistas = [MusicaArtista(random.randint(1, len(musicas)), random.randint(1, len(artistas))) for _ in range(50)]
playlist_musicas = [PlaylistMusica(random.randint(1, len(playlists)), random.randint(1, len(musicas))) for _ in range(40)]

with open("./seeder.sql", "w", encoding='utf-8') as f:
    for usuario in usuarios:
        f.write(usuario.create())
    
    f.write("\n")

    for artista in artistas:
        f.write(artista.create())
    
    f.write("\n")

    for disco in discos:
        f.write(disco.create())
    
    f.write("\n")

    for musica in musicas:
        f.write(musica.create())
    
    f.write("\n")

    for playlist in playlists:
        f.write(playlist.create())
    
    f.write("\n")

    for musica_artista in musica_artistas:
        f.write(musica_artista.create())
    
    f.write("\n")

    for playlist_musica in playlist_musicas:
        f.write(playlist_musica.create())
