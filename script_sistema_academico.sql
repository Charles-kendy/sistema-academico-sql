
-- CREATE DATABASE sistema_academico;
-- USE sistema_academico;


SET default_storage_engine = InnoDB;


CREATE TABLE cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) UNIQUE NOT NULL,
    duracao INT NOT NULL,
    carga_horaria INT NOT NULL
);


CREATE TABLE professores (
    id_professor INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL
);









CREATE TABLE alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(255) NOT NULL,
    matricula VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);


CREATE TABLE disciplinas (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);


CREATE TABLE turmas (
    id_turma INT PRIMARY KEY AUTO_INCREMENT, 
    id_disciplina INT NOT NULL,
    id_professor INT NOT NULL,
    semestre VARCHAR(10) NOT NULL,
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor)
);





CREATE TABLE matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT, 
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    UNIQUE (id_aluno, id_turma), 
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES turmas(id_turma)
);


CREATE TABLE notas (
    id_nota INT PRIMARY KEY AUTO_INCREMENT, 
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    nota DECIMAL(4,2) NOT NULL,
    UNIQUE (id_aluno, id_turma), 
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES turmas(id_turma)
);
