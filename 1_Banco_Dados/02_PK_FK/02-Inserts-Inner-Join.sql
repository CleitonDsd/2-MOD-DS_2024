USE db_aula_pk_fk;
INSERT INTO 
	cursos (nome, descricao) 
VALUES 
	('Desenvolvimento de Sistemas', 'Curso voltado para desenvolvimento de software e boas práticas.'),
	('Administração', 'Curso sobre análise e administração de empresas'),
	('Nutrição', 'Curso sobre nutrologia, cadeia alimentar e saúde humuna.');
    
SELECT * FROM cursos;

USE db_aula_pk_fk;
INSERT INTO 
	materias (nome, id_curso, professor, carga_horaria) 
VALUES
	('Banco de Dados II', 1, 'Cleiton da Silva', 60),
	('Gestão e Administração de Empresas I', 2, 'Thiago Pascoto', 50),
	('Cálculos de Biopedância', 3, 'Miriam Machado', 55);

select * from materias;


USE db_aula_pk_fk;
INSERT INTO 
	alunos (nome, idade, email, data_nascimento, id_curso, telefone) 
VALUES
	('Geovanna Passos', 23, 'geovanna.passos@etec.gov.br', '2001-05-10', 1, '(11) 91234-5678'),
	('Michael Jackson', 25, 'michael.jackson@etec.gov.br', '1999-08-22', 2, '(21) 99876-5432'),
	('Renata Fan', 24, 'renata.fan@etec.gov.br', '2000-12-03', 3, '(31) 98765-4321');

select * from alunos;

SELECT 
	alunos.nome, cursos.nome 
FROM 
	alunos
INNER JOIN
	cursos 
ON 
	alunos.id_curso = cursos.id_curso;
    
/*desafio 1*/
SELECT 
	materias.nome AS Matéria,
    materias.professor, 
    cursos.nome AS Curso
FROM 
	materias
INNER JOIN 
	cursos
ON materias.id_curso = cursos.id_curso;


/*desafio 2*/
SELECT 
    cursos.nome AS curso, 
    COUNT(materias.materia_id) AS total_materias
FROM 
	cursos
INNER JOIN 
	materias 
ON 
	cursos.id_curso = materias.id_curso
GROUP BY 
	cursos.nome;




