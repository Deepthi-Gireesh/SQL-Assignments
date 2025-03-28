
Use CountryPersons;
/* INNER JOIN*/
SELECT Persons.Id, Persons.Fname, Country.Country_name
FROM Persons
INNER JOIN Country ON Persons.Id = Country.Id;
/*LEFT JOIN*/
SELECT Persons.Id, Persons.Fname, Country.Country_name
FROM Persons
LEFT JOIN Country ON Persons.Id = Country.Id;
/* RIGHT JOIN*/
SELECT Persons.Id, Persons.Fname, Country.Country_name
FROM Persons
RIGHT JOIN Country ON Persons.Id = Country.Id;
/* Union */

SELECT DISTINCT Country.Country_name FROM Country
UNION
SELECT DISTINCT Country.Country_name 
FROM Persons 
LEFT JOIN Country ON Persons.Id = Country.Id;


SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

SELECT Id, Fname, ROUND(Rating) AS RoundedRating 
FROM Persons;




