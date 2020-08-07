SELECT 
	T02.Empresa AS Emp,
	COUNT(T01.Id) AS Contagem
FROM Candidato T01
	JOIN Oportunidade T02 ON T01.OportunidadeId =T02.Id
--WHERE T02.Empresa = 'Petrobrás'
--ORDER BY T01.Nome, T01.OportunidadeId ASC
--GROUP BY T02.Empresa