Use CountryPersons;
Select * from Country;
Select * from Persons;
SELECT Country_name, SUBSTRING(Country_name, 1, 3) AS FirstThreeChars 
FROM Country;

SELECT Fname, Lname, CONCAT(Fname, ' ', Lname) AS FullName  
FROM Persons;

SELECT COUNT(DISTINCT Country_name) AS UniqueCountryCount 
FROM Persons;

SELECT MAX(Population) AS MaxPopulation 
FROM Persons;

SELECT MAX(Population) AS MaxPopulation 
FROM Country;

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(11, 'James', null, 33100000, 46.5, 1, 'USA'),
(12, 'Janes', NULL, 38009000, 3.8, 2, 'Canada');


SELECT COUNT(Lname) AS LnameCount  
FROM Persons;

SELECT COUNT(*) AS TotalRows  
FROM Persons;

SELECT Population  
FROM Country  
ORDER BY Population DESC  
LIMIT 3;

SELECT *  
FROM Country  
ORDER BY RAND()  
LIMIT 3;

SELECT *  
FROM Persons  
ORDER BY Rating DESC;

SELECT P.Fname, C.Country_name, C.Population  
FROM Persons P  
JOIN Country C ON P.Id = C.Id;

SELECT C.Country_name, C.Population  
FROM Persons P  
JOIN Country C ON P.Id = C.Id  
GROUP BY C.Country_name, C.Population  
HAVING C.Population > 50000;

SELECT C.Country_name,  
       COUNT(P.Id) AS TotalPersons,  
       AVG(P.Rating) AS AvgRating  
FROM Persons P  
JOIN Country C ON P.Id = C.Id  
GROUP BY C.Country_name  
HAVING COUNT(P.Id) > 2  
ORDER BY AvgRating ASC;










