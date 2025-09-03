-- Rede Social
-- A rede social “Conecta+” armazena usuários e interações.

-- Campos sugeridos:
-- Usuários: id, nome, e-mail, senha, data cadastro.
-- Postagens: usuário, conteúdo, data hora.
-- Curtidas: postagem, usuário, data hora.
-- Comentários: postagem, usuário, conteúdo, data hora.
-- Amizades: usuário1, usuário2, data início.
-- Regras de negócio:
-- Um usuário não pode ser amigo de si mesmo.
-- Amizade é bidirecional.

CREATE DATABASE ex05;
USE ex05;

CREATE TABLE usuarios (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(60) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    dataCadastro DATE NOT NULL
);

CREATE TABLE postagens (
    idPostagem INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idUsuarioFk INT NOT NULL,
    conteudo TEXT NOT NULL,
    dataHora DATETIME NOT NULL,
    FOREIGN KEY (idUsuarioFk) REFERENCES usuarios (idUsuario)
);

CREATE TABLE curtidas (
    idCurtida INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idPostagemFk INT NOT NULL,
    idUsuarioFk INT NOT NULL,
    dataHora DATETIME NOT NULL,
    FOREIGN KEY (idPostagemFk) REFERENCES postagens (idPostagem),
    FOREIGN KEY (idUsuarioFk) REFERENCES usuarios (idUsuario)
);

CREATE TABLE comentarios (
    idComentario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idPostagemFk INT NOT NULL,
    idUsuarioFk INT NOT NULL,
    conteudo TEXT NOT NULL,
    dataHora DATETIME NOT NULL,
    FOREIGN KEY (idPostagemFk) REFERENCES postagens (idPostagem),
    FOREIGN KEY (idUsuarioFk) REFERENCES usuarios (idUsuario)
);

CREATE TABLE amizades (
    idAmizade INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idUsuario1Fk INT NOT NULL,
    idUsuario2Fk INT NOT NULL,
    dataInicio DATE NOT NULL,
    FOREIGN KEY (idUsuario1Fk) REFERENCES usuarios (idUsuario),
    FOREIGN KEY (idUsuario2Fk) REFERENCES usuarios (idUsuario),
    CONSTRAINT chkUsuariosDiferentes CHECK (idUsuario1Fk <> idUsuario2Fk)
);

INSERT INTO usuarios (nome, email, senha, dataCadastro) VALUES
('João Silva', 'joao.silva@email.com', 'senha123', '2025-08-10'),
('Maria Oliveira', 'maria.oliveira@email.com', 'senha456', '2025-08-11');

INSERT INTO postagens (idUsuarioFk, conteudo, dataHora) VALUES
(1, 'Primeira postagem no Conecta+', '2025-08-15 10:00:00'),
(2, 'Bom dia, pessoal!', '2025-08-15 11:30:00');

INSERT INTO curtidas (idPostagemFk, idUsuarioFk, dataHora) VALUES
(1, 2, '2025-08-15 12:00:00');

INSERT INTO comentarios (idPostagemFk, idUsuarioFk, conteudo, dataHora) VALUES
(1, 2, 'Parabéns pela postagem!', '2025-08-15 12:05:00');

INSERT INTO amizades (idUsuario1Fk, idUsuario2Fk, dataInicio) VALUES
(1, 2, '2025-08-15');

SELECT * FROM usuarios;