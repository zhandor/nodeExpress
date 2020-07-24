--ideias de modelagem
create database PharmaLocal;

use PharmaLocal;

CREATE TABLE medicamento(
    id int NOT NULL AUTO_INCREMENT,
    nome_comercial varchar(255) NOT NULL,
    principio_ativo int NOT NULL,
    composicao varchar(255) NOT NULL,
    laboratorio int NOT NULL,
    forma int NOT NULL,
    generico int NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE laboratorio(
    id int NOT NULL AUTO_INCREMENT,
    nome_fantasia varchar(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE principio_ativo(
    id int NOT NULL AUTO_INCREMENT,
    descricao varchar(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE forma_farmaceutica(
    id int NOT NULL AUTO_INCREMENT,
    descricao varchar(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE concentracao(
    id int NOT NULL AUTO_INCREMENT,
    concentracao varchar(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE medicamento_concentracao(
    id int NOT NULL AUTO_INCREMENT,
    medicamento int NOT NULL,
    concentracao int NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE uso(
    id int NOT NULL AUTO_INCREMENT,
    descricao varchar(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE medicamento_uso(
    id int NOT NULL AUTO_INCREMENT,
    medicamento int NOT NULL,
    uso int NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE medicamento
ADD FOREIGN KEY (principio_ativo) REFERENCES principio_ativo(id);
ALTER TABLE medicamento
ADD FOREIGN KEY (laboratorio) REFERENCES laboratorio(id);
ALTER TABLE medicamento
ADD FOREIGN KEY (forma) REFERENCES forma_farmaceutica(id);
ALTER TABLE medicamento_concentracao
ADD FOREIGN KEY (medicamento) REFERENCES medicamento(id);
ALTER TABLE medicamento_concentracao
ADD FOREIGN KEY (concentracao) REFERENCES concentracao(id);
ALTER TABLE medicamento_uso
ADD FOREIGN KEY (medicamento) REFERENCES medicamento(id);
ALTER TABLE medicamento_uso
ADD FOREIGN KEY (uso) REFERENCES uso(id);

/*
medicamento
id 
nome comercial
principio ativo
composição
laboratório
forma
generico



laboratório
id
nome fantasia



principio_ativo
id
descricao



forma_farmaceutica
id
descricao


concentracao
id
contentracao

medicamento_concentracao
id
medicamento
concentracao



uso
id
descricao


medicamento_uso
id
medicamento
uso
*/