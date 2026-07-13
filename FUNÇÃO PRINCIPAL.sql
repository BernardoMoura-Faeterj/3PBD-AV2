SELECT
    c.nome         AS candidato,
    i.id_inscricao AS numero_inscricao,
    p.nota
FROM inscricao i
JOIN candidato c ON i.id_candidato = c.id_candidato
JOIN prova p     ON p.id_inscricao = i.id_inscricao
WHERE p.nota >= 60
ORDER BY p.nota DESC;


UPDATE questao SET status = 'Anulada' WHERE id_questao = 2;

UPDATE prova p
SET nota = (
    SELECT CASE
             WHEN COUNT(*) = 0 THEN NULL
             ELSE ROUND(SUM(CASE WHEN rc.acertou = 1 OR q.status = 'Anulada' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2)
           END
    FROM resposta_candidato rc
    JOIN questao q ON q.id_questao = rc.id_questao
    WHERE rc.id_prova = p.id_prova
);


SELECT
    c.nome         AS candidato,
    i.id_inscricao AS numero_inscricao,
    p.nota
FROM inscricao i
JOIN candidato c ON i.id_candidato = c.id_candidato
JOIN prova p     ON p.id_inscricao = i.id_inscricao
WHERE p.nota >= 60
ORDER BY p.nota DESC;
