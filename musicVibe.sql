-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS musicvibe CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE musicvibe;

-- Tabela: playlists
CREATE TABLE IF NOT EXISTS playlists (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserção de dados na tabela playlists
INSERT INTO playlists (id, nome) VALUES
(1, 'ColdPlay'),
(2, 'Músicas sertanejas');

-- Tabela: artistas
CREATE TABLE IF NOT EXISTS artista (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela: musicas com campo "favorita" e relação com artista
CREATE TABLE IF NOT EXISTS musicas (
  id INT(11) NOT NULL AUTO_INCREMENT,
  playlist_id INT(11) NULL,
  titulo VARCHAR(255) NOT NULL,
  artista_id INT(11) DEFAULT NULL,
  favorita BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (id),
  KEY playlist_id (playlist_id),
  KEY artista_id (artista_id),
  CONSTRAINT musicas_ibfk_1 FOREIGN KEY (playlist_id) REFERENCES playlists (id) ON DELETE CASCADE,
  CONSTRAINT musicas_ibfk_2 FOREIGN KEY (artista_id) REFERENCES artista (id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserção de exemplo na tabela artista
INSERT INTO artista (id, nome) VALUES
(1, 'ColdPlay');

-- Inserção de dados na tabela musicas
INSERT INTO musicas (id, playlist_id, titulo, artista_id, favorita) VALUES
(1, 1, 'A Sky Full of Stars', 1, FALSE);

-- Tabela: usuarios
CREATE TABLE IF NOT EXISTS usuarios (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) DEFAULT NULL,
  email VARCHAR(100) DEFAULT NULL,
  password VARCHAR(255) DEFAULT NULL,
  senha VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserção de dados na tabela usuarios
INSERT INTO usuarios (id, name, email, password, senha) VALUES
(1, NULL, 'laura@email.com', NULL, '123'),
(2, NULL, 'laura@gmail.com', NULL, '123'),
(3, NULL, 'xunda@gmail.com', NULL, '123'),
(4, NULL, 'carlos@gmail.com', NULL, '123'),
(5, NULL, 'diego@gmail.com', NULL, '123'),
(6, NULL, 'antonia@gmail.com', NULL, '123');

-- Tabela: admin
CREATE TABLE IF NOT EXISTS admin (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  senha VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




CREATE TABLE playlist_musica (
  id INT AUTO_INCREMENT PRIMARY KEY,
  playlist_id INT,
  musica_id INT,
  FOREIGN KEY (playlist_id) REFERENCES playlists(id) ON DELETE CASCADE,
  FOREIGN KEY (musica_id) REFERENCES musicas(id) ON DELETE CASCADE
);
