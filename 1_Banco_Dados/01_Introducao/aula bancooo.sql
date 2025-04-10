A Primary Key (PK) ou Chave Primária é um campo (ou conjunto de campos) que identifica unicamente cada registro em uma tabela do banco de dados.

📌 Características da PK:
✔ Valor único → Não pode haver dois registros com o mesmo valor.
✔ Não pode ser NULL → Sempre deve ter um valor definido.
✔ Uma por tabela → Cada tabela pode ter apenas uma Primary Key.

------------------------

A Foreign Key (FK) ou Chave Estrangeira é um campo em uma tabela que referencia a Primary Key (PK) de outra tabela. Ela estabelece um relacionamento entre os dados, garantindo a integridade referencial no banco de dados.

🔹 Principais Características da Foreign Key:
Relaciona duas tabelas.
O valor deve corresponder a uma Primary Key existente na outra tabela.
Impede a exclusão de registros que estejam sendo referenciados (a menos que seja usado ON DELETE CASCADE).

✅ PK (Primary Key): Identifica um registro de forma única na tabela.
✅ FK (Foreign Key): Relaciona duas tabelas, referenciando uma PK.

------------------------------------------------------------------------


CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    ano_publicacao INT NOT NULL,
    disponivel BOOLEAN DEFAULT TRUE
);


CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15) NOT NULL
);

CREATE TABLE emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_livro INT,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro) ON DELETE CASCADE
);

git config --global user.email ""

id_emprestimo é a Primary Key.
id_usuario e id_livro são Foreign Keys.
ON DELETE CASCADE: Se um usuário ou livro for apagado, o empréstimo correspondente também será.

-- DML

INSERT INTO livros (titulo, autor, ano_publicacao) VALUES
('Dom Casmurro', 'Machado de Assis', 1899),
('1984', 'George Orwell', 1949);


INSERT INTO usuarios (nome, email, telefone) VALUES
('Carlos Souza', 'carlos@email.com', '11999999999'),
('Ana Lima', 'ana@email.com', '21988888888');


INSERT INTO emprestimos (id_usuario, id_livro, data_emprestimo, data_devolucao)
VALUES (1, 2, '2025-03-27', NULL);


SELECT e.id_emprestimo, u.nome AS usuario, l.titulo AS livro, e.data_emprestimo
FROM emprestimos e
JOIN usuarios u ON e.id_usuario = u.id_usuario
JOIN livros l ON e.id_livro = l.id_livro;


UPDATE emprestimos SET data_devolucao = '2025-04-05' WHERE id_emprestimo = 1;



 PK (Chave Primária) → id_livro, id_usuario, id_emprestimo.
✅ FK (Chave Estrangeira) → id_usuario e id_livro na tabela emprestimos.
✅ ON DELETE CASCADE → Mantém integridade referencial.
✅ Consultas JOIN → Relacionam livros, usuários e empréstimos.

----------------------------------

Criar duas tabelas no MySQL:

    cursos → Armazena os cursos disponíveis.

    matriculas → Registra quais alunos se matricularam nos cursos.

    A tabela cursos deve ter:

        id_curso como Primary Key (PK).

        nome para o nome do curso.

        carga_horaria para a duração do curso.

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);

---------------------
 Passo 2: Criar a Tabela matriculas
    A tabela matriculas deve ter:

        id_matricula como Primary Key (PK).

        aluno para o nome do aluno.

        id_curso como Foreign Key (FK) referenciando cursos(id_curso).

CREATE TABLE matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    aluno VARCHAR(100) NOT NULL,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso) ON DELETE CASCADE
);

ON DELETE CASCADE: Se um curso for excluído, todas as matrículas desse curso também serão excluídas automaticamente.


-- DML 

INSERT INTO cursos (nome, carga_horaria) VALUES
('Programação em Java', 40),
('Banco de Dados MySQL', 30);

INSERT INTO matriculas (aluno, id_curso) VALUES
('Carlos Souza', 1),
('Ana Lima', 2);

-- DQL

SELECT matriculas.id_matricula, matriculas.aluno, cursos.nome AS curso
FROM matriculas
JOIN cursos ON matriculas.id_curso = cursos.id_curso;



O INNER JOIN é um comando SQL usado para combinar registros de duas tabelas, retornando apenas os registros que têm correspondência em ambas as tabelas.

📌 Resumindo: Ele une tabelas baseando-se em uma Foreign Key (FK) que referencia uma Primary Key (PK).


INNER JOIN → Retorna somente os registros que têm correspondência.

