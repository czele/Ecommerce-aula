-- Selecionar registro na tabela
SELECT 
	* 
FROM 
	Candidato

--Adicionar registro na tabela
INSERT INTO Candidato 
	(Nome, 
	Email) 
VALUES 
	('Ant�nio', 
	'antonio@antonio.com')

--Atualizar registros (toda vez que for dar update tem que ter where no SELECT)
UPDATE Candidato SET 
	Nome = 'Jo�o da Silva' 
WHERE Id = 2

--Deletar registros
DELETE FROM Candidato 
WHERE Id = 3