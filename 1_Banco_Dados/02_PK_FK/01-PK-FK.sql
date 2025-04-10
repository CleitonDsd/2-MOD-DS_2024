CREATE DATABASE db_aula_pk_fk;
USE db_aula_pk_fk;

CREATE TABLE cursos(	
    id_curso INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR (100) NOT NULL, 
    descricao VARCHAR (255)
    
);

CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,    
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL, 
    email VARCHAR (100) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    id_curso INT, 
    telefone VARCHAR (20),
    CONSTRAINT fk_aluno_curso FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE materias (
    materia_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_curso INT,  
    professor VARCHAR(100), 
    carga_horaria INT NOT NULL,
    CONSTRAINT fk_materias_cursos FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

