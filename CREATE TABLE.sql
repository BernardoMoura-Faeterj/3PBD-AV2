CREATE TABLE concurso (
    id_concurso INT AUTO_INCREMENT PRIMARY KEY,
    nome        VARCHAR(100) NOT NULL,
    tipo        VARCHAR(50)  NOT NULL
);

CREATE TABLE cargo (
    id_cargo    INT AUTO_INCREMENT PRIMARY KEY,
    id_concurso INT NOT NULL,
    nome_cargo  VARCHAR(100) NOT NULL,
    CONSTRAINT fk_cargo_concurso
        FOREIGN KEY (id_concurso) REFERENCES concurso (id_concurso)
);

CREATE TABLE fiscal (
    id_fiscal INT AUTO_INCREMENT PRIMARY KEY,
    nome      VARCHAR(100) NOT NULL
);

CREATE TABLE sala (
    id_sala     INT AUTO_INCREMENT PRIMARY KEY,
    id_fiscal   INT NOT NULL,
    numero_sala INT NOT NULL,
    nome_escola VARCHAR(100) NOT NULL,
    endereco    VARCHAR(200) NOT NULL,
    CONSTRAINT fk_sala_fiscal
        FOREIGN KEY (id_fiscal) REFERENCES fiscal (id_fiscal)
);

CREATE TABLE candidato (
    id_candidato INT AUTO_INCREMENT PRIMARY KEY,
    nome         VARCHAR(100) NOT NULL,
    email        VARCHAR(150) NOT NULL,
    cpf          CHAR(14)     NOT NULL UNIQUE,
    login        VARCHAR(50)  NOT NULL UNIQUE,
    senha        VARCHAR(255) NOT NULL,
    endereco     VARCHAR(200) NOT NULL
);

CREATE TABLE inscricao (
    id_inscricao     INT AUTO_INCREMENT PRIMARY KEY,
    id_candidato     INT NOT NULL,
    id_cargo         INT NOT NULL,
    id_sala          INT NOT NULL,
    status_inscricao VARCHAR(20) NOT NULL DEFAULT 'Pendente',
    CHECK (status_inscricao IN ('Pendente','Confirmada','Cancelada')),
    CONSTRAINT fk_inscricao_candidato
        FOREIGN KEY (id_candidato) REFERENCES candidato (id_candidato),
    CONSTRAINT fk_inscricao_cargo
        FOREIGN KEY (id_cargo) REFERENCES cargo (id_cargo),
    CONSTRAINT fk_inscricao_sala
        FOREIGN KEY (id_sala) REFERENCES sala (id_sala)
);

CREATE TABLE prova (
    id_prova     INT AUTO_INCREMENT PRIMARY KEY,
    id_inscricao INT NOT NULL UNIQUE,
    data_prova   DATE NOT NULL,
    nota         DECIMAL(5,2) DEFAULT NULL,
    peso         DECIMAL(5,2) NOT NULL DEFAULT 1.00,
    status       VARCHAR(20) NOT NULL DEFAULT 'Agendada',
    CHECK (status IN ('Agendada','Realizada','Faltou')),
    CONSTRAINT fk_prova_inscricao
        FOREIGN KEY (id_inscricao) REFERENCES inscricao (id_inscricao)
);

CREATE TABLE questao (
    id_questao INT AUTO_INCREMENT PRIMARY KEY,
    enunciado  TEXT NOT NULL,
    gabarito   CHAR(1) NOT NULL,
    status     VARCHAR(20) NOT NULL DEFAULT 'Valida',
    CHECK (status IN ('Valida','Anulada'))
);

CREATE TABLE alternativa (
    id_alternativa INT AUTO_INCREMENT PRIMARY KEY,
    id_questao     INT NOT NULL,
    letra          CHAR(1) NOT NULL,
    descricao      VARCHAR(255) NOT NULL,
    UNIQUE KEY uk_alternativa_questao_letra (id_questao, letra),
    CONSTRAINT fk_alternativa_questao
        FOREIGN KEY (id_questao) REFERENCES questao (id_questao)
);

CREATE TABLE resposta_candidato (
    id_prova      INT NOT NULL,
    id_questao    INT NOT NULL,
    opcao_marcada CHAR(1) NOT NULL,
    acertou       TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (id_prova, id_questao),
    CONSTRAINT fk_resposta_prova
        FOREIGN KEY (id_prova) REFERENCES prova (id_prova),
    CONSTRAINT fk_resposta_questao
        FOREIGN KEY (id_questao) REFERENCES questao (id_questao)
);

CREATE TABLE recurso (
    id_recurso     INT AUTO_INCREMENT PRIMARY KEY,
    id_inscricao   INT NOT NULL,
    id_questao     INT NOT NULL,
    justificativa  TEXT NOT NULL,
    status_recurso VARCHAR(20) NOT NULL DEFAULT 'Pendente',
    CHECK (status_recurso IN ('Pendente','Deferido','Indeferido')),
    CONSTRAINT fk_recurso_inscricao
        FOREIGN KEY (id_inscricao) REFERENCES inscricao (id_inscricao),
    CONSTRAINT fk_recurso_questao
        FOREIGN KEY (id_questao) REFERENCES questao (id_questao)
);
