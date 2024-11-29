-- Criação do banco de dados
DROP DATABASE IF EXISTS FortesEngenharia;
CREATE DATABASE FortesEngenharia;
USE FortesEngenharia;

-- Tabelas auxiliares
CREATE TABLE TiposUsuario (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE StatusProgresso (
    id_status INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(50) NOT NULL
);

-- Tabela de Usuarios
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo_usuario INT NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tipo_usuario) REFERENCES TiposUsuario(id_tipo)
);

-- Tabela de Categorias de Ações Sociais
CREATE TABLE CategoriasAcoes (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- Tabela de Ações Sociais
CREATE TABLE AcoesSociais (
    id_acao INT AUTO_INCREMENT PRIMARY KEY,
    nome_acao VARCHAR(200) NOT NULL,
    descricao TEXT,
    id_categoria INT,
    data_inicio DATE,
    data_fim DATE,
    status INT NOT NULL,
    id_responsavel INT,
    FOREIGN KEY (id_categoria) REFERENCES CategoriasAcoes(id_categoria),
    FOREIGN KEY (status) REFERENCES StatusProgresso(id_status),
    FOREIGN KEY (id_responsavel) REFERENCES Usuarios(id_usuario)
);

-- Tabela de Progresso das Ações Sociais
CREATE TABLE ProgressoAcoes (
    id_progresso INT AUTO_INCREMENT PRIMARY KEY,
    id_acao INT,
    data_progresso DATE,
    descricao TEXT,
    status_progresso INT NOT NULL,
    FOREIGN KEY (id_acao) REFERENCES AcoesSociais(id_acao),
    FOREIGN KEY (status_progresso) REFERENCES StatusProgresso(id_status)
);

-- Tabela de Feedbacks
CREATE TABLE Feedbacks (
    id_feedback INT AUTO_INCREMENT PRIMARY KEY,
    id_acao INT,
    id_usuario INT,
    comentario TEXT,
    avaliacao INT CHECK (avaliacao BETWEEN 1 AND 5),
    data_feedback DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_acao) REFERENCES AcoesSociais(id_acao),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Tabela de Avaliações Globais
CREATE TABLE AvaliacoesGlobais (
    id_aval INT AUTO_INCREMENT PRIMARY KEY,
    id_acao INT,
    media_avaliacao DECIMAL(3,2) DEFAULT 0.00,
    numero_feedbacks INT DEFAULT 0,
    FOREIGN KEY (id_acao) REFERENCES AcoesSociais(id_acao)
);

-- Tabela de Contribuições de Ideias
CREATE TABLE ContribuicoesIdeias (
    id_ideia INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_acao INT,
    descricao TEXT,
    data_contribuicao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_acao) REFERENCES AcoesSociais(id_acao)
);

-- Inserção de Tipos de Usuario
INSERT INTO TiposUsuario (tipo) VALUES ('admin'), ('Parceiro'), ('colaborador');

-- Inserção de Status de Progresso
INSERT INTO StatusProgresso (status) VALUES ('planejada'), ('em andamento'), ('concluída'), ('cancelada'), ('iniciado'), ('finalizado');

-- Inserção de Usuarios
INSERT INTO Usuarios (nome, email, senha, tipo_usuario) 
VALUES 
    ('João Silva', 'joao@fortes.com', 'senha123', 1),
    ('Maria Oliveira', 'maria@fortes.com', 'senha123', 2),
    ('Pedro Souza', 'pedro@fortes.com', 'senha123', 3);

-- Inserção de Categorias de Ações
INSERT INTO CategoriasAcoes (nome_categoria, descricao)
VALUES 
    ('Educação', 'Ações voltadas para educação e capacitação de jovens e adultos.'),
    ('Meio Ambiente', 'Ações que visam a preservação do meio ambiente e sustentabilidade.');

-- Inserção de Ações Sociais
INSERT INTO AcoesSociais (nome_acao, descricao, id_categoria, data_inicio, data_fim, status, id_responsavel)
VALUES 
    ('Projeto Educacional', 'Curso de capacitação em tecnologia para jovens.', 1, '2024-01-01', '2024-12-31', 1, 1),
    ('Plante uma Árvore', 'Ação de plantio de árvores em comunidades carentes.', 2, '2024-02-01', '2024-11-30', 2, 2);

-- Inserção de Progresso das Ações
INSERT INTO ProgressoAcoes (id_acao, data_progresso, descricao, status_progresso)
VALUES 
    (1, '2024-03-01', 'Início do curso de capacitação.', 5),
    (2, '2024-03-10', 'Plantei as primeiras árvores.', 2);

-- Inserção de Feedbacks
INSERT INTO Feedbacks (id_acao, id_usuario, comentario, avaliacao)
VALUES 
    (1, 2, 'Excelente curso de capacitação, muito útil!', 5),
    (2, 3, 'Ação maravilhosa, espero que dure mais tempo!', 4);
