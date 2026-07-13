INSERT INTO concurso (nome, tipo)
VALUES ('Concurso Prefeitura Rio', 'Municipal');

SELECT * FROM concurso WHERE id_concurso = 1;

UPDATE concurso
SET tipo = 'Estadual'
WHERE id_concurso = 1;

DELETE FROM concurso WHERE id_concurso = 1;


INSERT INTO cargo (id_concurso, nome_cargo)
VALUES (1, 'Analista Administrativo');

SELECT * FROM cargo WHERE id_cargo = 1;

UPDATE cargo
SET nome_cargo = 'Analista Administrativo Jr.'
WHERE id_cargo = 1;

DELETE FROM cargo WHERE id_cargo = 1;


INSERT INTO fiscal (nome)
VALUES ('Ana Lima');

SELECT * FROM fiscal WHERE id_fiscal = 1;

UPDATE fiscal
SET nome = 'Ana Lima Souza'
WHERE id_fiscal = 1;

DELETE FROM fiscal WHERE id_fiscal = 1;


INSERT INTO sala (id_fiscal, numero_sala, nome_escola, endereco)
VALUES (1, 101, 'Escola Estadual Rio', 'Av. Principal, 1000, Rio de Janeiro');

SELECT * FROM sala WHERE id_sala = 1;

UPDATE sala
SET numero_sala = 105
WHERE id_sala = 1;

DELETE FROM sala WHERE id_sala = 1;


INSERT INTO candidato (nome, email, cpf, login, senha, endereco)
VALUES ('Gabriel Barbosa', 'gabigol@email.com', '111.111.111-11',
        'gabigol', 'senha2019', 'Maracanã, 500, Rio de Janeiro');

SELECT * FROM candidato WHERE id_candidato = 1;

UPDATE candidato
SET endereco = 'Rua Nova, 45, Rio de Janeiro'
WHERE id_candidato = 1;

DELETE FROM candidato WHERE id_candidato = 1;


INSERT INTO inscricao (id_candidato, id_cargo, id_sala, status_inscricao)
VALUES (1, 1, 1, 'Pendente');

SELECT * FROM inscricao WHERE id_inscricao = 1;

UPDATE inscricao
SET status_inscricao = 'Confirmada'
WHERE id_inscricao = 1;

DELETE FROM inscricao WHERE id_inscricao = 1;


INSERT INTO prova (id_inscricao, data_prova, peso, status)
VALUES (1, '2026-08-15', 1.00, 'Agendada');

SELECT * FROM prova WHERE id_prova = 1;

UPDATE prova
SET nota = 50.00, status = 'Realizada'
WHERE id_prova = 1;

DELETE FROM prova WHERE id_prova = 1;


INSERT INTO questao (enunciado, gabarito) VALUES
('Qual a função do sujeito na oração?', 'B'),
('Quanto é 2 elevado a 8?', 'B');

SELECT * FROM questao WHERE id_questao = 1;

UPDATE questao
SET status = 'Anulada'
WHERE id_questao = 2;

DELETE FROM questao WHERE id_questao = 1;


INSERT INTO alternativa (id_questao, letra, descricao) VALUES
(1, 'A', 'Predicado'),
(1, 'B', 'Sujeito'),
(1, 'C', 'Objeto'),
(1, 'D', 'Adjunto');

SELECT * FROM alternativa WHERE id_questao = 1;

UPDATE alternativa
SET descricao = 'Sujeito da oração'
WHERE id_alternativa = 2;

DELETE FROM alternativa WHERE id_questao = 1;


INSERT INTO resposta_candidato (id_prova, id_questao, opcao_marcada, acertou) VALUES
(1, 1, 'B', 1),
(1, 2, 'C', 0);

SELECT * FROM resposta_candidato WHERE id_prova = 1;

UPDATE resposta_candidato
SET opcao_marcada = 'C', acertou = 0
WHERE id_prova = 1 AND id_questao = 1;

DELETE FROM resposta_candidato WHERE id_prova = 1 AND id_questao = 1;


INSERT INTO recurso (id_inscricao, id_questao, justificativa, status_recurso)
VALUES (1, 2, 'A questão está ambígua pois aceita mais de uma resposta correta.', 'Pendente');

SELECT * FROM recurso WHERE id_recurso = 1;

UPDATE recurso
SET status_recurso = 'Deferido'
WHERE id_recurso = 1;

DELETE FROM recurso WHERE id_recurso = 1;
