SET SERVEROUTPUT ON;

CREATE TABLE tb_departamento(
    cod_departamento INT PRIMARY KEY NOT NULL,
    nome VARCHAR2(200)
);

--DROP TABLE tb_departamento;


CREATE TABLE tb_disciplina (
    cod_disciplina INT PRIMARY KEY,
    nome VARCHAR2 (50),
    descricao VARCHAR2 (300),
    cod_departamento INT,
    CONSTRAINT fk_departamento FOREIGN KEY (cod_departamento) REFERENCES tb_departamento (cod_departamento)
);

--ALTER TABLE tb_disciplina
--DROP CONSTRAINT fk_departamento;

--DROP TABLE tb_disciplina;


CREATE TABLE tb_pre_requisito (
    cod_liberacao INT PRIMARY KEY,
    cod_liberada INT,
    cod_liberadora INT,
    CONSTRAINT fk_liberada FOREIGN KEY (cod_liberada) REFERENCES tb_disciplina (cod_disciplina),
    CONSTRAINT fk_liberadora FOREIGN KEY (cod_liberadora) REFERENCES tb_disciplina (cod_disciplina)
);

--ALTER TABLE tb_pre_requisito
--DROP CONSTRAINT fk_liberada;
--ALTER TABLE tb_pre_requisito
--DROP CONSTRAINT fk_liberadora;

--DROP TABLE tb_pre_requisito;

CREATE TABLE tb_curso (
    cod_curso INT PRIMARY KEY,
    nome VARCHAR2 (200) NOT NULL
);

--DROP TABLE tb_curso;

CREATE TABLE tb_disciplina_curso(
    cod_disc_curso INT PRIMARY KEY,
    cod_disciplina INT,
    cod_curso INT,
    CONSTRAINT fk_disciplina FOREIGN KEY (cod_disciplina) REFERENCES tb_disciplina (cod_disciplina),
    CONSTRAINT fk_curso  FOREIGN KEY (cod_curso) REFERENCES tb_curso (cod_curso)
);

--ALTER TABLE tb_disciplina_curso
--DROP CONSTRAINT fk_disciplina;
--ALTER TABLE tb_disciplina_curso
--DROP CONSTRAINT fk_curso;

--DROP TABLE tb_disciplina_curso;

CREATE TABLE tb_aluno (
    cod_aluno INT PRIMARY KEY NOT NULL,
    nome VARCHAR2 (200),
    cod_curso INT,
    CONSTRAINT fk_aluno_curso FOREIGN KEY (cod_curso) REFERENCES tb_curso (cod_curso)
);

--ALTER TABLE tb_aluno
--DROP CONSTRAINT fk_aluno_curso;


--DROP TABLE tb_aluno;

--EXERCICIO 1.4

CREATE TABLE tb_login (
    cod_log INT PRIMARY KEY,
    data_hora TIMESTAMP,
    operacao VARCHAR (7)
    );
    
DROP TABLE tb_login;

--TABELA DEPARTAMENTO
    
CREATE TRIGGER trg_registra_log AFTER INSERT ON tb_departament
FOR EACH ROW
BEGIN
    INSERT INTO tb_login (data_hora) VALUES (CURRENT_TIMESTAMP);
    INSERT INTO tb_login (operacao) VALUES ('INSERT');
END;

CREATE TRIGGER trg_deleta_log AFTER DELETE ON tb_departamento
FOR EACH ROW
BEGIN
    INSERT INTO tb_login (data_hora) VALUES (CURRENT_TIMESTAMP);
    INSERT INTO tb_login (operacao) VALUES ('DELETE');
END;

CREATE TRIGGER trg_update_log AFTER UPDATE ON tb_departamento
FOR EACH ROW
BEGIN
    INSERT INTO tb_login (data_hora) VALUES (CURRENT_TIMESTAMP);
    INSERT INTO tb_login (operacao) VALUES ('UPDATE');
END;

DROP TRIGGER trg_registra_log;
DROP TRIGGER trg_deleta_log;
DROP TRIGGER trg_update_log;

--TABELA DISCIPLINA

CREATE TRIGGER trg_reg_log AFTER INSERT ON tb_disciplina
FOR EACH ROW
BEGIN
    INSERT INTO tb_login (data_hora) VALUES (CURRENT_TIMESTAMP);
    INSERT INTO tb_login (operacao) VALUES ('INSERT');
END;



CREATE TRIGGER trg_del_log AFTER DELETE ON tb_disciplina
FOR EACH ROW
BEGIN
    INSERT INTO tb_login (data_hora) VALUES (CURRENT_TIMESTAMP);
    INSERT INTO tb_login (operacao) VALUES ('DELETE');
END;

CREATE TRIGGER trg_up_log AFTER UPDATE ON tb_disciplina
FOR EACH ROW
BEGIN
    INSERT INTO tb_login (data_hora) VALUES (CURRENT_TIMESTAMP);
    INSERT INTO tb_login (operacao) VALUES ('UPDATE');
END;

DROP TRIGGER trg_reg_log;
DROP TRIGGER trg_del_log;
DROP TRIGGER trg_up_log;

--TABELA CURSO

CREATE TRIGGER trg_insere_log AFTER INSERT ON tb_curso
FOR EACH ROW
BEGIN
    INSERT INTO tb_login (data_hora) VALUES (CURRENT_TIMESTAMP);
    INSERT INTO tb_login (operacao) VALUES ('INSERT');
END;

CREATE TRIGGER trg_apaga_log AFTER DELETE ON tb_curso
FOR EACH ROW
BEGIN
    INSERT INTO tb_login (data_hora) VALUES (CURRENT_TIMESTAMP);
    INSERT INTO tb_login (operacao) VALUES ('DELETE');
END;

CREATE TRIGGER trg_atualiza_log AFTER UPDATE ON tb_curso
FOR EACH ROW
BEGIN
    INSERT INTO tb_login (data_hora) VALUES (CURRENT_TIMESTAMP);
    INSERT INTO tb_login (operacao) VALUES ('UPDATE');
END;

DROP TRIGGER trg_insere_log;
DROP TRIGGER trg_apaga_log;
DROP TRIGGER trg_atualiza_log;

--TABELA ALUNO

CREATE TRIGGER trg_inserir_log AFTER INSERT ON tb_aluno
FOR EACH ROW
BEGIN
    INSERT INTO tb_login (data_hora) VALUES (CURRENT_TIMESTAMP);
    INSERT INTO tb_login (operacao) VALUES ('INSERT');
END;

CREATE TRIGGER trg_deletar_log AFTER DELETE ON tb_aluno
FOR EACH ROW
BEGIN
    INSERT INTO tb_login (data_hora) VALUES (CURRENT_TIMESTAMP);
    INSERT INTO tb_login (operacao) VALUES ('DELETE');
END;

CREATE TRIGGER trg_atualizar_log AFTER UPDATE ON tb_aluno
FOR EACH ROW
BEGIN
    INSERT INTO tb_login (data_hora) VALUES (CURRENT_TIMESTAMP);
    INSERT INTO tb_login (operacao) VALUES ('UPDATE');
END;

DROP TRIGGER trg_inserir_log;
DROP TRIGGER trg_deletar_log;
DROP TRIGGER trg_atualizar_log;


--EXERCICIO 1.3

--TABELA DEPARTAMENTO

CREATE SEQUENCE s_pk_departament START WITH 1 INCREMENT BY 2 CACHE 20;

CREATE TRIGGER trg_pk_course_departament BEFORE INSERT ON
tb_departamento
FOR EACH ROW
BEGIN
    :NEW.cod_departamento := s_pk_departament.NEXTVAL;
END;

DROP SEQUENCE s_pk_departament;
DROP TRIGGER trg_pk_course_departament;



--TABELA DISCIPLINA

CREATE SEQUENCE s_pk_discipline START WITH 1 INCREMENT BY 1 CACHE 20;

CREATE TRIGGER trg_pk_discipline_seq BEFORE INSERT ON
tb_disciplina
FOR EACH ROW
BEGIN
    :NEW.cod_disciplina := s_pk_discipline.NEXTVAL;
END;

DROP SEQUENCE s_pk_discipline;
DROP TRIGGER trg_pk_discipline_seq;

--TABELA CURSO

CREATE SEQUENCE s_pk_course START WITH 1 INCREMENT BY 2 CACHE 20;

CREATE TRIGGER trg_pk_course_seq BEFORE INSERT ON
tb_curso
FOR EACH ROW
BEGIN
    :NEW.cod_curso := s_pk_course.NEXTVAL;
END;

DROP SEQUENCE s_pk_course;
DROP TRIGGER trg_pk_course_seq;

--TABELA DISCIPLINA_CURSO

CREATE SEQUENCE s_pk_discipline_course START WITH 1 INCREMENT BY 1 CACHE 20;

CREATE TRIGGER trg_pk_discipline_course_seq BEFORE INSERT ON
tb_disciplina_curso
FOR EACH ROW
BEGIN
    :NEW.cod_disc_curso := s_pk_discipline_course.NEXTVAL;
END;


DROP SEQUENCE s_pk_dicipline_course;
DROP TRIGGER trg_pk_discipline_course_seq;

--TABELA PRE_REQUISITO

CREATE SEQUENCE s_pk_cod_liberacao START WITH 1 INCREMENT BY 1 CACHE 20;

CREATE TRIGGER trg_pk_cod_liberacao_seq BEFORE INSERT ON
tb_pre_requisito
FOR EACH ROW
BEGIN
    :NEW.cod_liberacao := s_pk_cod_liberacao.NEXTVAL;
END;

DROP SEQUENCE s_pk_cod_liberacao;
DROP TRIGGER trg_pk_cod_liberacao_seq;

--TABELA ALUNO

CREATE SEQUENCE s_pk_student START WITH 1000 INCREMENT BY 7 CACHE 20;

CREATE TRIGGER trg_pk_student_seq BEFORE INSERT ON
tb_aluno
FOR EACH ROW
BEGIN
    :NEW.cod_aluno := s_pk_student.NEXTVAL;
END;

DROP SEQUENCE s_pk_student;
DROP TRIGGER trg_pk_student_seq;

--TABELA LOG

CREATE SEQUENCE s_pk_login START WITH 1 INCREMENT BY 1 CACHE 20;

CREATE TRIGGER trg_pk_login_seq BEFORE INSERT ON
tb_login
FOR EACH ROW
BEGIN
    :NEW.cod_log := s_pk_login.NEXTVAL;
END;

DROP SEQUENCE s_pk_login;
DROP TRIGGER trg_pk_login_seq;


--EXERCICIO 1.2


CREATE OR REPLACE FUNCTION id_aluno_retorna_curso (cod NUMBER ) RETURN VARCHAR IS
BEGIN
    SELECT  tb_curso.nome
    FROM tb_curso, tb_aluno 
    WHERE cod = cod_aluno
    AND cod_curso = cod_curso;
END;
BEGIN
    dbms_output.put_line(id_aluno_retorna_curso(1));
END;


--EXERCICIO 1.1

CREATE OR REPLACE PROCEDURE nome_da_disciplina (cod NUMBER) IS
BEGIN
    SELECT  tb_disciplina.nome
    FROM tb_disciplina 
    WHERE cod = cod_disciplina;
END;

EXECUTE nome_da_disciplina (2);


--INSERTs()

--DEPARTAMENTO
INSERT INTO tb_departamento (nome) VALUES ('Exatas');
INSERT INTO tb_departamento (nome) VALUES ('Humanas');
--DISCIPLINA
INSERT INTO tb_disciplina (nome, descricao, cod_departamento) VALUES ('Programação para Banco de Dados','Curso com foco em PBD com SQL e Python', 1);
INSERT INTO tb_disciplina (nome, descricao, cod_departamento) VALUES ('Programação para Dispositivos Moveis','Curso com foco em PDM usando React Native,Node e Javascript ', 1);
INSERT INTO tb_disciplina (nome, descricao, cod_departamento) VALUES ('Gestão de Equipes','Curso com foco em GE ultilizando técnicas de Gestão', 3);

DELETE FROM tb_disciplina
WHERE  nome = 'Gestão de Equipes';


--CURSO 
INSERT INTO tb_curso (nome) VALUES ('Analise e Desenvolvimento de Sistemas');
INSERT INTO tb_curso (nome) VALUES ('Eventos');

--ALUNO
INSERT INTO tb_aluno (nome,cod_curso ) VALUES ('Marcelo K. Doi', 1);
INSERT INTO tb_aluno (nome, cod_curso) VALUES ('Monique Queiroz', 3);
INSERT INTO tb_aluno (nome, cod_curso) VALUES ('Deize Turcci', 1);

--PRE_REQUISITO

INSERT INTO tb_pre_requisito (cod_liberada ) VALUES (4);
INSERT INTO tb_pre_requisito (cod_liberada) VALUES (5);
INSERT INTO tb_pre_requisito (cod_liberadora) VALUES (6);

--DISCIPLINA CURSO

INSERT INTO tb_disciplina_curso (cod_disciplina, cod_curso) VALUES (4,1);
INSERT INTO tb_disciplina_curso (cod_disciplina, cod_curso) VALUES (5,1);
INSERT INTO tb_disciplina_curso (cod_disciplina, cod_curso) VALUES (6,3);

SELECT * FROM tb_departamento;
SELECT * FROM tb_curso;
SELECT * FROM tb_disciplina;
SELECT * FROM tb_aluno;
SELECT * FROM tb_pre_requisito;
SELECT * FROM tb_disciplina_curso;
SELECT * FROM tb_login;




