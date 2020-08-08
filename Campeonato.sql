CREATE VIEW VW_Clube_Partidas
AS
	SELECT 
		MandanteId AS Clube,
		COUNT(Id) AS Count
	FROM Partida
	GROUP BY MandanteId

	UNION

	SELECT 
		VisitanteId AS Clube,
		COUNT(Id) AS Count
	FROM Partida
	GROUP BY VisitanteId

CREATE VIEW VW_Clube_Total_Partidas
AS
	SELECT 
		Clube AS ClubeId,
		SUM(Count) AS Total
	FROM VW_Clube_Partidas	
	GROUP BY Clube

SELECT 
	T01.Nome AS Clube,
	T01.Pontos,
	VW01.Total AS TotalPartidas
FROM VW_Clube_Total_Partidas VW01
	JOIN Clube T01 ON T01.Id = VW01.ClubeId

SELECT 
	Clube,	
	SUM(Count)
FROM VW_Clube_Partidas 
GROUP BY Clube


--ALTER PROCEDURE PRC_Placar
--	@MandanteId INT,
--	@VisitanteId INT,
--	@GolsMandante INT,
--	@GolsVisitante INT
--AS
--BEGIN
--	DECLARE @PontosMandante INT = (SELECT Pontos FROM Clube WHERE Id = @MandanteId)
--	DECLARE @PontosVisitante INT = (SELECT Pontos FROM Clube WHERE Id = @VisitanteId)
--
--	INSERT INTO Partida (MandanteId, VisitanteId, GolsMandante, GolsVisitante) VALUES (@MandanteId,@VisitanteId,@GolsMandante,@GolsVisitante)
--
--	IF (@GolsMandante > @GolsVisitante)
--	BEGIN
--		UPDATE Clube SET Pontos = @PontosMandante + 3 WHERE Id = @MandanteId
--	END
--
--	IF (@GolsVisitante > @GolsMandante)
--	BEGIN
--		UPDATE Clube SET Pontos = @PontosVisitante + 3 WHERE Id = @VisitanteId
--	END
--
--	IF (@GolsVisitante = @GolsMandante)
--	BEGIN
--		UPDATE Clube SET Pontos = @PontosMandante + 1 WHERE Id = @MandanteId
--		UPDATE Clube SET Pontos = @PontosVisitante + 1 WHERE Id = @VisitanteId
--	END
--END

--INSERT INTO Partida (MandanteId, VisitanteId, GolsMandante, GolsVisitante) VALUES (1, 10, 0, 10)


--SELECT
--	T02.Nome AS Mandante,
--	T01.GolsMandante AS Gols,
--	T01.GolsVisitante AS Gols,
--	T03.Nome AS Visitantes
--FROM Partida T01	
--	JOIN Clube T02 ON T02.Id = T01.MandanteId --Relação com o mandante
--	JOIN Clube T03 ON T03.Id = T01.VisitanteId -- Relação com o visitante


--LEFT JOIN
--SELECT 
--	Jogador.Nome,
--	CASE 
--		WHEN Clube.Nome IS NULL THEN '(SEM CLUBE)'
--		ELSE Clube.Nome
--	END AS Clube,
--	Posicao.Descricao AS 'Posição'
--
--FROM Jogador
--	LEFT JOIN Clube ON Jogador.ClubeId = Clube.Id
--	JOIN Posicao ON Posicao.Id = Jogador.PosicaoId

--WHERE Clube.Id IS NULL

--INNER JOIN
--SELECT 
--	Jogador.Nome,
--	Clube.Nome AS Clube,
--	Posicao.Descricao AS 'Posição'
--FROM Jogador
--	JOIN Clube ON Clube.Id = Jogador.ClubeId
--	JOIN Posicao ON Posicao.Id = Jogador.PosicaoId