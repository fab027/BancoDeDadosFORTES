-- Criação do banco de dados (caso ainda não exista)
DROP DATABASE IF EXISTS FortesEngenharia;

CREATE DATABASE IF NOT EXISTS FortesEngenharia;

USE FortesEngenharia;


-- Tabela de Usuários
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('admin', 'participante', 'colaborador') NOT NULL,  -- Tipo de usuário
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
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
    id_categoria INT,  -- Relacionamento com a tabela de Categorias
    data_inicio DATE,
    data_fim DATE,
    status ENUM('planejada', 'em andamento', 'concluída', 'cancelada') DEFAULT 'planejada',
    id_responsavel INT,  -- Responsável pela ação social (pode ser um colaborador ou admin)
    FOREIGN KEY (id_categoria) REFERENCES CategoriasAcoes(id_categoria),
    FOREIGN KEY (id_responsavel) REFERENCES Usuarios(id_usuario)
);

-- Tabela de Progresso das Ações Sociais
CREATE TABLE ProgressoAcoes (
    id_progresso INT AUTO_INCREMENT PRIMARY KEY,
    id_acao INT,
    data_progresso DATE,
    descricao TEXT,
    status_progresso ENUM('iniciado', 'em andamento', 'finalizado') NOT NULL,
    FOREIGN KEY (id_acao) REFERENCES AcoesSociais(id_acao)
);

-- Tabela de Feedbacks
CREATE TABLE Feedbacks (
    id_feedback INT AUTO_INCREMENT PRIMARY KEY,
    id_acao INT,
    id_usuario INT,  -- Quem forneceu o feedback
    comentario TEXT,
    avaliacao INT CHECK (avaliacao BETWEEN 1 AND 5),  -- Avaliação de 1 a 5
    data_feedback DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_acao) REFERENCES AcoesSociais(id_acao),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Tabela de Avaliações Globais das Ações
CREATE TABLE AvaliacoesGlobais (
    id_aval INT AUTO_INCREMENT PRIMARY KEY,
    id_acao INT,
    media_avaliacao DECIMAL(3,2) DEFAULT 0.00,  -- Média das avaliações
    numero_feedbacks INT DEFAULT 0,  -- Quantidade de feedbacks recebidos
    FOREIGN KEY (id_acao) REFERENCES AcoesSociais(id_acao)
);

-- Tabela de Contribuições de Ideias (opcional, se for parte da plataforma)
CREATE TABLE ContribuicoesIdeias (
    id_ideia INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_acao INT,
    descricao TEXT,
    data_contribuicao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_acao) REFERENCES AcoesSociais(id_acao)
);

-- Inserir dados fictícios de exemplo (para facilitar os testes)
INSERT INTO Usuarios (nome, email, senha, tipo_usuario) 
VALUES 
    ('João Silva', 'joao@fortes.com', 'senha123', 'admin'),
    ('Maria Oliveira', 'maria@fortes.com', 'senha123', 'participante'),
    ('Pedro Souza', 'pedro@fortes.com', 'senha123', 'colaborador');

INSERT INTO CategoriasAcoes (nome_categoria, descricao)
VALUES 
    ('Educação', 'Ações voltadas para educação e capacitação de jovens e adultos.'),
    ('Meio Ambiente', 'Ações que visam a preservação do meio ambiente e sustentabilidade.');

INSERT INTO AcoesSociais (nome_acao, descricao, id_categoria, data_inicio, data_fim, id_responsavel)
VALUES 
    ('Projeto Educacional', 'Curso de capacitação em tecnologia para jovens.', 1, '2024-01-01', '2024-12-31', 1),
    ('Plante uma Árvore', 'Ação de plantio de árvores em comunidades carentes.', 2, '2024-02-01', '2024-11-30', 2);

-- Criação de Progresso das Ações
INSERT INTO ProgressoAcoes (id_acao, data_progresso, descricao, status_progresso)
VALUES 
    (1, '2024-03-01', 'Início do curso de capacitação.', 'iniciado'),
    (2, '2024-03-10', 'Plantei as primeiras árvores.', 'em andamento');

-- Inserção de Feedback
INSERT INTO Feedbacks (id_acao, id_usuario, comentario, avaliacao)
VALUES 
    (1, 2, 'Excelente curso de capacitação, muito útil!', 5),
    (2, 3, 'Ação maravilhosa, espero que dure mais tempo!', 4);
