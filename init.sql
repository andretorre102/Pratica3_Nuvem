CREATE TABLE IF NOT EXISTS organizador (
    id_organizador SERIAL,
    nome_org VARCHAR(100) NOT NULL,
    nome_instituicao VARCHAR(100),
    cargo VARCHAR(100),
    CONSTRAINT pk_id_organizador PRIMARY KEY (id_organizador)
);

CREATE TABLE IF NOT EXISTS feira (
    id_feira SERIAL,
    nome VARCHAR(100) NOT NULL,
    data_hora_inicio TIMESTAMP NOT NULL,
    data_hora_fim TIMESTAMP,
    localizacao VARCHAR(150) NOT NULL,
    coordenadas POINT NOT NULL,
    descricao TEXT,
    id_organizador INT NOT NULL, 
    CONSTRAINT pk_id_feira PRIMARY KEY (id_feira),
    CONSTRAINT fk_id_organizador FOREIGN KEY (id_organizador)
        REFERENCES organizador (id_organizador)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT ck_datas_consistentes CHECK (data_hora_fim IS NULL OR data_hora_fim > data_hora_inicio)
);

INSERT INTO organizador (nome_org, nome_instituicao, cargo) VALUES
    ('Antonio Soares', 'Ematerce', 'Gerente'),
    ('Bruno Costa', 'Ecomercado Solidário', 'Proprietário'),
    ('Carlos Silva', 'Sindicato Rural', 'Presidente');

INSERT INTO feira (nome, data_hora_inicio, data_hora_fim, localizacao, coordenadas, descricao, id_organizador) VALUES
    ('Feira do Pirajá', '2026-10-01 05:00:00', '2026-10-01 13:00:00', 'Mercado do Pirajá', POINT(-38.7758, -7.3889), 'Feira comum', 1),
    ('Feira da Areninha', '2026-10-05 07:00:00', '2026-10-05 17:00:00', 'Praça da Areninha', POINT(-38.7700, -7.3800), 'Feira de produtos orgânicos', 1),
    ('Feira do Sítio Cipuá', '2026-10-07 06:00:00', NULL, 'Zona Rural', point(-38.7690, -7.3550), 'Feira Comunitária', 3);
